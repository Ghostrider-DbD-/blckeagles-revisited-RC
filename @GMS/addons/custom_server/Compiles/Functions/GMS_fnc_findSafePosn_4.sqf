// self explanatory. Checks to see if the position is in either a black listed location or near a player spawn. 
// As written this relies on BIS_fnc_findSafePos to ensure that the spawn point is not on water or an excessively steep slope. 
// 
/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
private _startTime = diag_tickTime;
private _minDistFromBases = blck_minDistanceToBases;
private _minDistFromMission = blck_MinDistanceFromMission;
private _minDistanceFromTowns = blck_minDistanceFromTowns;
private _minDistanceFromPlayers = blck_minDistanceToPlayer;

private _weightBlckList = 0.95;
private _weightBases = 0.9;
private _weightMissions = 0.8;
private _weightTowns = 0.7;
private _weightPlayers = 0.6;
private _weightRecentMissions = 0.6;
private _minDistanceRecentMissions = 500;

// remove any recent mission locations that have timed out
for "_i" from 1 to (count blck_recentMissionCoords) do 
{
	if (_i > (count blck_recentMissionCoords)) exitWith {};
	private _oldMission = blck_recentMissionCoords deleteAt 0;
	if (diag_tickTime < ((_oldMission select 1) + 900)) then
	{
		blck_recentMissionCoords pushBack _oldMission;
	};
};

private _waterMode = 0;
private _shoreMode = 0;
private _maxGrad = 0.20;
private _minObjDist = 30;
private _searchDist = blck_mapRange / 2;
private _coords = [];
private _findNew = true;
private _tries = 0;

while {_coords isEqualTo []} do
{
	_findNew = false;
	_coords = [];
	//     [center, minDist, maxDist, objDist, waterMode, maxGrad, shoreMode, blacklistPos, defaultPos] call BIS_fnc_findSafePos 
	while {_coords isEqualTo [] && _tries < 500} do 
	{
		private _searchCenter = blck_mapCenter getPos[_searchDist, random(359)];
		_coords = [_searchCenter,0,_searchDist,_minObjDist,_waterMode,_maxGrad,_shoreMode] call BIS_fnc_findSafePos;
		_tries = _tries + 1;
		//[format["_fnc_findSafePosn(57): _tries = %1 | _coords = %2",_tries,_coords]] call blck_fnc_log;
	};
	
	{
		//diag_log format["_fnc_findSafePosn(67): _recentMissionCoords %1 = %2",_forEachIndex,_x];
		if (((_x select 0) distance2D _coords) < _minDistanceRecentMissions) then 
		{
			_findNew = true;
			if (blck_debugLevel >= 3) then {[format["_findSafePosn(68): too close to recent missions"]] call blck_fnc_log};
		};
	}forEach blck_recentMissionCoords;
	
	//diag_log format["_fnc_findSafePosn (61): _coords = %1 | _tries = %2 | count blck_locationBlackList = %1",_coords,_tries, count blck_locationBlackList];
	{
		
		//diag_log format["_fnc_findSafePosn (77): location _x = %1",_x];
		if ( ((_x select 0) distance2D _coords) < (_x select 1)) exitWith
		{
			_findNew = true;
			if (blck_debugLevel >= 3) then {[format["_findSafePosn(77): too close to blacklisted position _coords = %1 | blacklisted pos = %2 | dist to blacklisted pos = %3",_coords,_x select 0, _x select 1]] call blck_fnc_log};
		};
	} forEach blck_locationBlackList;
	
	if !(_findNew) then
	{
		{
			if ( (_x distance2D _coords) < _minDistFromMission) exitWith
			{
				_findNew = true;
				if (blck_debugLevel >= 3) then {[format["_findSafePosn(87): too close to active mission"]] call blck_fnc_log};
			};
		} forEach blck_ActiveMissionCoords;	
	};

	if !(_findNew) then
	{
		private _poles = [];
		if (blck_modType isEqualTo "Epoch") then {_poles = allMissionObjects "PlotPole_EPOCH"};
		if (blck_modType isEqualTo "Exile") then {_poles = allMissionObjects "Exile_Construction_Flag_Static"};		
		//diag_log format["_fnc_findSafePosn: count _poles = %1 | _poles = %2",count _poles,_poles];
		{
			if ((_x distance2D _coords) < blck_minDistanceToBases) then
			{
				_findNew = true;
				if (blck_debugLevel >= 3) then {[format["_findSafePosn(98): too close to bases"]] call blck_fnc_log};
			};
		}forEach _poles;		
	};
	
	if !(_findNew) then
	{
		{
			_townPos = [((locationPosition _x) select 0), ((locationPosition _x) select 1), 0];
			if (_townPos distance2D _coords < blck_minDistanceFromTowns) exitWith {
				_findNew = true;
				if (blck_debugLevel >= 3) then {[format["_findSafePosn(109): too close to towns/cities"]] call blck_fnc_log};
			};
		} forEach blck_townLocations;	
	};
	
	if !(_findNew) then
	{
		{
			if (isPlayer _x && (_x distance2D _coords) < blck_minDistanceToPlayer) then 
			{
				_findNew = true;
				if (blck_debugLevel >= 3) then {[format["_findSafePosn(120): too close to player"]] call blck_fnc_log};
			};
		}forEach playableUnits;	
	};

	if !(_findNew) then
	{
		// test for water nearby
		for [{_i=0}, {_i<360}, {_i=_i+20}] do
		{
			//_xpos = (_coords select 0) + sin (_i) * _dist;
			//_ypos = (_coords select 1) + cos (_i) * _dist;
			//_newPos = [_xpos,_ypos,0];
			if (surfaceIsWater (_coords getPos[50,_i])) exitWith
			{
				_findNew = true;
				if (blck_debugLevel >= 3) then {[format["_findSafePosn(137): too close to water"]] call blck_fnc_log};
			};
		};
	};
	
	if !(_findNew) then {
		_isflat = _coords isFlatEmpty [20,0,0.5,100,0,false];
		if (_isflat isequalto []) then {
			_findNew = true;
			if (blck_debugLevel >= 3) then {[format["_findSafePosn(146): position NOT flat"]] call blck_fnc_log};
		} else {
			if (blck_debugLevel >= 3) then {[format["_findSafePosn(150): _coords changed from %1 to %2 (the flattest)",_coords,_isFlat]] call blck_fnc_log};
			_coords = ASLToATL _isFlat;
		};
	};
	
	if (_findNew) then
	{
		_minDistFromMission = _minDistFromMission * _weightMissions;
		_minDistFromBases = _minDistFromBases * _weightBases;
		_minDistanceFromPlayers = _minDistanceFromPlayers * _weightPlayers;
		_minDistanceFromTowns = _minDistanceFromTowns * _weightTowns;
		_minDistanceRecentMissions = _minDistanceRecentMissions * _weightRecentMissions;
		_coords = [];		
	};
	[format["_fnc_findSafePosn(140) end of cycle logging: _tries = %1 | _coords = %2 | _findNew = %3",_tries,_coords,_findNew]] call blck_fnc_log;	
};

if ((count _coords) > 2) then 
{
	private["_temp"];
	_temp = [_coords select 0, _coords select 1];
	_coords = _temp;
};
[format["_fnc_findSafePosn(148) final logging: _elapsedTime %3 | _tries = %1 | _coords = %2",_tries,_coords,diag_tickTime - _startTime]] call blck_fnc_log;
_coords;


