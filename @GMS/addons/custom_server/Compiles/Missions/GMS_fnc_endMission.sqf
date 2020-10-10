/*
	schedules deletion of all remaining alive AI and mission objects.
	Updates the mission que.
	Updates mission markers.
	By Ghostrider-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp"
	
_fn_missionCleanup = {	
	params["_coords","_mines","_objects","_hiddenObjects","_blck_AllMissionAI","_markerName","_cleanupAliveAITimer","_cleanupCompositionTimer",["_isScubaMission",false]];

	[_mines] call blck_fnc_clearMines;
	blck_oldMissionObjects pushback [_coords,_objects, (diag_tickTime + _cleanupCompositionTimer)];	
	blck_hiddenTerrainObjects pushBack[_hiddenObjects,(diag_tickTime + _cleanupCompositionTimer)];
	blck_liveMissionAI pushback [_coords,_blck_AllMissionAI, (diag_tickTime + _cleanupAliveAITimer)];
	blck_missionsRunning = blck_missionsRunning - 1;
	blck_ActiveMissionCoords = blck_ActiveMissionCoords - [ _coords];	
	if !(_isScubaMission) then
	{
		blck_recentMissionCoords pushback [_coords,diag_tickTime]; 
		[_markerName,"inactive",[0,0,0]] call blck_fnc_updateMissionQue;	
	};
	if (_isScubaMission) then
	{
		blck_priorDynamicUMS_Missions pushback [_coords,diag_tickTime]; 
		blck_UMS_ActiveDynamicMissions = blck_UMS_ActiveDynamicMissions - [_coords];
		blck_dynamicUMS_MissionsRuning = blck_dynamicUMS_MissionsRuning - 1;		
	};
};

///////////////////////////////////////////////////////////////////////
//  MAIN FUNCTION STARTS HERE
//////////////////////////////////////////////////////////////////////

params[
	"_coords",
	"_mines",
	"_objects",
	"_hiddenObjects",
	"_crates",
	"_blck_AllMissionAI",
	"_endMsg",
	"_markers",
	"_markerPos",
	"_markerName",
	"_markerLabel",
	["_endCondition",0],
	["_vehicles",[]],
	["_isScubaMission",false]
];

{
	[_x] call blck_fnc_deleteMarker;
}forEach (_markers);

switch (_endCondition) do 
{
	case -1: {
			#define	cleanupCompositionTimer  0
			#define	cleanupAliveAITimer  0
			
			{
				if (local _x) then {deleteVehicle _x};
			}forEach _crates;

			[_coords,_mines,_objects,_hiddenObjects,_blck_AllMissionAI,_markerName,cleanupAliveAITimer,cleanupCompositionTimer,_isScubaMission] call _fn_missionCleanup;
			[format["Mission <TIMED OUT> | _coords %1 : _markerClass %2 :  _markerMissionName %3",_coords,_markerName,_markerLabel]] call blck_fnc_log;			
	};
	case 1: {  // Normal End
			if (blck_useSignalEnd) then
			{
				[_crates select 0,150] spawn blck_fnc_signalEnd;
				{
					_x enableRopeAttach true;
				}forEach _crates;
			};
			
			[["end",_endMsg,_markerLabel]] call blck_fnc_messageplayers;

			[_markerPos, _markerName] spawn blck_fnc_missionCompleteMarker;
			{
				if !(_x getVariable["lootLoaded",false] || _endCondition == 1) then // dont load loot if the asset was killed
				{
					[_x,_crateLoot,_lootCounts] call blck_fnc_fillBoxes;
				};
			}forEach _crates;

			{
				private ["_v","_posnVeh"];
				_posnVeh = blck_monitoredVehicles find _x;  // returns -1 if the vehicle is not in the array else returns 0-(count blck_monitoredVehicles -1)
				if (_posnVeh >= 0) then
				{
					(blck_monitoredVehicles select _posnVeh) setVariable ["missionCompleted", diag_tickTime];
				} else {
					_x setVariable ["missionCompleted", diag_tickTime];
					blck_monitoredVehicles pushback _x;
				};
			} forEach _vehicles;

			[_coords,_mines,_objects,_hiddenObjects,_blck_AllMissionAI,_markerName,blck_AliveAICleanUpTimer,blck_cleanupCompositionTimer,_isScubaMission] call _fn_missionCleanup;
			[format["Mission Completed | _coords %1 : _markerClass %2 :  _markerMissionName %3",_coords,_markerName,_markerLabel]] call blck_fnc_log;			
	};
	case 2: {  // Aborted for moving a crate 

				{
					if ( _x distance (_x getVariable ["crateSpawnPos", (getPos _x)]) > max_distance_crate_moved_uncompleted_mission)then {deleteVehicle _x};
				} forEach _crates;
				#define illegalCrateMoveMsg "Crate moved before mission completed"
				[["warming",illegalCrateMoveMsg,_markerLabel]] call blck_fnc_messageplayers;
				[_coords,_mines,_objects,_hiddenObjects,_blck_AllMissionAI,_markerName,cleanupAliveAITimer,cleanupCompositionTimer,_isScubaMission] call _fn_missionCleanup;
				[format["Mission Aborted <CRATE MOVED> | _coords %1 : _markerClass %2 :  _markerMissionName %3",_coords,_markerName,_markerLabel]] call blck_fnc_log;
	};
	case 3: {  // Mision aborted for killing an asset
			#define	cleanupCompositionTimer  0
			#define	cleanupAliveAITimer  0
			
			{
				if (local _x) then {deleteVehicle _x};
			}forEach _crates;
			[["warning",_endMsg,_markerLabel]] call blck_fnc_messageplayers;
			[_coords,_mines,_objects,_hiddenObjects,_blck_AllMissionAI,_markerName,cleanupAliveAITimer,cleanupCompositionTimer,_isScubaMission] call _fn_missionCleanup;
			[format["Mission Aborted <ASSET KILLED> | _coords %1 : _markerClass %2 :  _markerMissionName %3",_coords,_markerName,_markerLabel]] call blck_fnc_log;

	};
	case 4: {
			#define	cleanupCompositionTimer  0
			#define	cleanupAliveAITimer  0
			
			{
				if (local _x) then {deleteVehicle _x};
			}forEach _crates;

			[_coords,_mines,_objects,_hiddenObjects,_blck_AllMissionAI,_markerName,cleanupAliveAITimer,cleanupCompositionTimer,_isScubaMission] call _fn_missionCleanup;
	};
	case 5: {
			#define	cleanupCompositionTimer  0
			#define	cleanupAliveAITimer  0
			
			{
				if (local _x) then {deleteVehicle _x};
			}forEach _crates;

			[_coords,_mines,_objects,_hiddenObjects,_blck_AllMissionAI,_markerName,cleanupAliveAITimer,cleanupCompositionTimer,_isScubaMission] call _fn_missionCleanup;
	};	
};

blck_missionsRun = blck_missionsRun + 1;
