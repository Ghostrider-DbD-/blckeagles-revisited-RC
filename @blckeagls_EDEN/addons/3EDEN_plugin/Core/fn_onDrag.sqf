/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
params["_object"];
if !(_object getVariable["marker",""] isEqualTo "") then 
{
	private _marker = _object getVariable["marker",""];
	private _markerPos = getPosATL _object;
	_marker setPosATL[_markerPos select 0, _markerPos select 1, (_markerPos select 2) + sizeOf _object];
};