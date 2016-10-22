//////////////////////////////////////
// spawn a vehicle, fill it with AI, and give it waypoints around the perimeter of the mission area
// Returns an array _units that contains a list of the units that were spawned and placed in the vehicle

/*
	By Ghostrider-DBD-
	Copyright 2016
	Last updated 8-14-16
*/
/*
fn_setWaypoints =
{
	private["_group","_center"];
	_group = _this select 0;  // The group to which waypoints should be assigned
	_center = _this select 1;  // center of the mission area
	
	while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};
	[_center,50,100,_group] call blck_fnc_setupWaypoints;
};
*/
private["_vehType","_safepos","_veh"];
params["_center","_pos",["_vehType","I_G_Offroad_01_armed_F"],["_minDis",30],["_maxDis",45],["_group",grpNull] ];
//_pos  Center of the mission area
//_vehType = [_this,1,"I_G_Offroad_01_armed_F"] call BIS_fnc_param; 
//_minDis = minimum distance from the center of the mission for vehicle waypoints
//_maxDis = maximum distance from the center of the mission for vehicle waypoints
//_groupForVehiclePatrol = The group with which to man the vehicle

//diag_log format["spawnVehiclePatrol:: _pos %1 _vehTypes %2",_pos,_vehType];
//diag_log format["spawnVehiclePatrol:: _minDis %1  _maxDis %2  _groupForVehiclePatrol %3",_minDis,_maxDis,_groupForVehiclePatrol];

if (isNull _group) exitWith {};
 
_safepos = [_pos,0,25,0,0,20,0] call BIS_fnc_findSafePos;	
_veh = [_vehType,_safepos] call blck_fnc_spawnVehicle;

//diag_log format["spawnVehiclePatrols:: vehicle spawned is %1 of typeof %2",_veh, typeOf _veh];

private["_unitNumber"];
_unitNumber = 0;

{
		switch (_unitNumber) do
		{
			case 0: {_x moveingunner _veh;};
			case 1: {_x moveindriver _veh;};
			default {_x moveInCargo _veh;};
		};
		_unitNumber = _unitNumber + 1;
}forEach (units _group);

while {(count (waypoints _group)) > 0} do
{
	deleteWaypoint ((waypoints _group) select 0);
};
//diag_log format["spawnVehiclePatrols:: vehicle spawned was %1",_veh];
_count = 5;
_start = _center getDir _pos;
_angle = _start;
_sign = selectRandom [1, -1];
_arc = _sign * 360/_count;
for "_i" from 1 to _count do
{
	_angle = _angle + _arc;
	_p2 = _center getPos [(_minDis + random(_maxDis - _minDis)),_angle];
	_wp = _group addWaypoint [_p2, 25];
	_wp setWaypointType "MOVE";
	_wp = _group addWaypoint [_p2, 25];
	_wp setWaypointType "LOITER";
	_wp setWaypointTimeout [10,17.5,25];
};
_wp = _group addWaypoint [_pos, 25];
_wp setWaypointType "CYCLE";

_veh