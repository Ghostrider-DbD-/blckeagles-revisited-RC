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
		
		// time to reset timers and spawn something.
		private _wt = diag_tickTime + _tmin + (random(_tMax - _tMin));
		#define waitTime 5
		#define noActive 2
		_x set[waitTime, _wt];  // _x here is the _missionCategoryDescriptors being evaluated
		_x set[noActive, _noActiveMissions + 1];
		private _missionInitialized = [_x,selectRandom _missionsData] call blck_fnc_initializeMission;
	};
} forEach blck_missionData;
