/*
	spawn a group of objects in random locations aligned with the radial from the center of the region to the object.
	By Ghostrider-DbD-
	Last modified 9-5-2016
	copyright 2016
*/

params["_coords","_missionLandscape",["_min",3],["_max",15],["_nearest",1]];
private["_objects"];
_objects = [];

{
	//Random Position Objects based on distance in array
	//  https://community.bistudio.com/wiki/BIS_fnc_findSafePos
	_pos = [_coords,_min,_max,_nearest,0,5,0] call BIS_fnc_findSafePos;
	_wreck = createVehicle[_x, _pos, [], 25, "NONE"];
	_wreck setVariable ["LAST_CHECK", (diag_tickTime + 100000)];

	private["_dir","_dirOffset"];
	
	_dirOffset = random(30) * ([1,-1] call BIS_fnc_selectRandom);
	_dir = _dirOffset +([_wreck,_coords] call BIS_fnc_dirTo);
	_wreck setDir _dir;
	_objects pushback _wreck;
	sleep 0.1;
} forEach _missionLandscape;

_objects;