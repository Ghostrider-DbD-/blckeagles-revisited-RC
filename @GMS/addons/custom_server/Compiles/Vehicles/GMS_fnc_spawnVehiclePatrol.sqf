/*
	By Ghostrider [GRG]
	Copyright 2016
	
	spawns a vehicle of _vehType and mans it with units in _group.
	returns _veh, the vehicle spawned.
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_center","_pos",["_vehType","I_G_Offroad_01_armed_F"],["_minDis",40],["_maxDis",60],["_group",grpNull],["_setWaypoints",true],["_crewCount",4],["_patrolRadius",150],["_waypointTimeout",[5,7.5,10]]];

if (_group isEqualTo grpNull) exitWith 
 {
	diag_log format["_fnc_spawnVehiclePatrol(30): <ERROR> Function can not accept a null group"];
};

private _veh = objNull;


_veh = [_vehType,_pos] call blck_fnc_spawnVehicle;

_veh setVariable["blck_vehicleSearchRadius",blck_playerDetectionRangeGroundVehicle];
_veh setVariable["blck_vehiclePlayerDetectionOdds",blck_vehiclePlayerDetectionOdds];
private _maxCrew = [_crewCount] call blck_fnc_getNumberFromRange;
[_veh,_group,_maxCrew] call blck_fnc_loadVehicleCrew;

[_veh,2] call blck_fnc_configureMissionVehicle;
if (_setWaypoints) then
{
	[_center,_minDis,_maxDis,_group,"perimeter","SAD","vehicle",_patrolRadius,_waypointTimeout] spawn blck_fnc_setupWaypoints;
};

_veh


