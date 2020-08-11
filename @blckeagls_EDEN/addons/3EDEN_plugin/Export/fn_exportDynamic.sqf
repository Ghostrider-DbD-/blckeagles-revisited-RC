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
CENTER = [0,0,0];

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
private _centerMarkers = allMissionObjects objectAtMissionCenter;
if !(_centerMarkers isEqualTo []) then 
{
	CENTER = getPosATL _centerMarkers select 0;
	diag_log format["CENTER defined by object %1 typeOf %2",_centerMarker,typeOf _centerMarker];
};

private _entities = all3DENEntities;
private _markers = _entities select 5;
diag_log format["_markers = %1",_markers];
private ["_m1","_type","_shape","_size","_color","_brush"];

/*
{
	diag_log format["_m1 get3EDENAttribute %1 = %2",_x, _m1 get3DENAttribute _x];
} forEch ["markerType","markerColor","markerBrush","position","size2","text"];
*/
private["_m1","_markerType","_markerShape","_markerColor","_markerText","_markerBrush","_markerPos","_markerSize","_markerAlpha"];
if !(_markers isEqualTo []) then 
{
	_m1 = _markers select 0;
	_markerType = (_m1 get3DENAttribute "itemClass") select 0;
	_markerShape = (_m1 get3DENAttribute "markerType") select 0;
	_markerColor = (_m1 get3DENAttribute "baseColor") select 0;
	_markerText = (_m1 get3DENAttribute "text") select 0;
	if !(_markerText isEqualTo "") then {blck_dynamicmarkerMissionName = _markerText};
	_markerBrush = (_m1 get3DENAttribute "markerBrush") select 0;
	_markerPos = (_m1 get3DENAttribute "position") select 0;
	_markerSize = (_m1 get3DENAttribute "size2") select 0;
	_markerText = (_m1 get3DENAttribute "text") select 0;
	if (CENTER isEqualTo [0,0,0]) then {CENTER = markerPos _m1};
} else {
	_type = "mil_square";
	_shape = "null";
	_size = "[0,0]";
	_color = "COLORRED";
	_brush = "null";
	CENTER = [0,0,0];
};
diag_log format["_m1 = %1 | _type = %2 | _shape = %3 | _size = %4 | _color = %5 | _brush = %6 | _text = %7",_m1,_markerType,_markerShape,_markerSize,_markerColor,_markerBrush,_markerText];
private _garrisonedBuildings = [];
private _missionLootVehicles = [];

private _staticObjects = (_entities select 0) select {(_x isKindOf "Static") && !(isSimpleObject _x)};
diag_log format["_staticObjects: %1",_staticObjects];
if (CENTER isEqualTo [0,0,0]) then 
{
	CENTER = getPosATL (_staticObjects select 0);
};
diag_log format["CENTER = %1",CENTER];
private _missionLandscape = [];

{
	if !(_x in _garrisonedBuildings && !((typeOf _x) isEqualTo unitMarkerObject) && !((typeOf _x) isEqualTo garrisonMarkerObject)) then
	{
		_missionLandscape pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x, 'true','true'];
	};
}forEach _staticObjects;

private _simpleObjects = (_entities select 0) select {isSimpleObject _x};
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


_lines pushBack format["_markerType = %1",format["[%1,%2,%3];",_markerType,_markerSize,_markerBrush]];
_lines pushBack format["_markerColor = %1;",_markerColor];
_lines pushBack format['_startMsg = "%1";',blck_dynamicStartMessage];
_lines pushBack format['_endMsg = "%1;',blck_dynamicEndMessage];
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
_lines pushBack "/*";
_lines pushBack "	Use the parameters below to customize your mission - see the template or blck_configs.sqf for details about each them";
_lines pushBack "*/";
_lines pushBack format["_chanceHeliPatrol = blck_chanceHeliPatrol%1;",blck_dynamicMissionDifficulty];  
_lines pushBack format["_noChoppers = blck_noPatrolHelis%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_missionHelis = blck_patrolHelis%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_chancePara = blck_chancePara%1;",blck_dynamicMissionDifficulty]; 
_lines pushBack format["_noPara = blck_noPara%1;",blck_dynamicMissionDifficulty];  
_lines pushBack format["_paraTriggerDistance = 400;"]; 				
_lines pushBack format["_paraSkill = '%1';",blck_dynamicMissionDifficulty];  
_lines pushBack format["_chanceLoot = 0.0;"]; 
_lines pushBack format["_paraLoot = blck_BoxLoot_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_paraLootCounts = blck_lootCounts%1;",blck_dynamicMissionDifficulty];  
_lines pushBack format['_missionLandscapeMode = "precise";'];
_linse pushBack "_useMines = blck_useMines;";  
_lines pushBack "_uniforms = blck_SkinList;";  
_lines pushBack "_headgear = blck_headgear;";  
_lines pushBack "_vests = blck_vests;";
_lines pushBack "_backpacks = blck_backpacks;";
_lines pushBack "_sideArms = blck_Pistols;";
_lines pushBack '_spawnCratesTiming = blck_spawnCratesTiming;';
_lines pushBack '_loadCratesTiming = blck_loadCratesTiming;';
_lines pushBack '_endCondition = blck_missionEndCondition;';
_lines pushBack format["_minNoAI = blck_MinAI_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_maxNoAI = blck_MaxAI_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_noAIGroups = blck_AIGrps_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_noVehiclePatrols = blck_SpawnVeh_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_noEmplacedWeapons = blck_SpawnEmplaced_%1;",blck_dynamicMissionDifficulty];
_lines pushBack format["_minNoAI = blck_MinAI_%1;",blck_dynamicMissionDifficulty];  
_lines pushBack format["_maxNoAI = blck_MaxAI_%1",blck_dynamicMissionDifficulty]; 
_lines pushBack format["_noAIGroups = blck_AIGrps_%1;",blck_dynamicMissionDifficulty];  
_lines pushBack format["_noVehiclePatrols = blck_SpawnVeh_%1;",blck_dynamicMissionDifficulty];  
_lines pushBack format["_noEmplacedWeapons = blck_SpawnEmplaced_%1;",blck_dynamicMissionDifficulty];
diag_log format["blck_dynamicMissionDifficulty = %1",blck_dynamicMissionDifficulty];

_lines pushBack '#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";';

uiNameSpace setVariable ["Display3DENCopy_data", ["dynamicMission.sqf", _lines joinString _lineBreak]];
(findDisplay 313) createdisplay "Display3DENCopy";
