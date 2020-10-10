/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
params["_object"];
if !(_object getvariable["marker",""] isEqualTo "") then 
{
	[_object] call blck3DEN_fnc_removeMarker;
	_object setVariable ["marker",nil];
};
