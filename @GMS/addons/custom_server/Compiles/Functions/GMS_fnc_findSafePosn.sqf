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

private _minDistToBases = blck_minDistanceToBases;
private _minDistToPlayers = blck_minDistanceToPlayer;
private _minDistToTowns = blck_minDistanceFromTowns;
private _mindistToMissions = blck_MinDistanceFromMission;
private _minToRecentMissionLocation = 200;
private _coords = [];
private _blacklistedLocations = [_minDistToBases,_minDistToPlayers,_minDistToTowns,_mindistToMissions,_minToRecentMissionLocation] call _fn_buildBlacklistedLocationsList;
private _count = 25;
private "_isFlatCoords";
private _slope = 0.10;
	
_coords = [blck_mapCenter,0,blck_mapRange,10,0,_slope,0,_blacklistedLocations] call BIS_fnc_findSafePos;
if !(_coords isEqualTo []) then 
{
	_isFlatCoords = _coords isFlatEmpty [10,0,_slope,30,0,false];
};

while { (_isFlatCoords isEqualTo [] || _coords isEqualTo []) && _count > 0} do 
{

	_coords = [blck_mapCenter,0,blck_mapRange,10,0,_slope,0,_blacklistedLocations] call BIS_fnc_findSafePos;
	/* Check whether the location is flat enough: returns [] if not. */
	//  position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject] 

	if !(_coords isEqualTo []) then 
	{
		_isFlatCoords = _coords isFlatEmpty [10,0,_slope,30,0,false];
	};

	if (_coords isEqualTo [] || !(_isFlatCoords isEqualTo [])) then 
	{
		{
			//private _range = (_x select 1) * 0.7;
			_x set[1,(_x select 1) * 0.75];
		} forEach _blackListedLocations;
		_count = _count - 1;
		_slope = _slope + 0.02;
		uiSleep 0.1;
	};
};

if (_coords isEqualTo [] || _isFlatCoords isEqualTo []) then 
{
	diag_log format["[blckeagls] <ERROR> Could not find a safe position for a mission, consider reducing values for minimum distances between missions and players, bases, other missions or towns"];
} else {
	_isFlatCoords set[2, 0];
};

_isFlatCoords


