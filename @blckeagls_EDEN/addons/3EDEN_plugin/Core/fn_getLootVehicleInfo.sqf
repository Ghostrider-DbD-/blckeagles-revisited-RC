
/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
private _objects = get3DENSelected "object" select {(typeOf _x) isKindOf "Car" || (typeOf _x) isKindOf "Ship" || (typeOf _x) isKindOf "ThingX"};
private "_message";

 if (_objects isEqualTo []) then 
 {
	_message = "No Cars/Ships/ThingX Selected";
} else {
	if (count _objects == 1) then 
	{
		if ((_objects select 0) getVariable["lootvehicle",false]) then 
		{
			_message = format["Vehicle %1 IS a Loot Vehicle",typeOf (_objects select 0)];
		} else {
			_message = format["Vehicle %1 is NOT a Loot Vehicle",typeOf (_objects select 0)];
		};
	} else {
		_message = format["% Vehicles Selected. Select a single vehicle then try again",count _objects];			
	};
};
 systemChat _message;
 diag_log _message;
[_message,"Status"] call BIS_fnc_3DENShowMessage;


