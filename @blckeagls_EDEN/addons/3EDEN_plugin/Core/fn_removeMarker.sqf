/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_object"];

private _marker = _object getVariable["marker",""];
if !(_marker isEqualTo "") then 
{
	private _id = get3DENEntityID _marker;
	delete3DENEntities [_id];
	_object setVariable["marker",nil];
};

true