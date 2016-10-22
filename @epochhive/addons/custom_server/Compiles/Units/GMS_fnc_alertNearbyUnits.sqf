/*
	by Ghostrider
	9-20-15
	Because this is p-ecompiled there is less concern about keeping comments in.
*/

private["_alertDist","_intelligence"];
params["_unit","_killer"];

//diag_log format["#-alertNearbyUnits.sqf-# alerting nearby units of killer of unit %1",_unit];
_alertDist = _unit getVariable ["alertDist",300];
_intelligence = _unit getVariable ["intelligence",1];
if (_alertDist > 0) then {
		//diag_log format["+----+ alerting units close to %1",_unit];
		{
			if (((position _x) distance (position _unit)) <= _alertDist) then {
				_x reveal [_killer, _intelligence];
				//diag_log "Killer revealed";
			}
		} forEach allUnits;
};
