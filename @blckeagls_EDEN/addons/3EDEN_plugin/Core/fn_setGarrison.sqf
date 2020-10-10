/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_state"];
private _markersStateON = missionNamespace getVariable["blck_displayGarrisonMarkerOn",false];
[false] call blck3DEN_fnc_displayGarrisonMarkers;
private _objects = get3DENSelected "object" select {(typeOf _x) isKindOf "House"};
private "_message";
if (_objects isEqualTo []) exitWith 
{
	_message = "Select one or more buildings to configure";
	systemChat _message;
	diag_log _message;
	[_message,"Status"] call BIS_fnc_3DENShowMessage;
};

{
	if ([_x] call BIS_fnc_isBuildingEnterable) then 
	{
		_x setVariable["garrisoned",_state];
		_message = format["building of type %1 had garrison state set to %2",typeOf _x,_state];
		systemChat _message;
		diag_log _message;
		if (blck_displayGarrisonMarkerOn) then 
		{
			[_x] call blck3DEN_fnc_createGarrisonedMarker;
			[_x] call blck3DEN_fnc_setEventHandlers;
		};
	} else {
		_message = format["Object type %1 ignored: only enterable buildings can be garrisoned",typeOf _x];
		systemChat _message;
		diag_log _message;
		[_message,"Status"] call BIS_fnc_3DENShowMessage;
	};

} forEach _objects;
_message = format["Garrison State of %1 buildings updated to %2",count _objects,_state];
systemChat _message;
if (_markersStateON) then 
{
	[true] call blck3DEN_fnc_displayGarrisonMarkers;
};
[_message,"Status"] call BIS_fnc_3DENShowMessage;
