

all3DENEntities params ["_objects","_groups","_triggers","_systems","_waypoints","_markers","_layers","_comments"];
_units = []; 
{
	{
		if (vehicle _x isEqualTo _x) then {_units pushBack _x};
	} forEach (units _x);
} forEach _groups;
diag_log format["_groups = %1",_groups];
diag_log format["_units = %1",_units];