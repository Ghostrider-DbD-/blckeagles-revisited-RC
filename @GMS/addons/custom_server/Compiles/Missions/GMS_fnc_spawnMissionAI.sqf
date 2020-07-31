/*
	blck_fnc_spawnMissionAI
	by Ghostrider [GRG]

	returns an array of the units spawned
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#define configureWaypoints true

params["_coords",["_minNoAI",3],["_maxNoAI",6],["_noAIGroups",0],["_missionGroups",[]],["_aiDifficultyLevel","red"],["_uniforms",[]],["_headGear",blck_BanditHeadgear],["_vests",[]],["_backpacks",[]],["_weapons",[]],["_sideArms",[]],["_isScubaGroup",false]];

private _unitsToSpawn = 0;
private _unitsPerGroup = 0;
private _ResidualUnits = 0;
private _adjusttedGroupSize = 0;

if (_noAIGroups > 0) then
{
	// Can add optional debug code here if needed.
	_unitsToSpawn = [[_minNoAI,_maxNoAI]] call blck_fnc_getNumberFromRange;  //round(_minNoAI + round(random(_maxNoAI - _minNoAI)));
	_unitsPerGroup = floor(_unitsToSpawn/_noAIGroups);
	_ResidualUnits = _unitsToSpawn - (_unitsPerGroup * _noAIGroups);
};
private _allSpawnedAI = [];
private _abort = false;

private _newGroup = grpNull;

if !(_missionGroups isEqualTo []) then
{ 	
	{
		_x params["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
		private _p = ["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
		private _p1 = [_position,_minAI,_maxAI,_skillLevel,_minPatrolRadius,_maxPatrolRadius];	
		private _groupSpawnPos = _coords vectorAdd _position;
		_newGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;
		_newGroup setVariable ["soldierType","infantry"];	

		if !(isNull _newGroup) then 
		{
			[_newGroup,_groupSpawnPos,_coords,_minAI,_maxAI,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
			_newGroup setVariable ["soldierType","infantry"];
			blck_monitoredMissionAIGroups pushback _newGroup;
			
			_allSpawnedAI append (units _newGroup);		
		};
	}forEach _missionGroups;
};
if (_missionGroups isEqualTo [] && _noAIGroups > 0) then
{
	private _minPatrolRadius = blck_minimumPatrolRadius;
	private _maxPatrolRadius = blck_maximumPatrolRadius;
	
	switch (_noAIGroups) do
	{
		case 1: {  // spawn the group near the mission center
				_newGroup = [blck_AI_Side,true] call blck_fnc_createGroup;
				_newGroup setVariable ["soldierType","infantry"];				
				if !(isNull _newGroup) then 
				{
					[_newGroup,_coords,_coords,_unitsToSpawn,_unitsToSpawn,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
					_newGroup setVariable ["soldierType","infantry"];
					_newAI = units _newGroup;
					blck_monitoredMissionAIGroups pushback _newGroup;
					_allSpawnedAI append _newAI;
				
				};
			 };
		case 2: {
				_groupLocations = [_coords,_noAIGroups,15,30] call blck_fnc_findPositionsAlongARadius;
				{
					if (_ResidualUnits > 0) then
					{
						_adjusttedGroupSize = _unitsPerGroup + _ResidualUnits;
						_ResidualUnits = 0;
					} else {
						_adjusttedGroupSize = _unitsPerGroup;
					};
					_newGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;
					_newGroup setVariable ["soldierType","infantry"];					
					if !(isNull _newGroup) then 
					{
						[_newGroup,_x,_coords,_adjusttedGroupSize,_adjusttedGroupSize,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
						_newAI = units _newGroup;
						_allSpawnedAI append _newAI;
					};
				}forEach _groupLocations;

			};
		case 3: { // spawn one group near the center of the mission and the rest on the perimeter
				_newGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;
				_newGroup setVariable ["soldierType","infantry"];
				if !(isNull _newGroup) then 
				{
					[_newGroup,_coords,_coords,_unitsPerGroup + _ResidualUnits,_unitsPerGroup + _ResidualUnits,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
					_newAI = units _newGroup;
					blck_monitoredMissionAIGroups pushback _newGroup;
					_allSpawnedAI append _newAI;
					_groupLocations = [_coords,2,20,35] call blck_fnc_findPositionsAlongARadius;
					{
						_newGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;	
						_newGroup setVariable ["soldierType","infantry"];		
						if !(isNull _newGroup) then 
						{
							[_newGroup,_x,_coords,_unitsPerGroup,_unitsPerGroup,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
							_newAI = units _newGroup;
							blck_monitoredMissionAIGroups pushback _newGroup;
							_allSpawnedAI append _newAI;
						};
					}forEach _groupLocations;
				};
			};
		default {  // spawn one group near the center of the mission and the rest on the perimeter
				_newGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;	
				_newGroup setVariable ["soldierType","infantry"];			
				if (isNull _newGroup) then 
				{
					[_newGroup,_coords,_coords,_unitsPerGroup + _ResidualUnits,_unitsPerGroup + _ResidualUnits,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;				
					_newAI = units _newGroup;
					blck_monitoredMissionAIGroups pushback _newGroup;
					_allSpawnedAI append _newAI;
				};
				_groupLocations = [_coords,(_noAIGroups - 1),20,40] call blck_fnc_findPositionsAlongARadius;
				{
					_newGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;
					_newGroup setVariable ["soldierType","infantry"];
					if !(isNull _newGroup) then 
					{
						[_newGroup,_x,_coords,_unitsPerGroup,_unitsPerGroup,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
						_newAI = units _newGroup;
						blck_monitoredMissionAIGroups pushback _newGroup;
						_allSpawnedAI append _newAI;
					};
				}forEach _groupLocations;
			};
	};
};

_return = [_allSpawnedAI,_abort];
_return
