/*
  Generic Mission Spawner
	By Ghostrider GRG
	Copyright 2016
	Last modified 12/14/17
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#define isScubaMission true
private ["_abort","_crates","_aiGroup","_objects","_groupPatrolRadius","_missionLandscape","_mines","_blck_AllMissionAI","_blck_localMissionMarker","_AI_Vehicles","_timeOut","_aiDifficultyLevel","_missionPatrolVehicles","_missionGroups"];
params["_coords","_mission",["_allowReinforcements",false]];
//diag_log format["_missionSpawner (18)::  _allowReinforcements = %1",_allowReinforcements];

////////
// set all variables needed for the missions
// data is pulled either from the mission description or from the _mission variable passsed as a parameter
// Deal with situations where some of these variables might not be defined as well.
////////

// _mission params[_missionListOrange,_pathOrange,"OrangeMarker","orange",blck_TMin_Orange,blck_TMax_Orange];
_markerClass = _mission;
_aiDifficultyLevel = _difficulty;  // _difficulty is defined in the mission description file. see \addons\custom_server\Missions\UMS\dynamicMissions\default.sqf for an example

diag_log format["[blckeagls] missionSpawner (34):: Initializing mission: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];

private["_chanceHeliPatrol","_noPara","_reinforcementLootCounts","_chanceLoot","_heliCrew","_loadCratesTiming"];

if (isNil "_markerColor") then {_markerColor = "ColorBlack"};
if (isNil "_markerType") then {_markerType = ["mil_box",[]]};
//if (isNil "_timeOut") then {_timeOut = -1;};
if (isNil "_loadCratesTiming") then {_loadCratesTiming = blck_loadCratesTiming}; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
if (isNil "_missionGroups") then {_missionGroups = []};
private["_useMines","_blck_AllMissionAI","_delayTime","_groupPatrolRadius"];
if (isNil "_useMines") then {_useMines = blck_useMines;};

_objects = [];
_mines = [];
_crates = [];
_aiGroup = [];
_missionAIVehicles = [];
_blck_AllMissionAI = [];
_AI_Vehicles = [];
_blck_localMissionMarker = [_markerClass,_coords,"","",_markerColor,_markerType];
_delayTime = 1;
_groupPatrolRadius = 50;

if (blck_labelMapMarkers select 0) then
{
	//diag_log "labeling map markers *****";
	_blck_localMissionMarker set [2, _markerMissionName];
};
if !(blck_preciseMapMarkers) then
{
	//diag_log "Map marker will be OFFSET from the mission position";
	_blck_localMissionMarker set [1,[_coords,75] call blck_fnc_randomPosition];
};
_blck_localMissionMarker set [3,blck_labelMapMarkers select 1];  // Use an arrow labeled with the mission name?
[["start",_startMsg,_markerMissionName]] call blck_fnc_messageplayers;
private _marker = [_blck_localMissionMarker] call blck_fnc_spawnMarker;
#ifdef blck_debugMode
if (blck_debugLevel > 0) then {diag_log "missionSpawner:: (91) message players and spawn a mission marker";};
if (blck_debugLevel > 0) then {diag_log "missionSpawner:: (77) waiting for player to trigger the mission";};
#endif
////////
//  All parameters are defined, lets wait until a player is nearby or the mission has timed out
////////

private["_wait","_missionStartTime","_playerInRange","_missionTimedOut"];
_missionStartTime = diag_tickTime;
_playerInRange = false;
_missionTimedOut = false;

_wait = true;

#ifdef blck_debugMode
if (blck_debugLevel > 0) then {diag_log "missionSpawner:: (90) starting mission trigger loop"};
if (blck_debugLevel > 2) then {_wait = false};
#endif

while {_wait} do
{
	#ifdef blck_debugMode
	//diag_log "missionSpawner:: top of mission trigger loop";
	if (blck_debugLevel > 2) exitWith {_playerInRange = true;};
	#endif

	if ([_coords, blck_TriggerDistance, false] call blck_fnc_playerInRange) exitWith {_playerInRange = true;};
	if ([_missionStartTime] call blck_fnc_timedOut) exitWith {_missionTimedOut = true;};
	uiSleep 5;

	#ifdef blck_debugMode
	if (blck_debugLevel > 2) then
	{
		diag_log format["dynamicUMSspawner:: Trigger Loop - blck_debugLevel = %1 and _coords = %2",blck_debugLevel, _coords];
		diag_log format["dynamicUMSspawner:: Trigger Loop - players in range = %1",{isPlayer _x && _x distance2D _coords < blck_TriggerDistance} count allPlayers];
		diag_log format["dynamicUMSspawner:: Trigger Loop - timeout = %1", [_missionStartTime] call blck_fnc_timedOut];
	};
	#endif
};

if (_missionTimedOut) exitWith
{
/*

*/
	//  Deal with the case in which the mission timed out.
	//["timeOut",_endMsg,_blck_localMissionMarker select 2] call blck_fnc_messageplayers;
	blck_priorDynamicUMS_Missions pushback [_coords,diag_tickTime]; 
	blck_ActiveMissionCoords = blck_ActiveMissionCoords - [ _coords];
	blck_missionsRunning = blck_missionsRunning - 1;
	blck_UMS_ActiveDynamicMissions = blck_UMS_ActiveDynamicMissions - [_coords];
	blck_dynamicUMS_MissionsRuning = blck_dynamicUMS_MissionsRuning - 1;	
	
	[_blck_localMissionMarker select 0] call blck_fnc_deleteMarker;
	//_blck_localMissionMarker set [1,[0,0,0]];
	//_blck_localMissionMarker set [2,""];
	[_objects, 0.1] spawn blck_fnc_cleanupObjects;

	#ifdef blck_debugMode
	if (blck_debugLevel > 0) then
	{
		diag_log format["[blckeagls] dynamicUMSspawner:: (133) Mission Timed Out: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
	};
	#endif
};

////////
// Spawn the mission objects, loot chest, and AI
////////
#ifdef blck_debugMode
if (blck_debugLevel > 0) then
{		
	diag_log format["[blckeagls] dynamicUMSspawner:: (142) --  >>  Mission tripped: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
};
#endif

private ["_temp"];
if (blck_SmokeAtMissions select 0) then  // spawn a fire and smoke near the crate
{
	_temp = [_coords,blck_SmokeAtMissions select 1] call blck_fnc_smokeAtCrates;
	if (typeName _temp isEqualTo "ARRAY") then 
	{
		_objects append _temp;
	};
};

uiSleep _delayTime;
if (_useMines) then
{
	_mines = [_coords] call blck_fnc_spawnMines;
	//uiSleep _delayTime;;
};
uiSleep _delayTime;
_temp = [];
//diag_log format["_dynamicUMSspawner"" _missionLandscape = %1 | _missionLandscapeMode = %2",_missionLandscape, _missionLandscapeMode];
if (_missionLandscapeMode isEqualTo "random") then
{
	_temp = [_coords,_missionLandscape, 3, 15, 2] call blck_fnc_spawnRandomLandscape;
};
if (_missionLandscapeMode isEqualTo "precise") then
{
	//params["_center","_objects"];
	_temp = [_coords, _missionLandscape] call blck_fnc_spawnCompositionObjects;
	//uiSleep 1;
};
//diag_log format["_fnc_dynamicUMSspawner: _temp = %1, typeName _temp = %2",_temp, typeName _temp];
if (typeName _temp isEqualTo "ARRAY") then
{
	_objects append _temp;
};
//diag_log format["_fnc_dynamicUMSspawner:: (176)->> _objects = %1",_objects];

#ifdef blck_debugMode
if (blck_debugLevel > 0) then
{
	diag_log format["[blckeagls] dynamicUMSspawner:: (190) Landscape spawned: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
};
#endif

uiSleep _delayTime;;

_temp = [_coords,_missionLootVehicles] call blck_fnc_spawnMissionLootVehicles;
//uisleep 1;
_crates append _temp;

uiSleep _delayTime;

_abort = false;
_temp = [[],[],false];
//diag_log format["_fnc_dynamicUMSspawner: spawning infantry using data in _missionGroups with _missionGroups = %1",_missionGroups];
// Require that the server admin define the location of any infantry patrols given that missions will be off-shore. 
// AI could be spawned on a platform or floating structure.
if (count _missionGroups > 0) then
{
	_temp = [_coords, _minNoAI,_maxNoAI,_aiDifficultyLevel,_uniforms,_headGear,_missionGroups] call blck_fnc_spawnMissionAI;
};

#ifdef blck_debugMode
if  (blck_debugLevel > 2) then {
	diag_log format["dynamicUMSspawner :: (209) blck_fnc_spawnMissionAI returned a value of _temp = %1",_temp]; uiSleep 1;
};

_abort = _temp select 1;
if  (blck_debugLevel > 2) then {
	diag_log format["dynamicUMSspawner :: (214) blck_fnc_spawnMissionAI returned a value of _abort = %1",_abort]; uiSleep 1;
};
#endif

//diag_log format["_fnc_dynamicUMSspawner: spawning scuba groups with _scubaGroupParameters = %1",_scubaGroupParameters];
//  	params["_coords",["_minNoAI",3],["_maxNoAI",6],["_aiDifficultyLevel","red"],["_uniforms",blck_SkinList],["_headGear",blck_BanditHeadgear],"_missionGroups",["weapons",[]],["_vests",blck_vests],["_isScubaGroup",false]];
_temp = [_coords, _minNoAI,_maxNoAI,_aiDifficultyLevel,blck_UMS_uniforms,blck_UMS_headgear,_scubaGroupParameters,blck_UMS_weapons,blck_UMS_vests,isScubaMission] call blck_fnc_spawnMissionAI;

#ifdef blck_debugMode
if  (blck_debugLevel > 2) then {
	diag_log format["dynamicUMSspawner :: (209) blck_fnc_spawnMissionAI returned a value of _temp = %1",_temp]; uiSleep 1;
};

_abort = _temp select 1;
if  (blck_debugLevel > 2) then {
	diag_log format["dynamicUMSspawner :: (214) blck_fnc_spawnMissionAI returned a value of _abort = %1",_abort]; uiSleep 1;
};
#endif

if (_abort) exitWith
{
	if (blck_debugLevel > 1) then {
		diag_log "dynamicUMSspawner:: (220) grpNull returned, mission termination criteria met, calling blck_fnc_endMission"
	};
	[_mines,_objects,_crates, _blck_AllMissionAI,_endMsg,_blck_localMissionMarker,_coords,_mission,1,isScubaMission] call blck_fnc_endMission;
};
if !(_abort) then 
{
	_blck_AllMissionAI append (_temp select 0);
};

uiSleep _delayTime;

#ifdef blck_debugMode
if (blck_debugLevel > 0) then
{
	diag_log format["[blckeagls] dynamicUMSspawner:: (235) AI Patrols Spawned: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
};
#endif

uiSleep _delayTime;
_temp = [[],[],false];
_abort = false;
private["_patrolVehicles","_vehToSpawn"];
//diag_log format["_fnc_dynamicUMSspawner (258): _noVehiclePatrols = %1",_noVehiclePatrols];
_vehToSpawn = 0;
//diag_log format["_dynamicUMSspawner:: _vehToSpawn = %1",_vehToSpawn];
// Spawn any surface patrols
if (blck_useVehiclePatrols &&  count _vehiclePatrolParameters > 0) then
{
	//  params["_coords","_noVehiclePatrols","_aiDifficultyLevel","_uniforms","_headGear","_missionPatrolVehicles",["_useRelativePos",true],["_weapons",[]],["_vests",blck_vests],["_isScubaGroup",false]];
	_temp = [_coords,_vehToSpawn,_aiDifficultyLevel,_uniforms,_headGear,_vehiclePatrolParameters,true /*,blck_UMS_weapons,blck_UMS_vests,isScubaMission*/ ] call blck_fnc_spawnMissionVehiclePatrols;
	//[_coords,_noVehiclePatrols,_aiDifficultyLevel,_uniforms,_headGear,_markerClass] call blck_fnc_spawnMissionVehiclePatrols;
	#ifdef blck_debugMode
	if  (blck_debugLevel > 1) then {
			diag_log format["dynamicUMSspawner :: (251) blck_fnc_spawnMissionVehiclePatrols returned _temp = %1",_temp]; 
	};
	#endif

	if (typeName _temp isEqualTo "ARRAY") then
	{
		_abort = _temp select 2;
	};
	if !(_abort) then
	{
		_patrolVehicles = _temp select 0;
		_blck_AllMissionAI append (_temp select 1);

		#ifdef blck_debugMode
		if (blck_debugLevel > 0) then
		{
			diag_log format["[blckeagls] dynamicUMSspawner:: (267) Vehicle Patrols Spawned: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
		};
		#endif

	};
};
// Spawn any submarine patrols
if (blck_useVehiclePatrols &&  count _submarinePatrolParameters > 0) then
{
	_temp = [_coords,_vehToSpawn,_aiDifficultyLevel,_uniforms,_headGear,_submarinePatrolParameters,true,blck_UMS_weapons,blck_UMS_vests,isScubaMission] call blck_fnc_spawnMissionVehiclePatrols;
	//[_coords,_noVehiclePatrols,_aiDifficultyLevel,_uniforms,_headGear,_markerClass] call blck_fnc_spawnMissionVehiclePatrols;
	#ifdef blck_debugMode
	if  (blck_debugLevel > 1) then {
			diag_log format["dynamicUMSspawner :: (251) blck_fnc_spawnMissionVehiclePatrols returned _temp = %1",_temp]; 
	};
	#endif

	if (typeName _temp isEqualTo "ARRAY") then
	{
		_abort = _temp select 2;
	};
	if !(_abort) then
	{
		_patrolVehicles = _temp select 0;
		_blck_AllMissionAI append (_temp select 1);

		#ifdef blck_debugMode
		if (blck_debugLevel > 0) then
		{
			diag_log format["[blckeagls] dynamicUMSspawner:: (267) Vehicle Patrols Spawned: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
		};
		#endif

	};
};

if (_abort) exitWith 
{
	#ifdef blck_debugMode
	if (blck_debugLevel > 0) then {
		diag_log "dynamicUMSspawner:: (279) grpNull returned, mission termination criteria met, calling blck_endMission";
	};
	#endif

	[_mines,_objects,_crates, _blck_AllMissionAI,_endMsg,_blck_localMissionMarker,_coords,_mission,1,isScubaMission] call blck_fnc_endMission;
};

uiSleep _delayTime;
_temp = [[],[],false];
_abort = false;

if (_allowReinforcements) then
{
	_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout;
	_temp = [];

	#ifdef blck_debugMode
	if (blck_debugLevel > 1) then
	{
		diag_log format["[blckeagls] dynamicUMSspawner:: (298) calling in reinforcements: Current mission: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
	};
	#endif
	private _noChoppers = 0;
	private _chancePara = 0;
	switch (toLower _aiDifficultyLevel) do
	{
		case "blue":{
			_noChoppers = [blck_noPatrolHelisBlue] call blck_fnc_getNumberFromRange;
			//_chancePara = [blck_chanceParaBlue] call blck_fnc_getNumberFromRange;
			};
		case "red":{
			_noChoppers = [blck_noPatrolHelisRed] call blck_fnc_getNumberFromRange;
			//_chancePara = [blck_chanceParaRed] call blck_fnc_getNumberFromRange;
			};
		case "green":{
			_noChoppers = [blck_noPatrolHelisGreen] call blck_fnc_getNumberFromRange;
			//_chancePara = [blck_chanceParaGreen] call blck_fnc_getNumberFromRange;
			};
		case "orange":{
			_noChoppers = [blck_noPatrolHelisOrange] call blck_fnc_getNumberFromRange;
			//_chancePara = [blck_chanceParaOrange] call blck_fnc_getNumberFromRange;
			};
	};
	#ifdef blck_debugMode
	diag_log format["_dynamicUMSspawner(322):: _noChoppers = %1  && _chancePara = %2",_noChoppers,_chancePara];
	#endif
	for "_i" from 1 to (_noChoppers) do
	{
		//params["_coords","_aiSkillsLevel","_weapons","_uniforms","_headgear"];
		
		_temp = [_coords,_aiDifficultyLevel,_weaponList,_uniforms,_headGear,_chancePara] call blck_fnc_spawnMissionReinforcements;

		#ifdef blck_debugMode
		if (blck_debugLevel >= 2) then
		{
			diag_log format["dynamicUMSspawner(334):: blck_fnc_spawnMissionReinforcements call for chopper # %1 out of a total of %2 choppers",_i, _noChoppers];
			diag_log format["dynamicUMSspawner(335):: _temp = %1",_temp];
		};
		#endif

		if (typeName _temp isEqualTo "ARRAY") then
		{
			_abort = _temp select 2;
			_objects pushback (_temp select 0);
			_blck_AllMissionAI append (_temp select 1);
		};
		if (_abort) then
		{
			#ifdef blck_debugMode
			if (blck_debugLevel > 2) then 
			{
				diag_log "dynamicUMSspawner:: (349) grpNul or ERROR in blck_fnc_spawnMissionReinforcements, mission termination criteria met, calling blck_endMission";
			};
			#endif

			[_mines,_objects,_crates, _blck_AllMissionAI,_endMsg,_blck_localMissionMarker,_coords,_mission,1,isScubaMission] call blck_fnc_endMission;
		};
	};
};
//////////////////////////
// Spawn Crates and Emplaced Weapons Last to try to force them to correct positions relative to spawned buildinga or other objects.
#ifdef blck_debugMode
if (blck_debugLevel > 0) then {diag_log format["dynamicUMSspawner:: (361) preparing to spawn emplaced weapons for _coords %4 | _markerClass %3 | blck_useStatic = %1 | _noEmplacedWeapons = %2",blck_useStatic,_noEmplacedWeapons,_markerClass,_coords];};
#endif
uiSleep 15;
private["_noEmplacedToSpawn"];
_noEmplacedToSpawn = [_noEmplacedWeapons] call blck_fnc_getNumberFromRange;
//diag_log format["_dynamicUMSspawner:: _noEmplacedToSpawn = %1",_vehToSpawn];
if (blck_useStatic && ((_noEmplacedToSpawn > 0)) || count _missionEmplacedWeapons > 0) then
{
	// params["_missionEmplacedWeapons","_noEmplacedWeapons","_aiDifficultyLevel","_coords","_uniforms","_headGear"];
	_temp = [_missionEmplacedWeapons,_noEmplacedToSpawn,_aiDifficultyLevel,_coords,_uniforms,_headGear] call blck_fnc_spawnEmplacedWeaponArray;
	
	#ifdef blck_debugMode
	if  (blck_debugLevel > 2) then 
	{
		diag_log format ["dynamicUMSspawner:: (375) blck_fnc_spawnEmplacedWeaponArray returned _temp = %1",_temp]; 
	};
	#endif
	
	if (typeName _temp isEqualTo "ARRAY") then
	{
		_abort = _temp select 2;
	};
	
	#ifdef blck_debugMode
	if  (blck_debugLevel > 2) then 
	{
		diag_log format ["dynamicUMSspawner:: (387) _abort = %1",_abort]; 

	};
	#endif
	
	if !(_abort) then
	{
		_objects append (_temp select 0);
		_blck_AllMissionAI append (_temp select 1);

		#ifdef blck_debugMode
		if (blck_debugLevel > 0) then
		{
			diag_log format["[blckeagls] dynamicUMSspawner:: (400) Static Weapons Spawned: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
		};	
		#endif
	};
};
if (_abort) exitWith 
{
	#ifdef blck_debugMode
	if (blck_debugLevel > 2) then 
	{
		diag_log "dynamicUMSspawner:: (410) grpNull ERROR in blck_fnc_spawnEmplacedWeaponArray, mission termination criteria met, calling blck_endMission";
	};
	#endif

	[_mines,_objects,_crates, _blck_AllMissionAI,_endMsg,_blck_localMissionMarker,_coords,_mission,1,isScubaMission] call blck_fnc_endMission;
};

uiSleep _delayTime;
if (count _missionLootBoxes > 0) then
{
	_crates = [_coords,_missionLootBoxes,_loadCratesTiming] call blck_fnc_spawnMissionCrates;
}
else
{
	_crates = [_coords,[[selectRandom blck_UMS_crates,[0,0,0],_crateLoot,_lootCounts]], _loadCratesTiming] call blck_fnc_spawnMissionCrates;
	
};

if (blck_cleanUpLootChests) then
{
	_objects append _crates;
};


//uisleep 2;
#ifdef blck_debugMode
if (blck_debugLevel > 0) then
{
	diag_log format["[blckeagls] dynamicUMSspawner:: (428) Crates Spawned: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
};
#endif

// Trigger for mission end
#ifdef blck_debugMode
diag_log format["[blckeagls] mission Spawner(436) _endCondition = %1",_endCondition];
#endif
private["_missionComplete","_endIfPlayerNear","_endIfAIKilled"];
_missionComplete = -1;
_startTime = diag_tickTime;
if (blck_showCountAliveAI) then
{
	//diag_log format["_missionSpawner(441): Adding Number Alive AI: _marker = %1 | _markerMissionName = %2",_marker,_markerMissionName];
	//diag_log format["_missionSpawner(442): Alive AI = %1 | Current Marker Text = %2",{alive _x} count _blck_AllMissionAI, markerText _marker];
	if !(_marker isEqualTo "") then
	{
		[_marker,_markerMissionName,_blck_AllMissionAI] call blck_fnc_updateMarkerAliveCount;
		blck_missionMarkers pushBack [_marker,_markerMissionName,_blck_AllMissionAI];
		//diag_log format["_missionSpawner: blck_missionMarkers = %1",blck_missionMarkers];
	};
};
switch (_endCondition) do
{
	case "playerNear": {_endIfPlayerNear = true;_endIfAIKilled = false;};
	case "allUnitsKilled": {_endIfPlayerNear = false;_endIfAIKilled = true;};
	case "allKilledOrPlayerNear": {_endIfPlayerNear = true;_endIfAIKilled = true;};
};
#ifdef blck_debugMode
diag_log format["dynamicUMSspawner :: (449) _endIfPlayerNear = %1 _endIfAIKilled= %2",_endIfPlayerNear,_endIfAIKilled];
#endif
private["_locations"];
_locations = [_coords];
{
	_locations pushback (getPos _x);
	_x setVariable["crateSpawnPos", (getPos _x)];
} forEach _crates;
#ifdef blck_debugMode
diag_log format["dynamicUMSspawner (458)::  _coords = %1 | _crates = %2 | _locations = %3",_coords,_crates,_locations];
#endif
private _crateStolen = false;
#ifdef blck_debugMode
diag_log format["dynamicUMSspawner(462):: Waiting for player to satisfy mission end criteria of _endIfPlayerNear %1 with _endIfAIKilled %2",_endIfPlayerNear,_endIfAIKilled];
#endif
_fn_crateMoved = {
	params["_crate"];
	private _result = (_x distance (_x getVariable["crateSpawnPos",[0,0,0]])) > 10;
	//diag_log format["_fn_crateMoved:: _result = %1",_result];
	_result;
};
_missionComplete = -1;
while {_missionComplete isEqualTo -1} do
{
	//if (blck_debugLevel isEqualTo 3) exitWith {uiSleep 180};
	if ((_endIfPlayerNear) && [_locations,10,true] call blck_fnc_playerInRangeArray) exitWith {};
	if ((_endIfAIKilled) &&  ({alive _x} count _blck_AllMissionAI) < 1) exitWith {};

	{
		if ({[_x] call _fn_crateMoved} count _crates > 0) exitWith
		{
			_missionComplete = 1;
			_crateStolen = true;
		};
	}forEach _crates;
	//diag_log format["dynamicUMSspawner:: (483) missionCompleteLoop - > players near = %1 and ai alive = %2 and crates stolen = %3",[_coords,20] call blck_fnc_playerInRange, {alive _x} count _blck_AllMissionAI, _crateStolen];
	uiSleep 4;
};
if (_crateStolen) exitWith
{
	diag_log format["dynamicUMSspawner:: (542) Crate Stolen Callening _fnc_endMission - > players near = %1 and ai alive = %2 and crates stolen = %3",[_locations,10,true] call blck_fnc_playerInRangeArray, {alive _x} count _blck_AllMissionAI, _crateStolen];
	[_mines,_objects,_crates, _blck_AllMissionAI,"Crate Removed from Mission Site Before Mission Completion: Mission Aborted",_blck_localMissionMarker,_coords,_mission,2,isScubaMission] call blck_fnc_endMission;
};
#ifdef blck_debugMode
if (blck_debugLevel > 0) then
{
	diag_log format["[blckeagls] dynamicUMSspawner:: (496) Mission completion criteria fulfilled: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
	diag_log format["dynamicUMSspawner :: (497) _endIfPlayerNear = %1 _endIfAIKilled= %2",_endIfPlayerNear,_endIfAIKilled];
	diag_log format["[blckeagls] dynamicUMSspawner:: (498) calling endMission: _cords %1 : _markerClass %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_markerClass,_aiDifficultyLevel,_markerMissionName];
};
#endif
private["_result"];
// Force passing the mission name for informational purposes.
_blck_localMissionMarker set [2, _markerMissionName];
// params["_mines","_objects","_crates","_blck_AllMissionAI","_endMsg","_blck_localMissionMarker","_coords","_mission",["_aborted",false],["_vehicles",[]],["_isScubaMission",false]];
_result = [_mines,_objects,_crates,_blck_AllMissionAI,_endMsg,_blck_localMissionMarker,_coords,_mission,0,_missionAIVehicles,isScubaMission] call blck_fnc_endMission;

//diag_log format["[blckeagls] dynamicUMSspawner:: (559) end of mission: blck_fnc_endMission has returned control to _fnc_dynamicUMSspawner"];

