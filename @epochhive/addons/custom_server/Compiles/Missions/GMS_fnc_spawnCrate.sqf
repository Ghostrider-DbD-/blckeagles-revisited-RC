/*
	spawn a crate at a specific location and protect it against cleanup by Epoch
	returns the object (crate) that was created.
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last updated 9-4-16
*/

private ["_crate","_px","_py","_defaultCrate"];
_defaultCrate = "Box_NATO_Wps_F";
params["_coords",["_crateType",_defaultCrate]];

_px = _coords select 0;
_py = _coords select 1;

_crate = objNull;
_crate = createVehicle [_crateType,_coords,[], 0, "CAN_COLLIDE"];
_crate setVariable ["LAST_CHECK", 100000];
_crate setPosATL [_px, _py, 0.5];
_crate allowDamage false;
_crate enableRopeAttach true;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearItemCargoGlobal _crate;
_crate;
