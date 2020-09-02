/*
	_fnc_handleAIVehicleHit
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_veh","_instigator","_group","_wp"];

_veh = _this select 0;
_instigator = _this select 3;
if (!(isPlayer _instigator)) exitWith {};
_crew = crew _veh;
_group = group (_crew select 0);
[_crew select 0,_instigator,50] call GMS_fnc_alertNearbyGroups;
[_instigator] call blck_fnc_alertNearbyVehicles;
_group setBehaviour "COMBAT";
_wp = [_group, currentWaypoint _group];
_wp setWaypointBehaviour "COMBAT";
_group setCombatMode "RED";
_wp setWaypointCombatMode "RED";


