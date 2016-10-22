/*
blck_monitoredVehicles = [];
blck_liveMissionAI = [];
blck_missionObjects = [];
*/

diag_log "[blckeagls]:-->> starting custom_server monitor ver 1.0 6:40 AM";
for "_i" from 1 to 1000 do
{
	diag_log format["_fnc_monitor running diag_tickTime = %1",diag_tickTime];
	uiSleep 20;
	diag_log format["_fnc_monitor:-->> server time = %1",diag_tickTime];
	diag_log format["_fnc_monitor:-->> blck_liveMissionAI = %1",blck_liveMissionAI];
	diag_log format["_fnc_monitor:-->> blck_missionObjects = %1",blck_missionObjects];
	diag_log format["_fnc_monitor:-->> blck_monitoredVehicles = %1",blck_monitoredVehicles];
	
	// clean up alive AI when it is time.
	{
		if ( (diag_tickTime - (_x select 1) > blck_AliveAICleanUpTime) ) then
		{
			diag_log format ["cleaning up Alive AI %1",_x];
			blck_liveMissionAI = blck_liveMissionAI - _x;
			[_x select 0] call blck_fnc_cleanupAliveAI;
		};
	}forEach blck_liveMissionAI;	
	
	// clean up mission objects when it is time.
	{
		if ( (diag_tickTime - (_x select 1) > blck_cleanupCompositionTimer) ) then
		{
			diag_log format ["cleaning up Alive AI %1",_x];
			[_x select 0] call blck_fnc_cleanupObjects;
			blck_missionObjects = blck_missionObjects - [_x];
		};
	}forEach blck_missionObjects;	
	
	// If there are crew and the crew is alive and the vehicle is not severely damaged that wait.
	//if 
	{ 
		if ({alive  _x} count crew _veh == 0 || (damage _x) > 0.9) then {[_x] spawn blck_fnc_vehicleMonitor;};
	}forEach blck_monitoredVehicles;	
};
/*
[] spawn {
	while {true} do
	{
		

		/*
		// clean up alive AI when it is time.
		{
			if ( (diag_tickTime - (_x select 1) > blck_AliveAICleanUpTime) ) then
			{
				[_x select 0] call blck_fnc_cleanupAliveAI;
			};
		}forEach blck_liveMissionAI
		
		// clean up alive AI when it is time.
		{
			if ( (diag_tickTime - (_x select 1) > blck_cleanupCompositionTimer) ) then
			{
				[_x select 0] call blck_fnc_cleanupObjects;
			};
		}forEach blck_missionObjects;
		
		{
			
		// If there are crew and the crew is alive and the vehicle is not severely damaged that wait.
		//if 
		{ 
			if ({alive  _x} count crew _veh == 0 || (damage _x) > 0.9) then {[_x] spawn blck_fnc_vehicleMonitor;};
		}forEach blck_monitoredVehicles;
		
	};
};
*/