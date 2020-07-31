
/*
	_fnc_alertNearestGroup
*/
/*
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
params["_group"];
private _nearbyGroup = [group _unit] call blck_fnc_findNearestGroup;
{
	_x reveal[_killer,(_x knowsAbout _killer) + random(_unit getVariable ["intelligence",1])];
}forEach (units _nearbyGroup);
