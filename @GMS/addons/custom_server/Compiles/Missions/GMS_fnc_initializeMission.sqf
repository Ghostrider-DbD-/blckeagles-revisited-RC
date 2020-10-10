/*

	Perform all functions necessary to initialize a mission.
	[_mrkr,_difficulty,_m] call blck_fnc_initializeMission;
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_coords","_coordArray","_return"];
params["_missionCategoryDescriptors","_missionParameters","_missionCount"];
 _missionCategoryDescriptors params [
		"_difficulty",
		"_noMissions",  // Max no missions of this category
		"_noActive",  // Number active 
		"_tMin", // Used to calculate waittime in the future
		"_tMax", // as above
		"_waitTime",  // time at which a mission should be spawned
		"_missionsData"  // 
	];

if (blck_debugLevel >= 3) then 
{
	{
		diag_log format["_initializeMission: _missionCategoryDescriptors %1 = %2",_forEachIndex, _missionCategoryDescriptors];
	} forEach [
			"_difficulty",
			"_noMissions",  // Max no missions of this category
			"_noActive",  // Number active 
			"_tMin", // Used to calculate waittime in the future
			"_tMax", // as above
			"_waitTime",  // time at which a mission should be spawned
			"_missionsData"  // 
		];
};
if (_noActive > _noMissions) exitWith {if (blck_debugOn) then {}};

_missionParameters params[
	"_markerName",
	"_markerMissionName",
	"_endMsg",
	"_startMsg",
	"_defaultMissionLocations",	
	"_crateLoot", 				
	"_lootCounts", 				
	"_markerType", 
	"_markerColor", 
	"_markerSize",
	"_markerBrush",	
	"_missionLandscapeMode", 	
	"_garrisonedBuildings_BuildingPosnSystem", 
	"_garrisonedBuilding_ATLsystem",
	"_missionLandscape",
	"_simpleObjects",
	"_missionLootBoxes",
	"_missionLootVehicles",
	"_missionPatrolVehicles",
	"_submarinePatrols",
	"_submarinePatrolParameters",
	"_airPatrols",
	"_noVehiclePatrols", 
	"_vehicleCrewCount",
	"_missionEmplacedWeapons",
	"_noEmplacedWeapons", 
	"_useMines", 
	"_minNoAI", 
	"_maxNoAI", 
	"_noAIGroups", 		
	"_missionGroups",
	"_scubaPatrols",
	"_scubaGroupParameters",		
	"_hostageConfig",
	"_enemyLeaderConfig",
	"_assetKilledMsg",	
	"_uniforms", 
	"_headgear", 
	"_vests", 
	"_backpacks", 
	"_weaponList",
	"_sideArms", 
	"_chanceHeliPatrol", 
	"_noChoppers", 
	"_missionHelis", 
	"_chancePara", 
	"_noPara", 
	"_paraTriggerDistance",
	"_paraSkill",
	"_chanceLoot", 
	"_paraLoot", 
	"_paraLootCounts",
	"_spawnCratesTiming", 
	"_loadCratesTiming", 
	"_endCondition",
	"_isScubaMission"
];

_coordsArray = [];
if !(_defaultMissionLocations isEqualTo []) then 
{
	_coords = selectRandom _defaultMissionLocations;
} else {
	if (_isScubaMission) then 
	{
		_coords = [] call blck_fnc_findShoreLocation;
	} else {
		_coords =  [] call blck_fnc_findSafePosn;
	};
};

if (_coords isEqualTo []) exitWith 
{
	[format["No Safe Mission Spawn Position Found to spawn Mission %1",_markerMissionName],'warning'] call blck_fnc_log;
	false;
};

if (blck_debugLevel >= 3) then {diag_log format["_fnc_initializeMission: _markerMissionName = %1 |  _coords = %2",_markerMissionName,_coords]};

blck_ActiveMissionCoords pushback _coords; 
blck_missionsRunning = blck_missionsRunning + 1;

private _markers = [];

/*
	Handle map markers 
*/
private _markerName = format["%1:%2",_markerMissionName,blck_missionsRun];

private "_markerPos";
if (blck_labelMapMarkers select 0) then
{
	_markerPos = _coords;
};
if !(blck_preciseMapMarkers) then
{
	_markerPos = [_coords,75] call blck_fnc_randomPosition;
};
private _markerData = [_markerType,_markerColor,_markerSize,_markerBrush];

if (blck_debugLevel >= 3) then 
{
	{
		diag_log format["_initializeMission: %1 = %2",_x,_markerData select _forEachIndex];
	} forEach [	
		"_markerType", 
		"_markerColor", 
		"_markerSize",
		"_markerBrush"
	];
};
if !(toLower (_markerType) in ["ellipse","rectangle"] || isClass(configFile >> "CfgMarkers" >> _markerType)) then 
{
	[format["_markerType set to 'ELLIPSE': Illegal marker type %1 used for mission %2 of difficulty %3",_markerType,_markerMissionName,_difficulty],"warning"] call blck_fnc_log;
	_markerType = "ELLIPSE";
	_markerSize = [200,200];
	_markerBrush = "SOLID";
	_markerMissionName = "Invalid Marker Parameters";
	_missionParameters set [1,_markerMissionName];
};
if !(isClass(configFile >> "CfgMarkerColors" >> _markerColor)) then 
{
	[format["_markerColor set to 'default': Illegal color %1 used for mission %2 of difficulty %3",_markerColor,_markerMissionName,_difficulty],"warning"] call blck_fnc_log;
	_markerColor = "DEFAULT";
	_markerMissionName = "Invalid Marker Parameters";
	_missionParameters set [1,_markerMissionName];		
};

private _markers = [format["%1:%2",_markerName,_missionCount],_markerPos,_markerMissionName,_markerColor,_markerType,_markerSize,_markerBrush] call blck_fnc_createMissionMarkers;
if (blck_debugLevel >= 3) then {[format["_initializeMissions (167): _marker = %1 | _markerMissionName = %2 | _difficulty = %3",_markers,_markerMissionName,_difficulty]] call blck_fnc_log};

/*
	Send a message to players.
*/

[["start",_startMsg,_markerMissionName]] call blck_fnc_messageplayers;

private _missionTimeoutAt = diag_tickTime + blck_MissionTimeout;
private _triggered = 0;
private _spawnPara = if (random(1) < _chancePara) then {true} else {false};
private _objects = [];
private _hiddenObjects = [];
private _mines = [];
private _crates = [];
private _missionAIVehicles = [];
private _blck_AllMissionAI = [];
private _AI_Vehicles = [];
private _assetSpawned = objNull;

private _missionData = [_coords,_mines,_objects,_hiddenObjects,_crates, _blck_AllMissionAI,_assetSpawned,_missionAIVehicles,_markers];
blck_activeMissionsList pushBack [_missionCategoryDescriptors,_missionTimeoutAt,_triggered,_spawnPara,_missionData,_missionParameters];

[format["Initialized Mission %1 | description %2 | difficulty %3 at %4",_markerName, _markerMissionName, _difficulty, diag_tickTime]] call blck_fnc_log;
if (blck_debugON) then 
{
	[format["Mission Marker = %1 | Marker Position = %2 | _coords = %3",_markers,_markerPos,_coords]] call blck_fnc_log;
};
true
