/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
params["_state"];
all3DENEntities params ["_objects"];
_objects = _objects select {_x getVariable["garrisoned",false]};

missionNameSpace setVariable["blck_displayGarrisonMarkerOn",_state];
{
	if (_state) then // if the request was to show the markers then .... 
	{
		private _marker = _x getVariable["marker",""];
		diag_log format["_x = %1 | _marker = %2",_x,_marker];
		if (_marker  isEqualto "") then 
		{
			[_x] call blck3DEN_fnc_createGarrisonMarker;
			[_x] call blck3DEN_fnc_setEventHandlers;					
		};
	} else {
		blck_displayGarrisonMarkerOn = false;
		if !(_x getVariable["marker",""] isEqualTo "") then 
		{
			[_x] call blck3DEN_fnc_removeMarker;
		};
	};

} forEach _objects;
