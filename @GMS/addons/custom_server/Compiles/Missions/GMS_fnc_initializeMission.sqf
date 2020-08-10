/*

	Perform all functions necessary to initialize a mission.
	[_mrkr,_difficulty,_m] call blck_fnc_initializeMission;
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_coords","_coordArray","_return"];
params["_missionCategoryDescriptors","_missionParameters"];
 _missionCategoryDescriptors params [
		"_difficulty",
		"_noMissions",  // Max no missions of this category
		"_noActive",  // Number active 
		"_tMin", // Used to calculate waittime in the future
		"_tMax", // as above
		"_waitTime",  // time at which a mission should be spawned
		"_missionsData"  // 
	];


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
	"_missionLootBoxes",
	"_missionLootVehicles",
	"_missionPatrolVehicles",
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
	false;
};

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
private _markers = [_markerName,_markerPos,_markerMissionName,_markerColor,_markerType,_markerSize,_markerBrush] call blck_fnc_createMissionMarkers;

/*
	Send a message to players.
*/
[["start",_startMsg,_markerMissionName]] call blck_fnc_messageplayers;

private _missionTimeoutAt = diag_tickTime + blck_MissionTimeout;
private _triggered = 0;
private _spawnPara = if (random(1) < _chancePara) then {true} else {false};
private _objects = [];
private _mines = [];
private _crates = [];
private _missionAIVehicles = [];
private _blck_AllMissionAI = [];
private _AI_Vehicles = [];
private _assetSpawned = objNull;

private _missionData = [_coords,_mines,_objects,_crates, _blck_AllMissionAI,_assetSpawned,_missionAIVehicles,_markers];
blck_activeMissionsList pushBack [_missionCategoryDescriptors,_missionTimeoutAt,_triggered,_spawnPara,_missionData,_missionParameters];

[format["Initialized Mission %1 | description %2 | difficulty %3 at %4",_markerName, _markerMissionName, _difficulty, diag_tickTime]] call blck_fnc_log;
