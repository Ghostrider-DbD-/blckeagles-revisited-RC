/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
private _objects = get3DENSelected "object";
private "_message";
diag_log format["getGarrisonInfo: _object = %1",format["%1",_object]];
 if (_objects isEqualTo []) then 
 {
	_message = "No Buildings Selected";
} else {
	if (count _objects == 1) then 
	{
		if ((_objects select 0) getVariable["garrisoned",false]) then 
		{
			_message = format["Building %1 IS Garrisoned",typeOf (_objects select 0)];
		} else {
			_message = format["Building %1 is NOT Garrisoned",typeOf (_objects select 0)];
		};
	} else {
		_message = format["Select a single building then try again"];			
	};
};
 systemChat _message;
 diag_log _message;
 [_message,"Status"] call BIS_fnc_3DENShowMessage;

