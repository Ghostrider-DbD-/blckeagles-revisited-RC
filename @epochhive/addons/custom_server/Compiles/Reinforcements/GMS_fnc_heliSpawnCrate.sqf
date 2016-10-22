/*
	Author: Ghostrider-DbD-
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP
	License: Attribution-NonCommercial-ShareAlike 4.0 International
	call with
	[
		_supplyHeli,		// heli from which they should para
		_skillAI,			// Skill [blue, red, green, orange]
	] call blck_spawnHeliParaCrate
*/


params["_supplyHeli","_lootCounts","_skillAI"];

private ["_chute","_crate"];
_crate = "";
_chute = "";

diag_log "blck_spawnHeliParaCrate:: spawning crate";

private["_dir","_offset"];
_dir = getDir _supplyHeli;
_dir = if (_dir < 180) then {_dir + 210} else {_dir - 210};
_offset =  _supplyHeli getPos [10, _dir];

//open parachute and attach to crate
_chute = createVehicle ["I_Parachute_02_F", [100, 100, 200], [], 0, "FLY"];
private["_modType"];
_modType = call blck_getModType;
if (_modType isEqualTo "Epoch") then
{
	[_chute] call blck_fnc_protectVehicle;
};
_chute setPos [_offset select 0, _offset select 1, 250  ];  //(_offset select 2) - 10];

diag_log format["blck_spawnHeliParaCrate:: chute spawned yielding object %1 at postion %2", _chute, getPos _chute];
	
//create the parachute and crate
private["_crateSelected"];
_crateSelected = selectRandom["Box_FIA_Ammo_F","Box_FIA_Support_F","Box_FIA_Wps_F","I_SupplyCrate_F","Box_IND_AmmoVeh_F","Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","IG_supplyCrate_F"];
_crate = [getPos _chute, _crateSelected] call blck_fnc_spawnCrate;
//_crate = createVehicle [_crateSelected, position _chute, [], 0, "CAN_COLLIDE"];
_crate setPos [position _supplyHeli select 0, position _supplyHeli select 1, 250];  //(position _supplyHeli select 2) - 10];	
_crate attachTo [_chute, [0, 0, -1.3]];
_crate allowdamage false;
_crate enableRopeAttach true;  // allow slingloading where possible

diag_log format["heliSpawnCrate:: crate spawned %1 at position %2 and attached to %3",_crate, getPos _crate, attachedTo _crate];


switch (_skillAI) do
{
	case "orange": {[_crate, blck_BoxLoot_Orange, _lootCounts] call blck_fnc_fillBoxes;};
	case "green": {[_crate, blck_BoxLoot_Green, _lootCounts] call blck_fnc_fillBoxes;};
	case "red": {[_crate, blck_BoxLoot_Red, _lootCounts] call blck_fnc_fillBoxes;};
	case "blue": {[_crate, blck_BoxLoot_Blue, _lootCounts] call blck_fnc_fillBoxes;};
	default {[_crate, blck_BoxLoot_Red, _lootCounts] call blck_fnc_fillBoxes;};
};
	
diag_log format["heliSpawnCrate:: crate loaded and now at position %1 and attached to %2", getPos _crate, attachedTo _crate];

_fn_monitorCrate = {
	params["_crate","_chute"];
	uiSleep 30;
	private["_crateOnGround"];
	_crateOnGround = false;
	while {!_crateOnGround} do
	{
		uiSleep 1;  
		diag_log format["heliSpawnCrate::  Crate Altitude: %1  Crate Velocity: %2  Crate Position: %3 Crate attachedTo %4", getPos _crate select 2, velocityModelSpace _crate select 2, getPosATL _crate, attachedTo _crate];
		if ( (((velocity _crate) select 2) < 0.1)  || ((getPosATL _crate select 2) < 0.1) ) then 
		{
			uiSleep 5; // give some time for everything to settle
			_crateOnGround = true;
			_spawnCrate = false;

			//delete the chute for clean-up purposes
			detach _crate;
			deleteVehicle _chute;
			if (surfaceIsWater (getPos _crate)) then
			{
				deleteVehicle _crate;
			} else
			{
				[_crate] call blck_fnc_signalEnd;
			};
		};
	};
};

[_crate,_chute] spawn _fn_monitorCrate;
