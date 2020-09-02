/*
	AI Mission for Epoch Mod for Arma 3
	By Ghostrider
	Functions and global variables used by the mission system.
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private _functions = [
	// General functions
	["blck_fnc_setNextWaypoint","\q\addons\custom_server\Compiles\Groups\GMS_fnc_setNextWaypoint.sqf"],
	["blck_fnc_handleVehicleGetOut","\q\addons\custom_server\Compiles\Vehicles\GMS_fnc_handleVehicleGetOut.sqf"],
	["blck_EH_AIKilled","\q\addons\custom_server\Compiles\Units\GMS_EH_AIKilled.sqf"], 					// Event handler to process AI deaths	
	["blck_EH_unitWeaponReloaded","\q\addons\custom_server\Compiles\Units\GMS_EH_unitWeaponReloaded.sqf"],
	["blck_EH_AIfiredNear","\q\addons\custom_server\Compiles\Units\GMS_EH_AIfiredNear.sqf"],
	["blck_fnc_processAIfiredNear","\q\addons\custom_server\Compiles\Units\GMS_fnc_processAIFiredNear.sqf"],
	["blck_fnc_processAIKill","\q\addons\custom_server\Compiles\Units\GMS_fnc_processAIKill.sqf"]
];

{
	if !(_x isEqualto []) then 
	{
		_x params ["_name","_path"];
		missionnamespace setvariable [_name,compileFinal  preprocessFileLineNumbers _path];
	};
} foreach  _functions;

diag_log format["[blckeagles] Functions for Headless Clients compiled"];


