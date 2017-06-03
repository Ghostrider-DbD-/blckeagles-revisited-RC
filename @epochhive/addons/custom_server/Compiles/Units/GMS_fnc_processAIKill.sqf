/*
	Handle AI Deaths
	Last Modified 5/31/17
	By Ghostrider-DBD-
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_group","_isLegal","_weapon","_lastkill","_kills","_message","_killstreakMsg"];
params["_unit","_killer","_isLegal"];

_unit setVariable ["blck_cleanupAt", (diag_tickTime) + blck_bodyCleanUpTimer, true];

blck_deadAI pushback _unit;
_group = group _unit;
[_unit] joinSilent grpNull;
if (count(units _group) < 1) then {deleteGroup _group;};
if (blck_launcherCleanup) then {[_unit] spawn blck_fnc_removeLaunchers;};
if (blck_removeNVG) then {[_unit] spawn blck_fnc_removeNVG;};
if !(isPlayer _killer) exitWith {};
//[_unit,_killer] call blck_fnc_alertNearbyUnits;
[_unit,_killer] call blck_fnc_alertNearbyLeader;  //  Should give a more natural, squad-based response to injuries or kills.
_group = group _unit;
_wp = [_group, currentWaypoint _group];
_wp setWaypointBehaviour "COMBAT";
_group setCombatMode "RED";
_wp setWaypointCombatMode "RED";
{
	_unit removeAllEventHandlers  _x;
}forEach ["Killed","Fired","HandleDamage","HandleHeal","FiredNear","Hit"];

_isLegal = [_unit,_killer] call blck_fnc_processIlleagalAIKills;

if !(_isLegal) exitWith {};

_lastkill = _killer getVariable["blck_lastkill",diag_tickTime];
_killer setVariable["blck_lastkill",diag_tickTime];
_kills = (_killer getVariable["blck_kills",0]) + 1;
if ((diag_tickTime - _lastkill) < 240) then
{
	_killer setVariable["blck_kills",_kills];
} else {
	_killer setVariable["blck_kills",0];
};

if (blck_useKillMessages) then
{
	_weapon = currentWeapon _killer;
	_killstreakMsg = format[" %1X KILLSTREAK",_kills];

	if (blck_useKilledAIName) then
	{
		_message = format["[blck] %2: killed by %1 from %3m",name _killer,name _unit,round(_unit distance _killer)];
	}else{
		_message = format["[blck] %1 killed with %2 from %3 meters",name _killer,getText(configFile >> "CfgWeapons" >> _weapon >> "DisplayName"), round(_unit distance _killer)];
	};
	_message =_message + _killstreakMsg;
	//diag_log format["[blck] unit killed message is %1",_message,""];
	[["aikilled",_message,"victory"],playableUnits] call blck_fnc_messageplayers;
};
[_unit,_killer] call blck_fnc_rewardKiller;


