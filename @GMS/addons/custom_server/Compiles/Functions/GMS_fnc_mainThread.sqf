/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_timer1sec","_timer5sec","_timer10Sec","_timer20sec","_timer5min","_timer5min"];
_timer2sec = diag_tickTime + 2;
_timer5sec = diag_tickTime + 5;
_timer10Sec = diag_tickTime + 10;
_timer20sec = diag_tickTime + 20;
_timer1min = diag_tickTime + 10;
_timer5min = diag_tickTime + 300;

while {true} do
{
	uiSleep 1;
	
	if (diag_tickTime > _timer2sec) then 
	{		
		//if !(blck_initializationInProgress) then 

			[] spawn blck_fnc_monitorInitializedMissions;	

		if (blck_showCountAliveAI) then
		{
			{
				_x call blck_fnc_updateMarkerAliveCount;
			} forEach blck_missionLabelMarkers;
		};
		_timer2sec = diag_tickTime + 2;
	};
	
	if (diag_tickTime > _timer5sec) then
	{
		_timer5sec = diag_tickTime + 5;
		if (blck_simulationManager isEqualTo blck_useBlckeaglsSimulationManagement) then {[] call blck_fnc_simulationManager};
		[] call blck_fnc_sm_staticPatrolMonitor;
		[] call blck_fnc_vehicleMonitor;		
		#ifdef GRGserver
		[] call blck_fnc_broadcastServerFPS;
		#endif		
	};
	if (diag_tickTime > _timer10Sec) then 
	{
		[] call blck_fnc_spawnPendingMissions; 	
		_timer10Sec = diag_tickTime;
		[] call blck_fnc_scanForPlayersNearVehicles;
		[] call GMS_fnc_cleanupTemporaryMarkers;
		[] call GMS_fnc_updateCrateSignals;				
		_timer20sec = diag_tickTime + 20;
	};
	
	if ((diag_tickTime > _timer1min)) then
	{
		_timer1min = diag_tickTime + 10;
		[] call blck_fnc_restoreHiddenObjects;
		[] call blck_fnc_groupWaypointMonitor;
		[] call blck_fnc_cleanupAliveAI;
		[] call blck_fnc_cleanupObjects;
		[] call blck_fnc_cleanupDeadAI;			 
		if (blck_useHC) then {[] call blck_fnc_HC_passToHCs};
		if (blck_useTimeAcceleration) then {[] call blck_fnc_timeAcceleration};
		if (blck_ai_offload_to_client) then {[] call blck_fnc_ai_offloadToClients};
	};
	if (diag_tickTime > _timer5min) then 
	{
		_activeScripts = diag_activeScripts;

		[
			format["Timstamp %8 |Dynamic Missions Running %1 | Vehicles %2 | Groups %3 | Missions Run %4 | Server FPS %5 | Server Uptime %6 Min",
				blck_missionsRunning,
				count blck_monitoredVehicles,
				count blck_monitoredMissionAIGroups,
				blck_missionsRun,
				diag_FPS,floor(diag_tickTime/60),
				diag_tickTime
			]
		] call blck_fnc_log;
		[
			format["count diag_activeSQFScripts %1 | Threads [spawned %2, execVM %3] | monitorThreads %4",
				count diag_activeSQFScripts,
				_activeScripts select 0,
				_activeScripts select 1,
				blck_activeMonitorThreads	
			]
		] call blck_fnc_log;
		{
			[format["file %1 | running %2",(_x select 1),(_x select 2)]] call blck_fnc_log;
		} forEach diag_activeSQFScripts;
		[] call blck_fnc_cleanEmptyGroups;			
		_timer5min = diag_tickTime + 300;
	};
};
