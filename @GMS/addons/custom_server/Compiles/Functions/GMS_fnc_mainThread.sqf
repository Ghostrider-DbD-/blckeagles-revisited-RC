/*
	By Ghostrider-DbD-
	Last modified 8-15-17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

diag_log format["starting _fnc_mainThread with time = %1",diag_tickTime];

#ifdef DBDserver
diag_log "running DBDServer version of _fnc_mainThread";
#endif

private["_modType","_timer1sec","_timer5sec","_timer20sec","_timer5min","_timer5min"];
_timer1sec = diag_tickTime;
_timer5sec = diag_tickTime;
_timer20sec = diag_tickTime;
_timer1min = diag_tickTime;
_timer5min = diag_tickTime;
_modType = [] call blck_fnc_getModType;
while {true} do
{
	uiSleep 1;
	//diag_log format["mainThread:: -- > time = %1",diag_tickTime];
	if (diag_tickTime - _timer1sec > 1) then 
	{
		[] call blck_fnc_vehicleMonitor;
		#ifdef DBDserver
		[] call blck_fnc_broadcastServerFPS;
		#endif
		_timer1sec = diag_tickTime;
	};
	if (diag_tickTime - _timer5sec > 5) then
	{
		_timer5sec = diag_tickTime;
		[] call blck_fnc_missionGroupMonitor;
		//[] call blck_fnc_sm_checkForPlayerNearMission;
	};
	if (diag_tickTime - _timer20sec > 20) then
	{
		[] call blck_fnc_cleanupAliveAI;
		[] call blck_fnc_cleanupObjects;
		[] call blck_fnc_cleanupDeadAI;
		_timer20sec = diag_tickTime;
		//diag_log format["_mainThread::-->> diag_tickTime = %1",diag_tickTime];
	};
	if ((diag_tickTime - _timer1min) > 60) then
	{
		_timer1min = diag_tickTime;
		[] call blck_fnc_timeAcceleration;
		[] call blck_fnc_spawnPendingMissions;
	};
		if !(blck_useHC) then
		{
			diag_log format["_mainThread:: calling blck_fnc_passToHCs at diag_tickTime = %1",diag_tickTime];
			[] call blck_fnc_passToHCs;
		};
		//[] call blck_fnc_missionGroupMonitor;
		/*
		// No longer needed 
		if (_modType isEqualTo "Epoch") then 
		{
			[] call blck_fnc_cleanEmptyGroups;
		};  // Exile cleans up empty groups automatically so this should not be needed with that mod.		
		*/
	};	
	if (blck_useTimeAcceleration) then
	{
		if (diag_tickTime - _timer5min > 300) then {

			_timer5min = diag_tickTime;
		};
	};
};
