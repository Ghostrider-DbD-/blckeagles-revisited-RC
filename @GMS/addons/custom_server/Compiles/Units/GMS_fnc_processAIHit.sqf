/*
	By Ghostrider [GRG]

	Handles the case where a unit is hit.

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
if !(isServer) exitWith {};
private ["_unit","_instigator","_group","_wp"];
(_this select 0) params["_unit","_causedBy","_damage","_instigator"];

if !(isPlayer _instigator) exitWith 
{
	_unit setDamage ( (damage _unit) - _damage);
};

if (!(alive _unit)) exitWith {
	[_unit, _instigator] call blck_fnc_processAIKill;
};

if (damage _unit > 0.95) exitWith {
	_unit setDamage 1.2; [_unit, _instigator] call blck_fnc_processAIKill;
};



[_unit,_instigator,50] call GMS_fnc_alertNearbyGroups;
[_instigator] call blck_fnc_alertNearbyVehicles;
_group = group _unit;
_wp = [_group, currentWaypoint _group];
_wp setWaypointBehaviour "COMBAT";
_group setCombatMode "RED";
_wp setWaypointCombatMode "RED";

if (_unit getVariable ["hasHealed",false]) exitWith {};

if ((damage _unit) > 0.5 ) then
{
	_unit setVariable["hasHealed",true,true];
	if (blck_useSmokeWhenHealing) then 
	{
		"SmokeShellRed" createVehicle (position _unit getPos[1,random(359)]);
	};
	_unit addItem "FAK";
	_unit action ["HealSoldierSelf",  _unit];
	_unit setDamage 0;
	if ("FAK" in (items _unit)) then {_unit removeItem "FAK"};
};

