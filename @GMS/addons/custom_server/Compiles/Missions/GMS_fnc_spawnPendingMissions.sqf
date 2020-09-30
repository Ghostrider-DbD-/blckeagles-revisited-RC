/*
	By Ghostrider [GRG]
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

if (blck_missionsRunning >= blck_maxSpawnedMissions) exitWith {};

{	
	private _missionCategoryDescriptors = _x;	
	_missionCategoryDescriptors params["_difficulty","_maxNoMissions","_noActiveMissions","_tMin","_tMax","_waitTime","_missionsData"];

	if (_noActiveMissions < _maxNoMissions && diag_tickTime > _waitTime && blck_missionsRunning < blck_maxSpawnedMissions) then 
	{
		blck_dynamicMissionsSpawned = blck_dynamicMissionsSpawned + 1;
		// time to reset timers and spawn something.
		private _wt = diag_tickTime + _tmin + (random(_tMax - _tMin));
		private _missionInitialized = [_x,selectRandom _missionsData,blck_dynamicMissionsSpawned] call blck_fnc_initializeMission;
		if (blck_debugLevel >= 3) then 
		{
			if !(_missionInitialized) then 
			{
				[format["fnc_spawnPendingMissions: _missionInitialized = %1",_missionInitialized],"warning"] call blck_fnc_log;
			};
		};
		if (_missionInitialized) then 
		{
			#define waitTime 5
			#define noActive 2
			_x set[waitTime, _wt];  // _x here is the _missionCategoryDescriptors being evaluated
			_x set[noActive, _noActiveMissions + 1];
		};
	};
} forEach blck_missionData;
