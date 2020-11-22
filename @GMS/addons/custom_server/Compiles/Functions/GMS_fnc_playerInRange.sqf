//////////////////////////////////////////////////////
// Test whether one object (e.g., a player) is within a certain range of any of an array of other objects
/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params[["_coords",[0,0,0]],["_range",0],["_onFootOnly",false]];
private ["_result","_players"];

private "_players";

if (_onFootOnly) then 
{
	_players = allPlayers select {(vehicle _x) isEqualTo _x && _x distance _coords < _range};	
} else {
	_players = allPlayers select {(_x distance _coords) < _range};
};

private _result = if (_players isEqualTo []) then {false} else {true};
//diag_log format["_fnc_playerInRange: _players = %1 | _result = %2 | _pos = %3 | _dist = %4 | _onFootOnly = %5",_players,_result,_coords,_range,_onFootOnly];
_result
