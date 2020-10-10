/*
	Spawns a smoking wreck or object at a specified location and returns the objects spawn (wreck and the particle effects object)
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
 _wreckSelected = selectRandom ["Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_Car_F","Land_Wreck_Offroad2_F","Land_Wreck_Offroad_F","Land_Tyres_F","Land_Pallets_F","Land_MetalBarrel_F"];
params["_pos","_mode",["_maxDist",12],["_wreckChoices",_wreckSelected],["_addFire",false]];
private ["_objs","_wreckSelected","_smokeType","_fire","_posFire","_posWreck","_smoke","_dis","_minDis","_maxDis","_closest","_wrecks"];


 _smokeType = if(_addFire) then {"test_EmptyObjectForFireBig"} else {"test_EmptyObjectForSmoke"};

switch (_mode) do {
	case "none": {_minDis = 0; _maxDis = 1; _closest = 1;};
	case "center": {_minDis = 5; _maxDis = 15; _closest = 5;};
	case "random": {_minDis = 15; _maxDis = 50; _closest = 10;};
	default {_minDis = 5; _maxDis = 15; _closest = 5;};
};
private _posWreck = [_pos, _minDis, 50, _closest, 0, 20, 0] call BIS_fnc_findSafePos;  // find a safe spot near the location passed in the call


// spawn a wreck near the mission center
_fire = createVehicle [_wreckSelected, [0,0,0], [], 0, "can_collide"];
_fire setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
_fire setPos _posWreck;
_fire setDir random(360);

// spawn asmoke or fire source near the wreck and attach it.
_smoke = createVehicle [_smokeType, [0,0,0], [], 0, "can_collide"];  
_smoke setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
_smoke setPos _posWreck;
_smoke attachto [_fire, [0,0,1.5]]; 

_objs = [netID _fire,netID _smoke];
_objs
