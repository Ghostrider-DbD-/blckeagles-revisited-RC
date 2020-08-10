
/*
	Returns true if a unit is on foot otherwise returns false.
	By Ghostrider-GRG-
	Copyright 2020 
*/

	private _u = _this select 0;
	private _isInfantry = if ((_u isKindOf "Man") && (vehicle _u) isEqualTo _u) then {true} else {false};
	//diag_log format["_fn_isInfantry: _isInfantry = %1",_isInfantry];
	_isInfantry