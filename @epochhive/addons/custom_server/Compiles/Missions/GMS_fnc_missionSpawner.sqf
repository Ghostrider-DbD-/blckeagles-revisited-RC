/*
  Generic Mission Spawner
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
*/


private ["_crates","_aiGroup","_objects","_vehicles","_groupPatrolRadius","_missionLandscape","_compositions","_missionCfg","_compSel","_mines","_blck_AllMissionAI","_blck_localMissionMarker","_AI_Vehicles"];

params["_coords","_missionType","_aiDifficultyLevel"];
/*
_aiDifficultyLevel = _this select 2; // "blue","red","green" and "orange"
*/

//   *************************

// Once the entire mission system can support timeout cleanup of vehicles (specifically the AI vehicle patrols) then each mission layout can define this varialbe. Until then disable timouts.

//////////////////////////////////
//  To simplify debugging and also reduce load on server besure only once instance of the mission spawner is initializing at a time.
/////////////////////////////////

waitUntil {blck_missionSpawning isEqualTo false};
blck_missionSpawning = true;

diag_log format["[blckeagls] missionSpawner:: Initializing mission: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];

private["_chanceHeliPatrol","_noPara","_reinforcementLootCounts","_chanceLoot"];
if (isNil "_chanceReinforcements") then
{
	_chanceReinforcements = 0;
	_noPara = 0;
	_reinforcementLootCounts = [0,0,0,0,0,0];
	_chanceHeliPatrol = 0;
	_chanceLoot = 0;
};
private["_timeOut"]; // _timeOut is the time in seconds after which a mission is deactivated.
if (isNil "_timeOut") then {_timeOut = -1;};
if (isNil "_noPara") then {_noPara = 0};
if (isNil "_chanceHeliPatrol") then {_chanceHeliPatrol = 0;};
if (isNil "_chanceLoot") then {_chanceLoot = 0};
if (isNil "_reinforcementLootCounts") then
{
	_weap = 2 + floor(random(4));
	_mags = 5 + floor(random(6));
	_backpacks = 1 + floor(random(2));
	_optics = 1 + floor(random(6));
	_loadout = 1 + floor(random(3));
	_reinforcementLootCounts = [_weap,_mags,_optics,0,0,_backpacks];
	//diag_log "missionSpawner:: default values used for _reinforcementLootCounts";
}
else
{
	//diag_log "missionSpawner:: Mission specific values used for _reinforcementLootCounts";
};

if (blck_debugON) then {
	diag_log format["[blckEagle] Mission Reinforcement Parameters: changeReinforcements %1 numAI %2  changePatrol %3  chanceLoot %4",_chanceReinforcements,_noPara,_chanceHeliPatrol,_chanceLoot];
};

private["_useMines"];
if (isNil "_useMines") then {_useMines = blck_useMines; /*diag_log "[blckEagles] Using default setting for _useMines";*/};

_objects = [];
_mines = [];
_crates = [];
_aiGroup = [];
_missionAIVehicles = [];
_blck_AllMissionAI = [];
_AI_Vehicles = [];
//_blck_localMissionMarker = [_missionType,_coords,"","",_markerColor,_markerType];
_blck_localMissionMarker = [_missionType,_coords,"","",_markerColor,_markerType];
_delayTime = 1;
_groupPatrolRadius = 50;

if (blck_labelMapMarkers select 0) then
{
	//diag_log "SM1.sqf: labeling map markers *****";
	_blck_localMissionMarker set [2, _markerMissionName];
};
if !(blck_preciseMapMarkers) then
{
	//diag_log "SM1.sqf:  Map marker will be OFFSET from the mission position";
	_blck_localMissionMarker set [1,[_coords,75] call blck_fnc_randomPosition];
};
_blck_localMissionMarker set [3,blck_labelMapMarkers select 1];  // Use an arrow labeled with the mission name?
["start",_startMsg,_blck_localMissionMarker select 2] call blck_fnc_messageplayers;
[_blck_localMissionMarker] execVM "debug\spawnMarker.sqf";

_fn_timedOut = {
	params["_startTime"];
	private["_return"];
	_return = ( (diag_tickTime - _startTime) > blck_MissionTimout );
	_return;
};
_fn_playerWithinRange = {
	params["_pos"];
	private["_return"];
	_return = false;
	{
		if (isPlayer _x and _x distance _pos <= blck_TriggerDistance) then {_return = true};
		
	}forEach playableunits;
	_return;
};

uiSleep 1;
/////////////////////////////
//   Everything has been set up for the mission and it is now waiting to be triggered by a nearby player or to time out.
//   Lets let other instances of the mission spawner know it is OK to go ahead
////////////////////////////
blck_missionSpawning = false;

//diag_log "missionSpawner:: waiting for player to trigger the mission";
private["_wait","_missionStartTime","_playerInRange","_missionTimedOut"];
_missionStartTime = diag_tickTime;
_playerInRange = false;
_missionTimedOut = false;
_wait = true;
while {_wait} do
{
	if ([_coords] call _fn_playerWithinRange) then
	{
		_wait = false;
		_playerInRange = true;
	} else
	{
		if ((diag_tickTime - _missionStartTime) > blck_MissionTimout) then
		{
			_wait = false;
			_missionTimedOut = true;
		};
	};
	uiSleep 1;
};
//waitUntil{ { (isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/) || ([_missionStartTime] call _fn_timedOut) } count playableunits > 0 };

if (blck_debugON) then
{
	diag_log format["missionSpawner:: Mission Triggerred contition playerInRange %1 and timout = %2",_playerInRange, _missionTimedOut];
};

if (!_playerInRange && _missionTimedOut) exitWith
{
	//["timeOut",_endMsg,_blck_localMissionMarker select 2] call blck_fnc_messageplayers;
	[_blck_localMissionMarker select 0] execVM "debug\deleteMarker.sqf";
	_blck_localMissionMarker set [1,[0,0,0]];
	_blck_localMissionMarker set [2,""];
	[_objects, 1] spawn blck_fnc_cleanupObjects;
	if (blck_debugON) then
	{
		diag_log format["[blckeagls] missionSpawner:: Mission Timed Out: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
	};
};

if (_playerInRange) then
{
	if (blck_debugON) then
	{		diag_log format["[blckeagls] missionSpawner:: --  >>  Mission tripped by nearby player: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
	};
	
	if (count _missionLootBoxes > 0) then
	{
		_crates = [_coords,_missionCfg select 2/* array of crates*/] call blck_fnc_spawnMissionCrates;
	}
	else
	{
		_crates = [_coords,[[selectRandom blck_crateTypes /*"Box_NATO_Wps_F"*/,[0,0,0],_crateLoot,_lootCounts]]] call blck_fnc_spawnMissionCrates;
		
	};
	_objects = _objects + _crates;
	
	if (blck_debugON) then
	{
		diag_log format["[blckeagls] missionSpawner:: Crates Spawned: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
	};
	
	uiSleep _delayTime;

	if (blck_SmokeAtMissions select 0) then  // spawn a fire and smoke near the crate
	{
		private ["_temp"];
		_temp = [_coords,blck_SmokeAtMissions select 1] call blck_fnc_smokeAtCrates;
		_objects = _objects + _temp;
	};
	uiSleep _delayTime;
	if (_useMines) then
	{
		_mines = [_coords] call blck_fnc_spawnMines;
		//waitUntil{!(_mines isEqualTo [];);
		uiSleep _delayTime;;
	};
	uiSleep _delayTime;

	if (_missionLandscapeMode isEqualTo "random") then
	{
		_objects = [_coords,_missionLandscape, 3, 15, 2] call blck_fnc_spawnRandomLandscape;
	} else {
		_objects = [_coords, round(random(360)),_missionLandscape,true] call blck_fnc_spawnCompositionObjects;
	};
	if (blck_debugON) then
	{
		diag_log format["[blckeagls] missionSpawner:: Landscape spawned: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
	};
	
	uiSleep _delayTime;;

	if ((count _missionLootVehicles) > 0) then  // spawn loot vehicles
	{
		{
			//diag_log format["spawnMissionCVehicles.sqf _x = %1",_x];
			_offset = _x select 1; // offset relative to _coords at which to spawn the vehicle
			_pos = [(_coords select 0)+(_offset select 0),(_coords select 1) + (_offset select 1),(_coords select 2)+(_offset select 2)];
			_veh = [_x select 0 /* vehicle class name*/, _pos] call blck_fnc_spawnVehicle;
			_vehs pushback _veh;
			[_veh,_x select 2 /*loot array*/, _x select 3 /*array of values specifying number of items of each loot type to load*/] call blck_fnc_fillBoxes;
		}forEach _missionLootVehicles;
		uiSleep _delayTime;
	};

	if (blck_useStatic && (_noEmplacedWeapons > 0)) then
	{
		private["_static","_count"];
		if ( count (_missionEmplacedWeapons) > 0 ) then
		{
			_static = _missionCfg select 4 select 1;
			_count = _missionCfg select 4 select 0;
		}
		else
		{
			_static = blck_staticWeapons;
			_count = _noEmplacedWeapons;
		};
		private ["_emplacedGroup","_emplacedPositions"];

		_emplacedPositions = [_coords,_count,35,50] call blck_fnc_findPositionsAlongARadius;
		//diag_log format["missionSpawner:: _emplacedPositions = %1",_emplacedPositions];
		{
			_emplacedGroup = [_x,1,1,_aiDifficultyLevel,_coords,1,2,_uniforms,_headGear] call blck_fnc_spawnGroup;
			//_emplacedUnits = units _emplacedGroup;
			_blck_AllMissionAI = _blck_AllMissionAI + (units _emplacedGroup);
			_emplacedWeapon = [_x,_emplacedGroup,blck_staticWeapons,5,15] call  blck_fnc_spawnEmplacedWeapon;
			_missionAIVehicles pushback _emplacedWeapon;
			uiSleep _delayTime;
		}forEach _emplacedPositions;
		//diag_log format["missionSpawner:: emplaced weapons data: _AI_Vehicles %1  _blck_AllMissionAI %1",_AI_Vehicles,_blck_AllMissionAI];
		if (blck_debugON) then
		{
			diag_log format["[blckeagls] missionSpawner:: Static Weapons Spawned: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
		};
	};

	//diag_log format["_fnc_missionSpawner:: after adding any static weapons, _blck_AllMissionAI is %1",_blck_AllMissionAI];
	if (blck_useVehiclePatrols && (_noVehiclePatrols > 0)) then
	{
		private["_vehGroup","_patrolVehicle","_vehiclePatrolSpawns"];
		_vehiclePatrolSpawns= [_coords,_noVehiclePatrols,45,60] call blck_fnc_findPositionsAlongARadius;
		diag_log format["missionSpawner:: _vehiclePatrolSpawns = %1",_vehiclePatrolSpawns];
		//for "_i" from 1 to _noVehiclePatrols do
		{
			_vehGroup = [_x,3,3,_aiDifficultyLevel,_coords,1,2,_uniforms,_headGear] call blck_fnc_spawnGroup;
			//diag_log format["missionSpawner:: group for AI Patrol vehicle spawn: group is %1 with units of %2",_vehGroup, units _vehGroup];
			_blck_AllMissionAI = _blck_AllMissionAI + (units _vehGroup);
			_randomVehicle = blck_AIPatrolVehicles call BIS_fnc_selectRandom;
			//diag_log format["missionSpawner:: vehicle selected is %1", _randomVehicle];
			_patrolVehicle = [_coords,_x,_randomVehicle,(_x distance _coords) -5,(_x distance _coords) + 5,_vehGroup] call blck_fnc_spawnVehiclePatrol;
			//diag_log format["missionSpawner:: patrol vehicle spawned was %1",_patrolVehicle];
			_vehGroup setVariable["groupVehicle",_patrolVehicle,true];
			//uiSleep _delayTime;
			_AI_Vehicles pushback _patrolVehicle;
		}forEach _vehiclePatrolSpawns;
		//diag_log format["missionSpawner:: vehicle patrols data: _AI_Vehicles %1  _blck_AllMissionAI %1",_AI_Vehicles,_blck_AllMissionAI];
		uiSleep _delayTime;
		if (blck_debugON) then
		{
			diag_log format["[blckeagls] missionSpawner:: Vehicle Patrols Spawned: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
		};
	};
	//diag_log format["_fnc_missionSpawner:: after adding any vehicle patrols, _blck_AllMissionAI is %1",_blck_AllMissionAI];
	//diag_log format["missionSpawner::  _noAIGroups = %1; spawning AI Groups now",_noAIGroups];

	private["_unitsToSpawn","_unitsPerGroup","_ResidualUnits","_newGroup"];
	_unitsToSpawn = round(_minNoAI + round(random(_maxNoAI - _minNoAI)));
	_unitsPerGroup = floor(_unitsToSpawn/_noAIGroups);
	_ResidualUnits = _unitsToSpawn - (_unitsPerGroup * _noAIGroups);
	//diag_log format["missionSpawner:: _unitsToSpawn %1 ; _unitsPerGroup %2  _ResidualUnits %3",_unitsToSpawn,_unitsPerGroup,_ResidualUnits];
	switch (_noAIGroups) do
	{
		case 1: {  // spawn the group near the mission center
			//params["_pos", ["_numai1",5], ["_numai2",10], ["_skillLevel","red"], "_center", ["_minDist",20], ["_maxDist",35], ["_uniforms",blck_SkinList], ["_headGear",blck_headgear] ];
			_newGroup = [_coords,_unitsToSpawn,_unitsToSpawn,_aiDifficultyLevel,_coords,3,18,_uniforms,_headGear] call blck_fnc_spawnGroup;
			 _newAI = units _newGroup;
			 _blck_AllMissionAI = _blck_AllMissionAI + _newAI;
			 //diag_log format["missionSpawner: Spawning Groups: _noAIGroups=1 _newGroup=%1 _newAI = %2",_newGroup, _newAI];
			 };
		case 2: {
				//diag_log format["missionSpawner: Spawning Groups: _noAIGroups=2"];  // spawn groups on either side of the mission area
				_groupLocations = [_coords,_noAIGroups,15,30] call blck_fnc_findPositionsAlongARadius;
				{
					private["_adjusttedGroupSize"];
					if (_ResidualUnits > 0) then
					{
						_adjusttedGroupSize = _unitsPerGroup + _ResidualUnits;
						_ResidualUnits = 0;
					} else {
						_adjusttedGroupSize = _unitsPerGroup;
					};
					_newGroup = [_x,_adjusttedGroupSize,_adjusttedGroupSize,_aiDifficultyLevel,_coords,1,12,_uniforms,_headGear] call blck_fnc_spawnGroup;
					_newAI = units _newGroup;
					_blck_AllMissionAI = _blck_AllMissionAI + _newAI;
					//diag_log format["missionSpawner: Spawning 2 Groups: _newGroup=%1  _newAI = %2",_newGroup, _newAI];
				}forEach _groupLocations;

			};
		case 3: { // spawn one group near the center of the mission and the rest on the perimeter
				//diag_log format["missionSpawner: Spawning Groups: _noAIGroups=3"];
				_newGroup = [_coords,_unitsPerGroup + _ResidualUnits,_unitsPerGroup + _ResidualUnits,_aiDifficultyLevel,_coords,1,12,_uniforms,_headGear] call blck_fnc_spawnGroup;
				_newAI = units _newGroup;
				_blck_AllMissionAI = _blck_AllMissionAI + _newAI;
				//diag_log format["missionSpawner: Spawning Groups: _noAIGroups=3 _newGroup=%1 _newAI = %2",_newGroup, _newAI];
				_groupLocations = [_coords,2,20,35] call blck_fnc_findPositionsAlongARadius;
				{
					_newGroup = [_x,_unitsPerGroup,_unitsPerGroup,_aiDifficultyLevel,_coords,1,12,_uniforms,_headGear] call blck_fnc_spawnGroup;
					_newAI = units _newGroup;
					_blck_AllMissionAI = _blck_AllMissionAI + _newAI;
					//diag_log format["missionSpawner: Spawning 2 Groups:_newGroup=%1  _newAI = %2",_newGroup, _newAI];
				}forEach _groupLocations;

			};
		default {  // spawn one group near the center of the mission and the rest on the perimeter
				//diag_log format["missionSpawner: Spawning Groups: _noAIGroups=default"];
				_newGroup = [_coords,_unitsPerGroup + _ResidualUnits,_unitsPerGroup + _ResidualUnits,_aiDifficultyLevel,_coords,1,12,_uniforms,_headGear] call blck_fnc_spawnGroup;
				_newAI = units _newGroup;
				_blck_AllMissionAI = _blck_AllMissionAI + _newAI;
				//diag_log format["missionSpawner: Spawning Groups: _noAIGroups=%3 _newGroup=%1 _newAI = %2",_newGroup, _newAI,_noAIGroups];
				_groupLocations = [_coords,(_noAIGroups - 1),20,40] call blck_fnc_findPositionsAlongARadius;
				{
					_newGroup = [_x,_unitsPerGroup,_unitsPerGroup,_aiDifficultyLevel,_coords,1,12,_uniforms,_headGear] call blck_fnc_spawnGroup;
					_newAI = units _newGroup;
					_blck_AllMissionAI = _blck_AllMissionAI + _newAI;
					//diag_log format["missionSpawner: Spawning %3 Groups: _newGroup=%1  _newAI = %2",_newGroup, _newAI,_noAIGroups];
				}forEach _groupLocations;
			};
	};
	
	if (blck_debugON) then
	{
		diag_log format["[blckeagls] missionSpawner:: AI Patrols Spawned: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
	};
	
	if ((random(1) < _chanceReinforcements)) then
	{
		_weaponList = blck_WeaponList_Red;

		switch (_aiDifficultyLevel) do {
			case "blue": {_weaponList = blck_WeaponList_Blue;};
			case "red": {_weaponList = blck_WeaponList_Red;};
			case "green": {_weaponList = blck_WeaponList_Green;};
			case "orange": {_weaponList = blck_WeaponList_Orange;};
			default {_weaponList = blck_WeaponList_Blue;};
		};

		diag_log format["missionSpawner:: weaponList = %1",_weaponList];
		private["_grpReinforcements"];
		_grpReinforcements = grpNull;
		
		diag_log format["[blckeagls] missionSpawner:: calling in reinforcements: Current mission: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
		[] spawn {
			//[_coords,_noPara,_aiDifficultyLevel,_chanceLoot,_reinforcementLootCounts,_weaponList,_uniforms,_headgear,_chanceHeliPatrol] call blck_fnc_Reinforcements;
			//waitUntil {_grpReinforcements != grpNull};
			//diag_log format["[blckeagls] missionSpawner::reinforcement spawner started: Current mission: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
		};
		if !(_grpReinforcements isEqualTo grpNull) then
		{
			_blck_AllMissionAI = _blck_AllMissionAI + (units _grpReinforcements);
			//diag_log format["missionSpawner:: _grpReinforcements = %1",_grpReinforcements];
		};
	};
	
	// Trigger for mission end
	//diag_log format["[blckeagls] mission Spawner _endCondition = %1",_endCondition];
	private["_missionComplete"];
	_missionComplete = -1;

	_endIfPlayerNear = false;
	_endIfAIKilled = false;
	_startTime = diag_tickTime;
	_missionTimedOut = false;

	switch (_endCondition) do
	{
		case "playerNear": {_endIfPlayerNear = true;};
		case "allUnitsKilled": {_endIfAIKilled = true;};
		case "allKilledOrPlayerNear": {_endIfPlayerNear = true;_endIfAIKilled = true;};
	};
	//diag_log format["missionSpawner :: _endIfPlayerNear = %1 _endIfAIKilled= %2",_endIfPlayerNear,_endIfAIKilled];
	private["_locations"];
	_locations = [_coords] + _crates;
	
	//diag_log format["missionSpawner:: Waiting for player to satisfy mission end criteria of _endIfPlayerNear %1 with _endIfAIKilled %2",_endIfPlayerNear,_endIfAIKilled];
	while {_missionComplete  == -1} do
	{
		if (_endIfPlayerNear) then {
			if ( { (isPlayer _x) && ([_x,_locations,20] call blck_fnc_playerInRange) && (vehicle _x == _x) } count playableunits > 0) then {
				_missionComplete = 1;
			};
		};
		//diag_log format["missionSpawner:: count alive _blck_AllMissionAI = %1",{alive _x} count _blck_AllMissionAI];
		if (_endIfAIKilled) then {
			if (({alive _x} count _blck_AllMissionAI) < 1 ) then {
				_missionComplete = 1;
				//diag_log format["missionSpawner:: _blck_AllMissionAI = %1","testing case _endIfAIKilled"];
			};
		};
		uiSleep 2;
	};
	
	if (blck_debugON) then
	{
		diag_log format["[blckeagls] missionSpawner:: Mission completion criteria fulfilled: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
	};
	
	if (blck_useSignalEnd) then
	{
		//diag_log format["**** Minor\SM1.sqf::    _crate = %1",_crates select 0];
		[_crates select 0] spawn blck_fnc_signalEnd;
		
		if (blck_debugON) then
		{
			diag_log format["[blckeagls] missionSpawner:: SignalEnd called: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
		};
	};
	[_mines] spawn blck_fnc_clearMines;
	[_objects, blck_cleanupCompositionTimer] spawn blck_fnc_cleanupObjects;
	
	[_blck_AllMissionAI,blck_AliveAICleanUpTime] spawn blck_fnc_cleanupAliveAI;
	
	["end",_endMsg,_blck_localMissionMarker select 2] call blck_fnc_messageplayers;
	[_blck_localMissionMarker select 1, _missionType] execVM "debug\missionCompleteMarker.sqf";
	[_blck_localMissionMarker select 0] execVM "debug\deleteMarker.sqf";
	//[_blck_localMissionMarker select 0,"Completed"] call blck_fnc_updateMissionQue;
	diag_log format["[blckeagls] missionSpawner:: end of mission: _cords %1 : _missionType %2 :  _aiDifficultyLevel %3 _markerMissionName %4",_coords,_missionType,_aiDifficultyLevel,_markerMissionName];
};
