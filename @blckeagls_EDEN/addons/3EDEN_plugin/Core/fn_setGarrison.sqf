

params["_state"];
private _objects = get3DENSelected "object" select {(typeOf _x) isKindOf "House"};
if (_objects isEqualTo []) exitWith 
{
	_m = "Select one or more buildings to configure";
	systemChat _m;
};

{
	if ([_x] call BIS_fnc_isBuildingEnterable) then 
	{
		_x setVariable["garrisoned",_state];
		_m = format["building of type %1 had garrison state set to %2",typeOf _x,_state];
		systemChat _m;
		diag_log _m;
	} else {
		_m = format["Object type %1 ignored: only enterable buildings can be garrisoned",typeOf _x];
		systemChat _x;
		diag_log _x;
	};

} forEach _objects;
_m = format["Garrison State of %1 buildings updated to %2",count _objects,_state];
systemChat _m;