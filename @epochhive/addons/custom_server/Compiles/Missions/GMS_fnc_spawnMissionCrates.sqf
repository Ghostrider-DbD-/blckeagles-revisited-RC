/*
	Spawn some crates using an array containing crate types and their offsets relative to a reference position and prevent their cleanup.
	By Ghostrider-DBD-
	Copyright 2016
	Last updated 8-14-16
*/

private ["_objs","_pos","_offset"];
params[ ["_coords", [0,0,0]], ["_crates",[]] ];

_objs = [];
{
	_x params["_crateType","_crateOffset","_lootArray","_lootCounts"];
	//_offset = _x select 1; // offset relative to _coords at which to spawn the vehicle
	if ((count _coords) == 3) then // assume that there is a Z offset provided
	{
		_pos = [(_coords select 0)+(_crateOffset select 0),(_coords select 1) + (_crateOffset select 1),(_coords select 2)+(_crateOffset select 2)]; // calculate the world coordinates
	}
	else
	{ 
		if ((count _coords) == 2) then // assume only X and Y offsets are provided
		{
			_pos = [(_coords select 0)+(_crateOffset select 0),(_coords select 1) + (_crateOffset select 1),0]; // calculate the world coordinates
		};
	};

	_crate = [_pos,_crateType] call blck_fnc_spawnCrate;
	_objs pushback _crate;
	[_crate,_lootArray,_lootCounts] call blck_fnc_fillBoxes;
}forEach _crates;

_objs
