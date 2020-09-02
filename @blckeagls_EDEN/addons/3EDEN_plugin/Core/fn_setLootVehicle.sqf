params["_state"];
private _objects = get3DENSelected "object" select {(typeOf _x) isKindOf "Car"};
if (_objects isEqualTo []) exitWith 
{
	_m = "Select one or more vehicles to configure";
	systemChat _m;
};
{
	if ((typeOf _x) isKindOf "Car") then 
	{
		_x setVariable["lootvehicle",_state];
		_m = format["Vehicle type %1 set to Loot Vehilce = %1",typeOf _x,_state];
		systemChat _m;
		diag_log _m;
	} else {
		_m = format["Object with type %1 ignored:: only objects of type Car can be used as loot vehicles",typeOf _x];
		diag_log _m;
		systemChat _m;
	};
} forEach _objects;
_m = format["Loot Vehicle State of %1 vehicles updated to %2",count _objects,_state];
systemChat _m;