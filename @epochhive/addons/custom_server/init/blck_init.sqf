/*
AI Mission for Epoch and Exile Mods to Arma 3
Originally Compiled by blckeagls @ Zombieville.net
Code was modified by Narines fixing several bugs.
Modified by Ghostrider with thanks to ctbcrwker for input, testing, and troubleshooting.
Credits to Vampire, Narines, KiloSwiss, blckeagls, theFUCHS, lazylink, Mark311 who wrote mission systems upon which this one is based and who's code is used with modification in some parts of this addon.

Thanks to cyncrwler for testing and bug fixes.
*/
private ["_version","_versionDate"];
_blck_version = "6.2 Build 8";
_blck_versionDate = "10-22-16  7:00 PM";

private["_blck_loadingStartTime"];
_blck_loadingStartTime = diag_tickTime;

call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\blck_variables.sqf";
waitUntil {(isNil "blck_variablesLoaded") isEqualTo false;};
waitUntil{blck_variablesLoaded};
blck_variablesLoaded = nil;
//sleep 1;

// compile functions
call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\blck_functions.sqf";
waitUntil {(isNil "blck_functionsCompiled") isEqualTo false;};
waitUntil{blck_functionsCompiled};
blck_functionsCompiled = nil;

call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\MapAddons\MapAddons_init.sqf";

private["_modType"];
_modType = [] call blck_getModType;

if (_modType isEqualTo "Epoch") then
{
	diag_log format["[blckeagls] Loading Mission System using Parameters for %1",_modType];
	call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Configs\blck_configs_epoch.sqf";
	waitUntil {(isNil "blck_configsLoaded") isEqualTo false;};
	waitUntil{blck_configsLoaded};
	blck_configsLoaded = nil;
};
if (_modType isEqualTo "Exile") then
{
	diag_log format["[blckeagls] Loading Mission System using Parameters for %1",_modType];
	call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Configs\blck_configs_exile.sqf";
	waitUntil {(isNil "blck_configsLoaded") isEqualTo false;};
	waitUntil{blck_configsLoaded};
	blck_configsLoaded = nil;
};

diag_log "[blckeagls] Loading Map-specific information";
execVM "\q\addons\custom_server\Compiles\Functions\GMS_fnc_findWorld.sqf";
waitUntil {(isNil "blck_worldSet") isEqualTo false;};
waitUntil{blck_worldSet};
blck_worldSet = nil;

// set up the lists of available missions for each mission category
diag_log "[blckeagls] Loading Mission Lists";
#include "\q\addons\custom_server\Missions\GMS_missionLists.sqf";

diag_log format["[blckeagls] version %1 Build %2 for mod = %3 Loaded in %4 seconds",_blck_versionDate,_blck_version,_modType,diag_tickTime - _blck_loadingStartTime]; //,blck_modType];
diag_log format["blckeagls] waiting for players to join ----    >>>>"];
waitUntil{{isPlayer _x}count playableUnits > 0};
diag_log "[blckeagls] Player Connected, loading mission system";

// Load any user-defined specifications or overrides
_scriptDone = execVM "\q\addons\custom_server\Configs\blck_custom_config.sqf";
waitUntil{scriptDone _scriptDone};
//Start the mission timers

if (blck_enableOrangeMissions == 1) then
{
	[_missionListOrange,_pathOrange,"OrangeMarker","orange",blck_TMin_Orange,blck_TMax_Orange] spawn blck_fnc_missionTimer;//Starts major mission system (Orange Map Markers)
};
if (blck_enableGreenMissions == 1) then
{
	[_missionListGreen,_pathGreen,"GreenMarker","green",blck_TMin_Green,blck_TMax_Green] spawn blck_fnc_missionTimer;//Starts major mission system 2 (Green Map Markers)
};
if (blck_enableRedMissions == 1) then
{
	[_missionListRed,_pathRed,"RedMarker","red",blck_TMin_Red,blck_TMax_Red] spawn blck_fnc_missionTimer;//Starts minor mission system (Red Map Markers)//Starts minor mission system 2 (Red Map Markers)
};
if (blck_enableBlueMissions == 1) then
{
	[_missionListBlue,_pathBlue,"BlueMarker","blue",blck_TMin_Blue,blck_TMax_Blue] spawn blck_fnc_missionTimer;//Starts minor mission system (Blue Map Markers)
};

[] execVM "\q\addons\custom_server\init\broadcastServerFPS.sqf";
//[] execVM "\x\addons\custom_server\Compiles\passToHCs.sqf";

[] execVM "\q\addons\custom_server\TimeAccel\time.sqf";

diag_log "[blckeagls] >>--- Completed initialization"; 

blck_Initialized = true;
publicVariable "blck_Initialized";

//diag_log format["[blckeagls] Mission system settings:blck_debugON = %4 blck_useSmokeAtCrates = %1 blck_useMines = %2 blck_useStatic = %3 blck_useVehiclePatrols %4",blck_useSmokeAtCrates,blck_useMines,blck_useStatic,blck_debugON,blck_useVehiclePatrols];
//diag_log format["[blckeagls] AI Settings: blck_useNVG = %1  blck_useLaunchers = %2",blck_useNVG,blck_useLaunchers];
//diag_log format["[blckeagls] AI Runover and other Vehicle Kill settings: blck_RunGear = %1 blck_VG_Gear =%2 blck_VK_RunoverDamage = %3 blck_VK_GunnerDamage = %4",blck_RunGear,blck_VG_Gear,blck_VK_RunoverDamage,blck_VK_GunnerDamage];
//[] execVM "\q\addons\custom_server\Compiles\Functions\GMS_fnc_monitor.sqf";
