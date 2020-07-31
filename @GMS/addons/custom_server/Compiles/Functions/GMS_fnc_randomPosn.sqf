//////////////////////////////////////////////
//  returns a position array at random position within a radius of _range relative to _pos.
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
////////////////////////////////////////////

private["_newX","_newY"];
params["_pos","_range"];

_newX = ((_pos select 0) + (random(_range)) * (selectRandom [1,-1]));
_newY = ((_pos select 1) + (random(_range)) * (selectRandom [1,-1]));

[_newX,_newY,0]

