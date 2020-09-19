/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
	sets a flag stored through setVariable for each selected object that meets the filter criteria 
	only objects of type "Car"or "ThingX" are allowed.
*/

params["_state"];
private _markerStateON = missionNameSpace getVariable["blck_displayLootMarkerOn",false];
[false] call blck3DEN_fnc_displayLootMarkers;
private "_message";
private _objects = get3DENSelected "object" select {(typeOf _x) isKindOf "Car" || (typeOf _x) isKindOf "Ship"};  // 
if (_objects isEqualTo []) exitWith 
{
	_message = "Select one or more vehicles or items of type ThingX to configure";
	systemChat _message;
};
{
	if ((typeOf _x) isKindOf "Car" || (typeOf _x) isKindOf "Ship") then 
	{
		_x setVariable["lootvehicle",_state];
		if (blck_displayLootMarkerOn && _state) then 
		{
			[_x] call blck3DEN_fnc_createLootMarker;
			[_x] call blck3DEN_fnc_setEventHandlers;
		} else {
			if !(_state) then 
			{
				[_x] call blck3DEN_fnc_removeLootMarker;
			};
		};
		_message = format["Vehicle type %1 set to Loot Vehicle = %1",typeOf _x,_state];
		systemChat _message;
		diag_log _message;
	} else {
		_message = format["Object with type %1 ignored:: only objects of type Car can be used as loot vehicles",typeOf _x];
		diag_log _message;
		systemChat _message;
	};
} forEach _objects;

if (_markerStateON) then 
{
	[true] call blck3DEN_fnc_displayLootMarkers;
};
_message = format["Loot Vehicle State of %1 objects updated to %2",count _objects,_state];
systemChat _m;