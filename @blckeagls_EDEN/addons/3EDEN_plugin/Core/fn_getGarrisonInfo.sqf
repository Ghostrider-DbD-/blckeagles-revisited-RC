
private _object = get3DENSelected "object" select {((typeOf _x) isKindOf "House") && [_x] call BIS_fnc_isBuildingEnterable};
private "_message";
 switch (count _objecct) do 
 {
	 case 0: {_message = "No Enterable Buildings selected"};
	 case 1: {
		 if (_object getVariable["garrisoned",false]) then 
		 {
		 	_message = format["Building %1 IS Garrisoned",typeOf _object];
		} else {
			_message = format["Building %1 is NOT Garrisoned",typeOf _object];
		};
	 };
	 default {_message = "Select a single building then try again"};
 };
 [_message,"Status"] call BIS_fnc_3DENShowMessage;
 systemChat _message;
 diag_log _message;