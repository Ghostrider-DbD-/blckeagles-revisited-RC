#define aiDifficulty "Red"
#define minAI 3
#define maxAI 6
#define minPatrolRadius 30
#define maxPatrolRadius 45
#define AI_respawnTime 600
#define aiVehiclePatrolRadius 75
#define vehiclePatrolRespawnTime 600
#define staticWeaponRespawnTime 600
#define aiAircraftPatrolRespawnTime 600
#define aiAircraftPatrolRadius 1700
#define oddsOfGarrison 0.67
#define maxGarrisonStatics 3
#define maxGarrisonUnits 4
#define typesGarrisonStatics []  //  When empty a static will be randomly chosen from the defaults for blckeagls
#define garrisonMarkerObject "Sign_Sphere100cm_F"  //  This can be anything you like. I find this large sphere easy to see and convenient.
#define unitMarkerObject "Sign_Arrow_Direction_Green_F"  //  This can be anything. I chose this arrow type because it allows you to easily indicate direction. 
#define objectAtMissionCenter "RoadCone_L_F"
#define lootVehicleMarker "Sign_Arrow_F"
#define landVehicles "LandVehicle"

private _entities = all3DENEntities;
diag_log format["Dynamic Export called at %1",diag_tickTime];
if (isNil "blck_dynamicStartMessage") then 
{
	blck_dynamicStartMessage = "TODO: Change approiately";
};
if (isNil "blck_dynamicEndMessage") then 
{
	blck_dynamicEndMessage = "TODO: Change Appropriately";
};
if (isNil "blck_dynamicCrateLoot") then 
{
	blck_dynamicCrateLoot = "_crateLoot = blck_BoxLoot_Green;";
};
if (isNil "blck_dynamicCrateLootCounts") then {
	blck_dynamicCrateLootCounts = "_lootCounts = blck_lootCountsGreen;";
};
if (isNil "blck_dynamicmarkerMissionName") then 
{
	blck_dynamicmarkerMissionName = "TODO: Update appropriately";
};
if (isNil "blck_dynamicMissionDifficulty") then 
{
	blck_dynamicMissionDifficulty = "Blue";
};

private _markers = _entities select 5;
diag_log format["_markers = %1",_markers];
private ["_m1","_type","_shape","_size","_color","_brush"];
if !(_markers isEqualTo []) then {
	_m1 = _markers select 0;
	_type = markerType _m1;
	_shape = markerShape _m1;
	_size = markerSize _m1;
	_color = markerColor _m1;
	_brush = markerBrush _m1;
	CENTER = markerPos _m1;
} else {
	_type = "mil_square";
	_shape = "null";
	_size = "[0,0]";
	_color = "COLORRED";
	_brush = "null";
	CENTER = [0,0,0];
};
diag_log format["_m1 = %1 | _type = %2 | _shape = %3 | _size = %4 | _color = %5 | _brush = %6",_m1,markerType _m1,markerShape _m1,MarkerSize _m1, markercolor _m1,markerbrush _m1];
private _garrisonedBuildings = [];
private _missionLootVehicles = [];

private _staticObjects = allMissionObjects "Static" select {!(isSimpleObject _x) && (_x in _garrisonedBuildings) && !((typeOf _x) isEqualTo unitMarkerObject) && !((typeOf _x) isEqualTo garrisonMarkerObject)};
if (CENTER isEqualTo [0,0,0]) then {CENTER = getPosATL (_staticObjects select 0)};
private _missionLandscape = [];
diag_log format["_missionLandscape: %1",_staticObjects];
{
	_missionLandscape pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x, 'true','true'];
}forEach _staticObjects;

private _simpleObjects = allMissionObjects "Static" select {isSimpleObject _x};
diag_log format["_simpleObjects = %1",_simpleObjects];
private _missionSimpleObjects = [];
{
	if !(_x in _garrisonedBuildings && !((typeOf _x) isEqualTo unitMarkerObject) && !((typeOf _x) isEqualTo garrisonMarkerObject)) then
	{
		_missionSimpleObjects pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x, 'true','true'];
	};	
} forEach _simpleObjects;

private _missionPatrolVehicles = [];
private _patrolVehicles = ((allMissionObjects "Car") + (allMissionObjects "Tank") + allMissionObjects "Ship") select {!((typeOf _x) isKindOf "SDV_01_base_F") && !(_x in _missionLootVehicles)};
diag_log format["_patrolVehicles = _count = %2 | %1",_patrolVehicles,count _patrolVehicles];
{
	_missionPatrolVehicles pushBack format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x];
}forEach _patrolVehicles;

private _subs = allMissionObjects "SDV_01_base_F" select {((typeOf _x) isKindOf "SDV_01_base_F") && !(_x in _missionLootVehicles)};
private _subPatrols = [];
diag_log format["_subs = %1",_subs];
{
	_lines pushBack format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x];
} forEach _subs;

private _airvehicles = allMissionObjects "Air";
private _airPatrols = [];
diag_log format["_airPatrolvehicles = %1",_airvehicles];
{
	_airPatrols pushBack format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x, 'true','true'];
} forEach _airvehicles;

private _allstaticWeapons = allMissionObjects "StaticWeapon";
private _staticWeapons = [];
diag_log format["_staticWeapons = %1",_staticWeapons];
{
	_staticWeapons pushBack format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x, 'true','true'];
} forEach _allstaticWeapons;
private _isInside = false;
private _infantry = allMissionObjects "Man" select {!(surfaceIsWater (getPos _x)) && !(_isInside) && !(isPlayer _x) && ((vehicle _x isEqualTo _x))};
diag_log format["_infantry = %1",_infantry];
_infantryGroups = [];
{
	_infantryGroups pushBack format['     ,[%1,%2,%3,"%4",%5,%6]',(getPosATL _x) vectorDiff CENTER,minAI,maxAI,aiDifficulty,minPatrolRadius,maxPatrolRadius];
} forEach _infantry;

private _scuba = allMissionObjects "Man" select {(surfaceIsWater (getPos _x)) && !(_isInside) && !(isPlayer _x) && ((vehicle _x isEqualTo _x))};
diag_log format["_scuba = %1",_scuba];
private _scubaGroups = [];
{
	_scubaGroups pushBack format['     [%1,%2,%3,"%4",%5,%6]',(getPosATL _x) vectorDiff CENTER,minAI,maxAI,aiDifficulty,minPatrolRadius,maxPatrolRadius];
} forEach _scuba;

private _lootBoxes = ((allMissionObjects "ReammoBox") + (allMissionObjects "ReammoBox_F"));
diag_log format["_lootBoxes = %1",_lootBoxes];
private _lootContainers = [];
{
	_lootContainers pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x) vectorDiff CENTER, '_crateLoot','_lootCounts',getDir _x];
}forEach _lootBoxes;

private _lines = [];
private _lineBreak = toString [10];

_lines pushBack "/*";
_lines pushBack "	Output from GRG Plugin for blckeagls";
_lines pushBack "	For Credits and Acknowledgements see the Readme and comments";
_lines pushBack "*/";
_lines pushBack "";
_lines pushBack '#include "\q\addons\custom_server\Configs\blck_defines.hpp";';
_lines pushBack '#include "\q\addons\custom_server\Missions\privateVars.sqf";';
_lines pushBack "";
_lines pushBack format["_markerType = %1",format["[%1,%2,%3];",_type,_size,_brush]];
_lines pushBack format["_markerColor = %1;",_color];
_lines pushBack format['_startMsg = %1;',blck_dynamicStartMessage];
_lines pushBack format['_endMsg = %1;',blck_dynamicEndMessage];
_lines pushBack format['_markerMissionName = %1;',blck_dynamicmarkerMissionName];
_lines pushBack format['_crateLoot = blck_BoxLoot_%1;',blck_dynamicMissionDifficulty];
_lines pushBack format['_lootCounts = blck_lootCounts%1;',blck_dynamicMissionDifficulty];
_lines pushBack "";
_lines pushBack "_missionLandscape = [";
_lines pushback (_missionLandscape joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_simpleObjects = [";
_lines pushback (_simpleObjects joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack  "_missionPatrolVehicles = [";
_lines pushback (_missionPatrolVehicles joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_submarinePatrolParameters = [";
_lines pushback (_subPatrols joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_airPatrols = [";
_lines pushback (_airPatrols joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionEmplacedWeapons = [";
_lines pushback (_staticWeapons joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionGroups = [";
_lines pushback (_infantryGroups joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_scubaGroupParameters = [";
_lines pushback (_scubaGroups joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionLootBoxes = [";
_lines pushback (_lootContainers joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack '_missionLandscapeMode = "precise";'; // acceptable values are "none","random","precise"';
_lines pushBack "_useMines = blck_useMines;";
_lines pushBack format["_minNoAI = blck_MinAI_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_maxNoAI = blck_MaxAI_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_noAIGroups = blck_AIGrps_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_noVehiclePatrols = blck_SpawnVeh_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_noEmplacedWeapons = blck_SpawnEmplaced_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format ["_minNoAI = blck_MinAI_%1;",blck_dynamicMissionDifficulty];  // Setting this in the mission file overrides the defaults such as blck_MinAI_Blue
_lines pushBack format["_maxNoAI = blck_MaxAI_Blue;",blck_dynamicMissionDifficulty]; // Setting this in the mission file overrides the defaults 
_lines pushBack format["_noAIGroups = blck_AIGrps_%1;",blck_dynamicMissionDifficulty];  // Setting this in the mission file overrides the defaults 
_lines pushBack format["_noVehiclePatrols = blck_SpawnVeh_%1;",blck_dynamicMissionDifficulty];  // Setting this in the mission file overrides the defaults 
_lines pushBack format["_noEmplacedWeapons = blck_SpawnEmplaced_%1;",blck_dynamicMissionDifficulty];  // Setting this in the mission file overrides the defaults 
//  Change _useMines to true/false below to enable mission-specific settings.
_linse pushBack "_useMines = blck_useMines;";  // Setting this in the mission file overrides the defaults 
_lines pushBack "_uniforms = blck_SkinList;";  // Setting this in the mission file overrides the defaults 
_lines pushBack "_headgear = blck_headgear;";  // Setting this in the mission file overrides the defaults 
_lines pushBack "_vests = blck_vests;";
_lines pushBack "_backpacks = blck_backpacks;";
_lines pushBack format["_weaponList = ['%1'] call blck_fnc_selectAILoadout;",blck_dynamicMissionDifficulty];
_lines pushBack "_sideArms = blck_Pistols;";
_lines pushBack format["_chanceHeliPatrol = blck_chanceHeliPatrol%1;",blck_dynamicMissionDifficulty];  // Setting this in the mission file overrides the defaults 
_lines pushBack format["_noChoppers = blck_noPatrolHelis%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_missionHelis = blck_patrolHelis%1;",blck_dynamicMissionDifficulty];
_lines pushBack "";
_lines pushBack format["_chancePara = blck_chancePara%1;",blck_dynamicMissionDifficulty]; // Setting this in the mission file overrides the defaults 
_lines pushBack format["_noPara = blck_noPara%1;",blck_dynamicMissionDifficulty];  // Setting this in the mission file overrides the defaults 
_lines pushBack format["_paraTriggerDistance = 400;"]; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
_lines pushBack format["_paraSkill = '%1';",blck_dynamicMissionDifficulty];  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.
_lines pushBack format["_chanceLoot = 0.0;"]; // The chance that a loot crate will be dropped with paratroops.
_lines pushBack format["_paraLoot = blck_BoxLoot_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_paraLootCounts = blck_lootCounts%1;",blck_dynamicMissionDifficulty];  // Throw in something more exotic than found at a normal blue mission.

_lines pushBack '#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";';

// As found in fn_3DENExportTerrainBuilder.sqf
uiNameSpace setVariable ["Display3DENCopy_data", ["dynamicMission.sqf", _lines joinString _lineBreak]];
(findDisplay 313) createdisplay "Display3DENCopy";
/*
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

_chancePara = blck_chanceParaBlue; // Setting this in the mission file overrides the defaults 
_noPara = blck_noParaBlue;  // Setting this in the mission file overrides the defaults 
_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
_paraSkill = "red";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.
_chanceLoot = 0.0; // The chance that a loot crate will be dropped with paratroops.
_paraLoot = blck_BoxLoot_Blue;
_paraLootCounts = blck_lootCountsRed;  // Throw in something more exotic than found at a normal blue mission.

_spawnCratesTiming = blck_spawnCratesTiming; // Choices: "atMissionSpawnGround","atMissionEndGround","atMissionEndAir". 
						 // Crates spawned in the air will be spawned at mission center or the position(s) defined in the mission file and dropped under a parachute.
						 //  This sets the default value but can be overridden by defining  _spawnCrateTiming in the file defining a particular mission.
_loadCratesTiming = blck_loadCratesTiming; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
						// Pertains only to crates spawned at mission spawn.
						// This sets the default but can be overridden for specific missions by defining _loadCratesTiming
						
						// Examples:
						// To spawn crates at mission start loaded with gear set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionSpawn"
						// To spawn crates at mission start but load gear only after the mission is completed set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionCompletion"
						// To spawn crates on the ground at mission completion set blck_spawnCratesTiming = "atMissionEndGround" // Note that a loaded crate will be spawned.
						// To spawn crates in the air and drop them by chutes set blck_spawnCratesTiming = "atMissionEndAir" // Note that a loaded crate will be spawned.
_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
									// Setting this in the mission file overrides the defaults 