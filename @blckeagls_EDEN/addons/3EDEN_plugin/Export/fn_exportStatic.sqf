/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

objectAtMissionCenter = getText(configFile >> "CfgBlck3DEN"  >> "configs" >> "objectAtMissionCenter");
blck_minAI = getNumber(configFile >> "CfgBlck3DEN"  >> "configs" >> "minAI");
blck_maxAI = getNumber(configFile >> "CfgBlck3DEN"  >> "configs" >> "maxAI");
minPatrolRadius = getNumber(configFile >> "CfgBlck3DEN"  >> "configs" >> "minPatroRadius");
maxPatrolRadius = getNumber(configFile >> "CfgBlck3DEN"  >> "configs" >> "maxPatrolRadius");
maxVehiclePatrolRadius = getNumber(configFile >> "CfgBlck3DEN"  >> "configs" >> "maxVehiclePatrolRadius");
aircraftPatrolRadius = getNumber(configFile >> "CfgBlck3DEN"  >> "configs" >> "aircraftPatrolRadius");
oddsOfGarison = getNumber(configFile >> "CfgBlck3DEN"  >> "configs" >> "oddsOfGarison");
maxGarrisonStatics = getNumber(configFile >> "CfgBlck3DEN"  >> "configs" >> "maxGarrisonStatics");
typesGarrisonStatics = getArray(configFile >> "CfgBlck3DEN"  >> "configs" >> "typesGarrisonStatics");
blck_MissionDifficulty = missionNamespace getVariable["blck_difficulty",getText(configFile >> "CfgBlck3DEN"  >> "configs" >> "defaultMissionDifficulty")];
lootVehicleVariableName = getText(configFile >> "CfgBlck3DEN"  >> "configs" >> "lootVehicleVariableName");
buildingPosGarrisonVariableName = getText(configFile >> "CfgBlck3DEN"  >> "configs" >> "buildingPosGarrisonVariableName");
buildingATLGarrisionVariableName = getText(configFile >> "CfgBlck3DEN"  >> "configs" >> "buildingATLGarrisionVariableName");

{
	diag_log format["param %1 = %2",_forEachIndex,_x];
} forEach [
	objectAtMissionCenter,
	blck_minAI,
	blck_maxAI,
	minPatrolRadius,
	maxPatrolRadius,
	maxVehiclePatrolRadius,
	aircraftPatrolRadius,
	oddsOfGarison,
	maxGarrisonStatics,
	typesGarrisonStatics,
	blck_MissionDifficulty,
	lootVehicleVariableName,
	buildingPosGarrisonVariableName,
	buildingATLGarrisionVariableName	
];

CENTER = [0,0,0];

diag_log format["Static Mission Export called at %1",diag_tickTime];
diag_log format["With blck_MissionDifficulty = %1",blck_MissionDifficulty];

/*
	Set Default Values Where not Defined using Menu Commands
*/

if (isNil "blck_dynamicCrateLoot") then 
{
	blck_dynamicCrateLoot = format["_crateLoot = blck_BoxLoot_%1;",blck_MissionDifficulty];
};
if (isNil "blck_dynamicCrateLootCounts") then {
	blck_dynamicCrateLootCounts = format["_lootCounts = blck_lootCounts%1;",blck_MissionDifficulty];
};


/*
	Look for an object defined in CfgBlck3DEN \ configs \ that marks the center of the mission 
	and set the coords of the center if such an object is found 
*/

private _centerMarkers = allMissionObjects objectAtMissionCenter;
diag_log format["_centerMarkers = %1",_centerMarkers];
if !(_centerMarkers isEqualTo []) then 
{
	CENTER = getPosATL (_centerMarkers select 0);
	diag_log format["CENTER defined by object %1 typeOf %2",_centerMarker,typeOf (_centerMarkers select 0)];
} else {
	diag_log format["<WARNING> No object marking the center of the mission was found: using a flashing road cone or flag is recommended",getText(configFile >> "CfgVehicles" >> objectAtMissionCenter >> "displayName")];
	diag_log format["Place such an object or a marker to ensure the mission is accurately stored and spawned"];
};

all3DENEntities params ["_objects","_groups","_triggers","_systems","_waypoints","_markers","_layers","_comments"];
private _units = []; 
{
	{
		if (vehicle _x isEqualTo _x) then {_units pushBack _x};
	} forEach (units _x);
} forEach _groups;

private["_m1","_markerPos","_markerType","_markerShape","_markerColor","_markerText","_markerBrush","_markerSize","_markerAlpha","_missionCenter"];
/*
	pull info on the first marker found 
*/
if !(_markers isEqualTo []) then 
{
	_m1 = _markers select 0;
	_markerType = (_m1 get3DENAttribute "itemClass") select 0;
	//_markerShape = (_m1 get3DENAttribute "markerType") select 0;
	_markerColor = (_m1 get3DENAttribute "baseColor") select 0;
	_markerText = (_m1 get3DENAttribute "text") select 0;
	if !(_markerText isEqualTo "") then {blck_dynamicmarkerMissionName = _markerText};
	_markerBrush = (_m1 get3DENAttribute "brush") select 0;
	_markerPos = (_m1 get3DENAttribute "position") select 0;
	_markerSize = (_m1 get3DENAttribute "size2") select 0;
	_markerText = (_m1 get3DENAttribute "text") select 0;

	/*
		use the coordinates of that marker as mission center of no object demarkating the center is found 
	*/
} else {
	_markerType = "mil_square";
	//_markerShape = "";
	_markerSize = [0,0];
	_markerColor = "COLORRED";
	_markerBrush = "";
	diag_log format["<WARNING> No marker was found, using default values and position for mission center position"];
};
diag_log format["_m1 = %1 | _type = %2 | _shape = %3 | _size = %4 | _color = %5 | _brush = %6 | _text = %7",_m1,_markerType,_markerShape,_markerSize,_markerColor,_markerBrush,_markerText];

private _garisonedBuildings = [];
private _garisonedStatics = [];
private _garisonedUnits = [];

private _landscape =  _objects select{
    !((_x get3DENAttribute "objectIsSimple") select 0) && 
    ((typeOf _x) isKindOf "Static") && 
	!((typeOf _x) isKindOf "Helper")
};

diag_log format["CENTER = %1 | _landscape = %2","ignored",_landscape];
private _missionLandscape = [];
{
	private _allowDamage = (_x get3DENAttribute "allowDamage") select 0;
	private _enableSimulation = (_x get3DENAttribute "enableSimulation") select 0;
	_missionLandscape pushBack format['     ["%1",%2,%3,%4]',typeOf _x,(getPosATL _x),[vectorDir _x,vectorUp _x], [_allowDamage,_enableSimulation]];
}forEach _landscape;

private _simpleObjects = _objects select {(_x get3DENAttribute "objectIsSimple") select 0};
diag_log format["_simpleObjects = %1",_simpleObjects];
private _missionSimpleObjects = [];
{
	_missionSimpleObjects pushBack format['     ["%1",%2,%3]',
	(_x get3DENAttribute "ItemClass") select 0,
	((_x get3DENAttribute "position") select 0),
	((_x get3DENAttribute "rotation") select 0) select 2
	];	
} forEach _simpleObjects;

private _missionLootVehicles = [];
private _lootVehicles = _objects select {
	((typeOf _x) isKindOf "AllVehicles") && 
	!((typeOf _x) isKindOf "Man") &&	
	(_x get3DENAttribute "name" isEqualTo lootVehicleVariableName)
};
diag_log format["_lootVehicles = %1",_lootVehicles];
{
	_missionLootVehicles pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x), [vectorDir _x,vectorUp _x],'_crateLoot','_lootCounts'];
} forEach _lootVehicles;

_missionPatrolVehicles = [];
private _patrolVehicles = _objects select {
	(((typeOf _x) isKindOf "Car") || ((typeOf _x) isKindOf "Tank") || ((typeOf _x) isKindOf "Ship")) && 
	!((typeOf _x) isKindOf "SDV_01_base_F") && 
	!(_x in _lootVehicles)
};
diag_log format["_patrolVehicles = %1",_patrolVehicles];
{
	_missionPatrolVehicles pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x,maxVehiclePatrolRadius,600,-1];
}forEach _patrolVehicles;

private _subPatrols = [];
private _subs = _objects select {
	((typeOf _x) isKindOf "SDV_01_base_F") && 
	!(_x in _lootVehicles)
};
diag_log format["_subs = %1",_subs];
{
	_subPatrols pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x),getDir _x,maxVehiclePatrolRadius,600,-1];
} forEach _subs;

private _airPatrols = [];
private _airVehicles = _objects select {
	(typeOf _x) isKindOf "Air"
};
diag_log format["_airVehicles = %1",_airvehicles];
{
	_airPatrols pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x),getDir _x,aircraftPatrolRadius,900,-1];
} forEach _airVehicles;


private _staticWeapons = [];
private _statics = _objects select {
	((typeOf _x) isKindOf "StaticWeapon") && 
	!(_x in _garisonedStatics)
};
diag_log format["_statics = %1",_statics];
{
	_staticWeapons pushBack format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x),getDir _x,0,-1];
} forEach _statics;

private _infantry = _units select {
	!(surfaceIsWater (getPos _x)) && 
	!(_x in _garisonedUnits)
};
diag_log format["_infantry = %1",_infantry];
_infantryGroups = [];
{
	_infantryGroups pushBack format['     [%1,%2,%3,"%4",%5,%6]',(getPosATL _x),blck_minAI,blck_maxAI,blck_MissionDifficulty,maxPatrolRadius,600,-1];
} forEach  _units;

private _scuba = _units select {
	(surfaceIsWater (getPos _x)) && 
	!(_x in _garisonedUnits)	
	// checck _x get3EDENAtribute "name" != "garrison";	
};
diag_log format["_scuba = %1",_scuba];
private _scubaGroups = [];
{
	_scubaGroups pushBack format['     [%1,%2,%3,"%4",%5,%6]',(getPosATL _x),blck_minAI,blck_maxAI,blck_MissionDifficulty,maxPatrolRadius,600,-1];
} forEach _scuba;

private _lootContainers = [];
private _ammoBoxes = _objects select {
	(((typeOf _x) isKindOf "ReammoBox") || ((typeOf _x) isKindOf "ReammoBox_F"))
};
diag_log format["_ammoBoxes = %1",_ammoboxes];
{
	_lootContainers pushBack format['     ["%1",%2,%3,%4,%5,%6]',typeOf _x,(getPosATL _x), [vectorDir _x,vectorUp _x],[true,true],'_crateLoot','_lootCounts'];
}forEach _ammoBoxes;

private _lines = [];
private _lineBreak = toString [10];

_lines pushBack "/*";
_lines pushBack "	Static Mission Generated";
_lines pushBack "	Using 3DEN Plugin for blckeagls";
_lines pushBack format["	%1",['dynamic'] call blck3DEN_fnc_versionInfo];
_lines pushBack "	By Ghostrider-GRG-";
_lines pushBack "*/";
_lines pushBack "";
_lines pushBack '#include "\q\addons\custom_server\Configs\blck_defines.hpp";';
_lines pushBack '#include "privateVars.sqf";';
_lines pushBack "";
_lines pushBack format["_missionCenter = %1;",_markerPos];

if !(_markerBrush isEqualTo "") then 
{
	_lines pushBack format["_markerType = %1",format['["%1",%2,%3];',_markerType,_markerSize,_markerBrush]];
} else {
	_lines pushBack format["_markerType = %1",format['"%1",%2',_markerType,_markerSize]];
};
_lines pushBack format['_markerColor = "%1";',_markerColor];
_lines pushBack format['_markerMissionName = "%1";',blck_dynamicmarkerMissionName];
_lines pushBack format['_crateLoot = blck_BoxLoot_%1;',blck_MissionDifficulty];
_lines pushBack format['_lootCounts = blck_lootCounts%1;',blck_MissionDifficulty];
_lines pushBack "";
_lines pushBack "_missionLandscape = [";
_lines pushback (_missionLandscape joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_simpleObjects = [";
_lines pushback (_missionSimpleObjects joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionLootVehicles = [";
_lines pushBack (_missionLootVehicles joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack  "_vehiclePatrolParameters = [";
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
_lines pushBack "_aiGroupParameters = [";
_lines pushback (_infantryGroups joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_aiScubaGroupParameters = [";
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
_linse pushBack "_useMines = blck_useMines;";  
_lines pushBack "_uniforms = blck_SkinList;";  
_lines pushBack "_headgear = blck_headgear;";  
_lines pushBack "_vests = blck_vests;";
_lines pushBack "_backpacks = blck_backpacks;";
_lines pushBack "_sideArms = blck_Pistols;";
_lines pushBack "";
_lines pushBack '#include "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_initializeMission.sqf"; ';

diag_log ["static"] call blck3EDEN_fnc_versionInfo;
uiNameSpace setVariable ["Display3DENCopy_data", ["staticMission.sqf", _lines joinString _lineBreak]];
(findDisplay 313) createdisplay "Display3DENCopy";
