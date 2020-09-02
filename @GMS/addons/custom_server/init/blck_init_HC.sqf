/*
	By Ghostrider-GRG-

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
if (hasInterface || isServer) exitWith{};

#include "\q\addons\custom_server\Configs\blck_defines.hpp";

if !(isNil "blck_Initialized") exitWith{};
private _blck_loadingStartTime = diag_tickTime;
#include "\q\addons\custom_server\init\build.sqf";
call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\blck_functions_HC.sqf";
diag_log format["[blckeagls] Loading Headless Client Version %2 |  Build Date %1 | Build %3 | loaded in %4 seconds",blck_buildDate,blck_versionNumber,blck_buildNumber,diag_tickTime - _blck_loadingStartTime];
while {true} do 
{
	uiSleep 60;
	private _localGroups = allGroups select {local _x};
	private _localUnits = 0;
	{
		_localUnits = _localUnits + count(units _x);
	} forEach _localGroups;
	diag_log format["[blckeagls] HC Logging: Groups offloaded = %1 | Units offloaded = %2 | fps = %3 | time = %4 ",_localGroups,_localUnits,diag_FPS,diag_tickTime];
};

