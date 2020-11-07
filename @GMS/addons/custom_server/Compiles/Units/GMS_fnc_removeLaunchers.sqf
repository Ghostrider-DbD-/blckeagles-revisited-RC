/*
	by Ghostrider

	Removes an AI launcher and ammo
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_unit"];  // = _this select 0;
private _loadout = _unit getVariable["launcher",[[],[]]];
//diag_log format["_removeLaunchers: _loadout = %1",_loadout];
private _mags = magazines _unit;
//diag_log format["_removeLaunchers: _mags = %1",_mags];
{
	if (_forEachIndex > 0) then 
	{
		//diag_log format["_removeLaunchers: _x = %1",_x];
		_unit removeMagazines _x;
	};
} forEach (_loadout select 1);

private _launcher = _loadout select 0;
if !(_launcher isEqualTo []) then 
{
	if (_launcher in (weapons _unit)) then {
			_unit removeWeapon _launcher;
	} else {	
		{
			if (_launcher in (weaponCargo _x)) exitWith {deleteVehicle _x};
		} forEach (_unit nearObjects ["WeaponHolderSimulated",10]);
	};
};
