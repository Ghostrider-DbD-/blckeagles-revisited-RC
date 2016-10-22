//////////////////////////////////////////////
//  returns a position array at random position within a radius of _range relative to _pos.
/*
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last Modified 8-13-16
*/
////////////////////////////////////////////

private["_newX","_newY"];
params["_pos","_range"];

_signs = [1,-1];
_sign = selectRandom _signs;

_newX = ((_pos select 0) + (random(_range)) * (selectRandom _signs));
_newY = ((_pos select 1) + (random(_range)) * (selectRandom _signs));

[_newX,_newY,0]

