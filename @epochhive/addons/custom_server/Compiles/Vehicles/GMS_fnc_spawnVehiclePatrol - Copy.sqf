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
private["_vehType","_safepos","_spawnedVehicle"];
params["_pos",["_vehType","I_G_Offroad_01_armed_F"],["_minDis",30],["_maxDis",45],["_groupForVehiclePatrol",grpNull] ];
//_pos = _this select 0; // Center of the mission area
//_vehType = [_this,1,"I_G_Offroad_01_armed_F"] call BIS_fnc_param; 
//_minDis = [_this,2,30] call BIS_fnc_param;  // minimum distance from the center of the mission for vehicle waypoints
//_maxDis = [_this,3,45] call BIS_fnc_param;  // maximum distance from the center of the mission for vehicle waypoints
//_groupForVehiclePatrol = [_this,4,grpNull] call BIS_fnc_param;  // The group with which to man the vehicle

//diag_log format["spawnVehiclePatrol:: _pos %1 _vehTypes %2",_pos,_vehType];
//diag_log format["spawnVehiclePatrol:: _minDis %1  _maxDis %2  _groupForVehiclePatrol %3",_minDis,_maxDis,_groupForVehiclePatrol];

if (isNull _groupForVehiclePatrol) exitWith {};
 
 _safepos = [_pos,0,25,0,0,20,0] call BIS_fnc_findSafePos;	
_spawnedVehicle = [_vehType,_safepos] call blck_fnc_spawnVehicle;
//diag_log format["spawnVehiclePatrols:: vehicle spawned is %1 of typeof %2",_spawnedVehicle, typeOf _spawnedVehicle];
_spawnedVehicle addEventHandler ["GetIn",{  // forces player to be ejected if he/she tries to enter the vehicle
	private ["_theUnit"];
	_theUnit = _this select 2;
	_theUnit action ["Eject", vehicle _theUnit];
}];
clearWeaponCargoGlobal    _spawnedVehicle;
clearMagazineCargoGlobal  _spawnedVehicle;
clearBackpackCargoGlobal  _spawnedVehicle;
clearItemCargoGlobal       _spawnedVehicle;

private["_unitNumber"];
_unitNumber = 0;

{
		switch (_unitNumber) do
		{
			case 0: {_x moveingunner _spawnedVehicle;};
			case 1: {_x moveindriver _spawnedVehicle;};
			default {_x moveInCargo _spawnedVehicle;};
		};
		_unitNumber = _unitNumber + 1;
}forEach (units _groupForVehiclePatrol);

//diag_log format["spawnVehiclePatrols:: vehicle spawned was %1",_spawnedVehicle];

_spawnedVehicle