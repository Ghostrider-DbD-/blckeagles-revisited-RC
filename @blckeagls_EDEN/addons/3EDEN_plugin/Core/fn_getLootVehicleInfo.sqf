
private _objects = get3DENSelected "object" select {(typeOf _x) isKindOf "Car"};
private "_message";

switch (count _objects) do 
{
	case 0: {_message = "Select a vehicle and try again"};
	case 1: {
		if ((_objects select 0) getVariable["lootvehicle",false]) then 
		{
			 _message = format["Vehicle %1 IS a loot vehicle",typeOf (_objects select 0)];
		} else {
			_message = format["Vehicle %1 is NOT a loot vehicle",typeOf (_objects select 0)];
		};
	};
	default {_message = "Select a single vehicle and try again"};
};

[_message,"Status"] call BIS_fnc_3DENShowMessage;

 systemChat _message;
 diag_log _message;
