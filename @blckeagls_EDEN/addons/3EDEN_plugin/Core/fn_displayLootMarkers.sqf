
params["_state"];
all3DENEntities params ["_objects"];
_objects = _objects select {_x getVariable ["lootVehicle",false]};
diag_log format["displayLootMarkers: _state = %2 | _objects = %1",_objects,_state];
missionNamespace setVariable["blck_displayLootMarkerOn",_state];
{
	if (_state) then // if the request was to show the markers then .... 
	{
		if (_x getVariable["marker",""] isEqualto "") then 
		{
			[_x] call blck3DEN_fnc_createLootMarker;
			[_x] call blck3DEN_fnc_setEventHandlers;
		};
	} else {
		if !(_x getVariable["marker",""] isEqualTo "") then 
		{
			[_x] call blck3DEN_fnc_removeMarker;
		};
	};

} forEach _objects;