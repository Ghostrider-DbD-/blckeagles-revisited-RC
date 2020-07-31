/*
	Author: Ghostrider [GRG]
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP
	License: Attribution-NonCommercial-ShareAlike 4.0 International
	call with
	[
		_supplyHeli,		// heli from which they should para
		_lootCounts,
		_lootSetting // [blue, red, green, orange]
	] call blck_spawnHeliParaCrate

	**  here for future usage **
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_supplyHeli","_lootCounts"];

private ["_chute","_crate"];
_crate = "";
_chute = "";

diag_log "_fnc_spawnParaCrate:: spawning crate";

private["_dir","_offset"];
_dir = getDir _supplyHeli;
_dir = if (_dir < 180) then {_dir + 210} else {_dir - 210};
_offset =  _supplyHeli getPos [10, _dir];

//open parachute and attach to crate
_chute = createVehicle ["I_Parachute_02_F", [100, 100, 100], [], 0, "FLY"];
[_chute] call blck_fnc_protectVehicle;
_chute setPos [_offset select 0, _offset select 1, 100  ];  //(_offset select 2) - 10];
	
//create the parachute and crate
private["_crateSelected"];
_crateSelected = selectRandom["Box_FIA_Ammo_F","Box_FIA_Support_F","Box_FIA_Wps_F","I_SupplyCrate_F","Box_IND_AmmoVeh_F","Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","IG_supplyCrate_F"];
_crate = [getPos _chute, _crateSelected] call blck_fnc_spawnCrate;
_crate setPos [position _supplyHeli select 0, position _supplyHeli select 1, 250];  //(position _supplyHeli select 2) - 10];	
_crate attachTo [_chute, [0, 0, -1.3]];
_crate allowdamage false;
_crate enableRopeAttach true;  // allow slingloading where possible

switch (_lootSetting) do
{
	case "orange": {[_crate, blck_BoxLoot_Orange, _lootCounts] call blck_fnc_fillBoxes;};
	case "green": {[_crate, blck_BoxLoot_Green, _lootCounts] call blck_fnc_fillBoxes;};
	case "red": {[_crate, blck_BoxLoot_Red, _lootCounts] call blck_fnc_fillBoxes;};
	case "blue": {[_crate, blck_BoxLoot_Blue, _lootCounts] call blck_fnc_fillBoxes;};
	default {[_crate, blck_BoxLoot_Red, _lootCounts] call blck_fnc_fillBoxes;};
};

_fn_monitorCrate = {
	params["_crate","_chute"];
	uiSleep 30;
	private["_crateOnGround"];
	_crateOnGround = false;
	while {!_crateOnGround} do
	{
		uiSleep 1;  
		if ( (((velocity _crate) select 2) < 0.1)  || ((getPosATL _crate select 2) < 0.1) ) exitWith 
		{
			uiSleep 10; // give some time for everything to settle
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

[_crate,_chute] call _fn_monitorCrate;
[[_crate], 1200 /* 20 min*/] spawn blck_fnc_addObjToQue;
