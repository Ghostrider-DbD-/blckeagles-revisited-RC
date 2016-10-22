/*
	Spawns a smoking wreck or object at a specified location and returns the objects spawn (wreck and the particle effects object)
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last updated 8-14-16
*/
private ["_objs","_wreckSelected","_smokeType","_fire","_posFire","_posWreck","_smoke","_dis","_minDis","_maxDis","_closest","_wrecks"];

_objs = [];

// http://www.antihelios.de/EK/Arma/index.htm
_wrecks = ["Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_Car_F","Land_Wreck_Offroad2_F","Land_Wreck_Offroad_F","Land_Tyres_F","Land_Pallets_F","Land_MetalBarrel_F"];
 
params["_pos","_mode",["_maxDist",12],["_wreckChoices",_wrecks],["_addFire",false]];

_wreckSelected = selectRandom _wreckChoices;
//_smokeTrail = "test_EmptyObjectForSmoke"; // "options are "test_EmptyObjectForFireBig", "test_EmptyObjectForSmoke"
_smokeType = if(_addFire) then {"test_EmptyObjectForFireBig"} else {"test_EmptyObjectForSmoke"};

switch (_mode) do {
	case "none": {if (true) exitWith {};};
	case "center": {_minDis = 5; _maxDis = 15; _closest = 5;};
	case "random": {_minDis = 15; _maxDis = 50; _closest = 10;};
	default {_minDis = 5; _maxDis = 15; _closest = 5;};
};
_dis = 0;
//_posWreck = [_pos, 0, 30, 10, 0, 20, 0] call BIS_fnc_findSafePos; // Position the wreck within 30 meters of the position and 5 meters away from the nearest object
// _minDis and _maxDis determine the spacing between the smoking item and the loot crate.
_minDis = 5; // Minimum distance of 
//_maxDis = 50;
_closest = 10;

while {_dis < _maxDist} do
{
	_posWreck = [_pos, _minDis, 50, _closest, 0, 20, 0] call BIS_fnc_findSafePos;  // find a safe spot near the location passed in the call
	_dis = _posWreck distance _pos;
};

// spawn a wreck near the mission center
_fire = createVehicle [_wreckSelected, [0,0,0], [], 0, "can_collide"];
_fire setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
_fire setPos _posWreck;
_fire setDir random(360);
//https://community.bistudio.com/wiki/setVectorUp
//_fire setVectorUp surfaceNormal position _fire;


// spawn asmoke or fire source near the wreck and attach it.
_smoke = createVehicle [_smokeType, [0,0,0], [], 0, "can_collide"];  // "test_EmptyObjectForSmoke" createVehicle _posFire;  
_smoke setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
_smoke setPos _posWreck;
_smoke attachto [_fire, [0,0,1]]; 

_objs = _objs + [_fire,_smoke];
//diag_log format ["--smokeAtCrate.sqf:: _objs = %1",_objs];
_objs
