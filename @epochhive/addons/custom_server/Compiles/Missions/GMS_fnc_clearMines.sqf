// removes mines in a region centered around a specific position.
/*
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last Modified 8-13-16
*/ 
params ["_mines"];
//_mines = _this select 0;  // array containing the mines to be deleted
//diag_log format["deleting %1 mines----- >>>> ", count _mines];
{
	deleteVehicle _x;
} forEach _mines;

