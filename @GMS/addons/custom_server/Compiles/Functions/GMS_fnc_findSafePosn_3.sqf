/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/

	Notes: cosine acute angle = hypotenuse / opposite. We always know the opposite = 1/2 mapsize so if we pick a random angle, we can calculate distance to edge of map. 
	Thus, we can have a random direction, calculate distance to the map edge as cos(direction - east/south/west/north angle) * 1/2 mapsize. Then, we can use 1/2 the lenght of the hypotenuse as the search range.
	In this way we can reduce the radius of the search by about 1/2 and ensure a wider range of terrain is selected.

	However, if we use this approach, we risk having some missions spawn outside the map so much check for that.
	It may be quicker just to pick a random angle and use 1/2 map size to search a position obtained by getPos[(1/2 mapSize),random(359)]; to pick that random seed location for the search.
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

if (isNil "blck_locationBlackList") then {blck_locationBlackList = []};

_fn_buildBlacklistedLocationsList = {
	params["_minToBases","_minToPlayers","_minToMissions","_minToTowns","_minToRecentMissionLocation"];
	/* locations of villages / cities / others already included in blck_locationBlackList so we do not need to add it here.  */
	private _blacklistedLocs =  +blck_locationBlackList;	

	for '_i' from 1 to (count blck_recentMissionCoords) do {
		private _loc = blck_recentMissionCoords deleteAt 0;
		if (_loc select 1 < diag_tickTime) then 
		{
			blck_recentMissionCoords pushBack _loc;
			_blacklistedLocs pushBack [_loc select 0, _minToRecentMissionLocation];
		};
	};	

	{
		_blacklistedLocs pushBack [_x,_minToMissions];
	} forEach blck_ActiveMissionCoords;	

	private _bases = [];
	if (blck_modType isEqualTo "Epoch") then {_bases = nearestObjects[blck_mapCenter, ["PlotPole_EPOCH"], blck_mapRange + 25000]};
	if (blck_modType isEqualTo "Exile") then {_bases = nearestObjects[blck_mapCenter, ["Exile_Construction_Flag_Static"], blck_mapRange + 25000]};

	{
		_blacklistedLocs pushBack [getPosATL _x,_minToBases];
	} forEach _bases;	

	{
		_blacklistedLocs pushBack [getPosATL _x,_minToPlayers];
	} forEach allPlayers;	

	if (blck_minDistanceFromDMS > 0) then 
	{
		_blacklistedLocs append ([] call blck_fnc_getAllDMSMarkers);
	};

	_blacklistedLocs
};

_fnc_nearWater = {
	private _result 	= false;
	private _coords 	= _this select 0;
	private _radius		= _this select 1;

	for "_i" from 0 to 359 step 45 do {
		//_checkposition = [(_coords select 0) + (sin(_i)*_radius), (_coords select 1) + (cos(_i)*_radius)];
		//_checkposition2 = [(_coords select 0) + (sin(_i)*_radius/2), (_coords select 1) + (cos(_i)*_radius/2)];
		//_checkPosition = _coords getPos[_radius, _i];
		if (surfaceIsWater (_coords getPos[_radius, _i])) exitWith {
			_result = true; 
		};
	};
	_result
};

private _minDistToBases = blck_minDistanceToBases;
private _minDistToPlayers = blck_minDistanceToPlayer;
private _minDistToTowns = blck_minDistanceFromTowns;
private _mindistToMissions = blck_MinDistanceFromMission;
private _minToRecentMissionLocation = 200;
private _keyDistances = [_minDistToBases,_minDistToPlayers,_minDistToTowns,_minToRecentMissionLocation];
private _coords = [];
//private _blacklistedLocations = [_minDistToBases,_minDistToPlayers,_minDistToTowns,_mindistToMissions,_minToRecentMissionLocation] call _fn_buildBlacklistedLocationsList;
private _count = 25;
private _flatCoords = [];
private _slope = 0.15;
private _searchDist = blck_mapRange / 2;
private _timeIn = diag_tickTime;
private _validspot = false;
while { !_validspot} do 
{
	private _angle = random(359);
	private _searchCenter = blck_mapCenter getPos[_searchDist, random(359)];
	_coords = [_searchCenter,0,_searchDist,10,0,_slope,0] call BIS_fnc_findSafePos;

	if (_coords isEqualTo []) then 
	{
		_count = _count - 1;
		_slope = _slope + 0.02;
		uiSleep 0.1; // to give the server a chance to handle other jobs for a moment
		diag_log format["_findSafePosn: _count = %1 | _slope = %2 | _coords = %3",_count,_slope,_coords];
	} else {

		//uiSleep 1;
		_validspot = true;

		if (count _coords > 2) then {
			_validspot = false;
		};
		if(_validspot) then {
			if ([_coords,500] call _fnc_nearWater) then {
				_validspot = false;
			};
		};
		if(_validspot) then {
			_isflat = _coords isFlatEmpty [20,0,0.5,100,0,false];
			if (_isflat isequalto []) then {
				_validspot = false;
			};
		};
		if(_validspot) then {
			{
				if (_coords distance _x < blck_MinDistanceFromMission) exitwith {
					_validspot = false; 
				};
			} foreach (blck_ActiveMissionCoords);
		};

		// Check for near Bases
		if(_validspot) then {
			if (blck_modType isEqualTo "Epoch") then {
				{
					if (_coords distance _x < blck_minDistanceToBases) exitwith {
						_validspot = false; 
					};
				} foreach (missionnamespace getvariable ["Epoch_PlotPoles",[]]);
			}
			else {
				if (blck_modType isEqualTo "Exile") then {
					{
						if (_coords distance _x < blck_minDistanceToBases) exitwith {
							_validspot = false; 
						};				
					} foreach (nearestObjects [blck_mapCenter, ["Exile_Construction_Flag_Static"], blck_mapRange + 25000]);
				};
			};
		};

		// Check for near Players
		if(_validspot) then {
			{
				if (_coords distance _x < blck_minDistanceToPlayer) exitwith {
					_validspot = false;
				};
			} foreach allplayers;
		};

		// Check for near locations 
		if (_validspot) then {
			{
				if (_coords distance (_x select 0) < (_x select 1)) exitWith {
					_validspot = false;
				};
			} forEach blck_locationBlackList;
		};

		// Check for DMS missions 
		if (blck_minDistanceFromDMS > 0 && _validspot) then 
		{
			{
				if (_coords distance _x < blck_minDistanceFromDMS) exitWith {
					_validspot = false;
				};
			} forEach ([] call blck_fnc_getAllDMSMarkers);
		};		

	};

	//diag_log format["_fnc_findSafePosn: _coords = %1 | _flatCoords = %2 | _searchCenter = %3 | _angle %4 | _count = %5 | _validSpot = %6",_coords,_flatCoords,_searchCenter,_angle,_count,_validspot];
};

if (_coords isEqualTo []) then 
{
	["Could not find a safe position for a mission, consider reducing values for minimum distances between missions and players, bases, other missions or towns","error"] call blck_fnc_log;
} else {
	_coords set[2, 0];
	//diag_log format["_fnc_findSafePosn: _exit with _coords = %1 | time spent = %2",_coords,diag_tickTime - _timeIn];
};

_coords



