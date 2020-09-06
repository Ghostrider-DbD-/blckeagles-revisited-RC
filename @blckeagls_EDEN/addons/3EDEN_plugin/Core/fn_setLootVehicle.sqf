params["_state"];
private "_message";
private _objects = get3DENSelected "object" select {(typeOf _x) isKindOf "Car"};
if (_objects isEqualTo []) exitWith 
{
	_message = "Select one or more vehicles to configure";
	systemChat _message;
};
{
	if ((typeOf _x) isKindOf "Car") then 
	{
		_x setVariable["lootvehicle",_state];
		_message = format["Vehicle type %1 set to Loot Vehilce = %1",typeOf _x,_state];
		systemChat _message;
		diag_log _message;
	} else {
		_message = format["Object with type %1 ignored:: only objects of type Car can be used as loot vehicles",typeOf _x];
		diag_log _message;
		systemChat _message;
	};
} forEach _objects;
_message = format["Loot Vehicle State of %1 vehicles updated to %2",count _objects,_state];
systemChat _m;