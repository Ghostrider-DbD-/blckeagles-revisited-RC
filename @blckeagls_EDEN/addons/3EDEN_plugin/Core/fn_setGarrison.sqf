

params["_state"];
private _objects = get3DENSelected "object" select {(typeOf _x) isKindOf "House"};
private "_message";
if (_objects isEqualTo []) exitWith 
{
	_message = "Select one or more buildings to configure";
	systemChat _message;
};

{
	if ([_x] call BIS_fnc_isBuildingEnterable) then 
	{
		_x setVariable["garrisoned",_state];
		_message = format["building of type %1 had garrison state set to %2",typeOf _x,_state];
		systemChat _message;
		diag_log _message;
	} else {
		_message = format["Object type %1 ignored: only enterable buildings can be garrisoned",typeOf _x];
		systemChat _x;
		diag_log _x;
	};

} forEach _objects;
_message = format["Garrison State of %1 buildings updated to %2",count _objects,_state];
systemChat _message;