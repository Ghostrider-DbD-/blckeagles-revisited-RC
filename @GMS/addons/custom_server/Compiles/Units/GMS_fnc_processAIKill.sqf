/*
	Handle AI Deaths
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

// assumptions: this is always and only run on the server regardless if th event is triggered on an HC or other client.
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_unit","_killer","_instigator"];

if (local _unit) then 
{
	if !((vehicle _unit) isKindOf "Man") then 
	{
		_unit action["Eject", vehicle _unit];
		[vehicle _unit] call blck_fnc_checkForEmptyVehicle;
	};
};

if !(isServer) exitWith {};
if (_unit getVariable["blck_cleanupAt",-1] > 0) exitWith {};  // this is here so that the script is not accidently run more than once for each MPKilled occurrence.
_unit setVariable ["blck_cleanupAt", (diag_tickTime) + blck_bodyCleanUpTimer];
_unit disableAI "ALL";

{
	_unit removeAllMPEventHandlers _x;
}forEach["MPHit","MPKilled"];
{
	_unit removeAllEventHandlers _x;
}forEach["FiredNear","Reloaded"];
[_unit] joinSilent blck_graveyardGroup;

if (count(units (group _unit)) isEqualTo 0) then 
{
	deleteGroup _group;
};

if !((vehicle _unit) isKindOf "Man") then 
{
	[_unit, ["Eject", vehicle _unit]] remoteExec ["action",(owner _unit)];
};

if (blck_launcherCleanup) then {[_unit] call blck_fnc_removeLaunchers};
if (blck_removeNVG) then {[_unit] call blck_fnc_removeNVG};
if !(isPlayer _killer) exitWith {};
[_unit,_killer,50] call GMS_fnc_alertNearbyGroups;
[_killer] call blck_fnc_alertNearbyVehicles;
private _wp = [group _unit, currentWaypoint (group _unit)];
_wp setWaypointBehaviour "COMBAT";
(group _unit) setCombatMode "RED";
_wp setWaypointCombatMode "RED";

if ([_unit,_killer] call blck_fnc_processIlleagalAIKills) then {
	[_unit,_killer] call blck_fnc_handlePlayerUpdates;
};
