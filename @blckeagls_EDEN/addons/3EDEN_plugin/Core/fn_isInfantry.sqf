
/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

	private _u = _this select 0;
	private _isInfantry = if ((_u isKindOf "Man") && (vehicle _u) isEqualTo _u) then {true} else {false};
	_isInfantry