//////////////////////////////////////////////////////
// Test whether one object (e.g., a player) is within a certain range of any of an array of other objects
/*
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last Modified 2/24/17
*/
/////////////////////////////////////////////////////

private ["_result"];
params["_locations","_dist",["_onFootOnly",false]];
//diag_log format["_fnc_playerInRangeArray: _locations = %1 | _dist = %2 | _onFootOnly = %3",_locations,_dist, _onFootOnly];
_result = false;
{
	_result = [_x,_dist,_onFootOnly] call blck_fnc_playerInRange;
	if (_result) exitWith {};
} forEach _locations;
//diag_log format["_fnc_playerInRangeArray: _locations = %1 |_return = %2",_result];
_result