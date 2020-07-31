/*
	blck_fnc_spawnMissionVehiclePatrols
	by Ghostrider [GRG]
	returns [] if no groups could be created
	returns [_AI_Vehicles,_missionAI] otherwise;
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords","_noVehiclePatrols","_skillAI","_missionPatrolVehicles",["_useRelativePos",true],["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]], ["_isScubaGroup",false],["_crewCount",4]];

if (_uniforms isEqualTo []) 		then {_uniforms = [_skillAI] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])		then {_headGear = [_skillAI] call blck_fnc_selectAIHeadgear};
if (_vests isEqualTo []) 			then {_vests = [_skillAI] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) 		then {_backpacks = [_skillAI] call blck_fnc_selectAIBackpacks};
if (_weaponList  isEqualTo []) 		then {_weaponList = [_skillAI] call blck_fnc_selectAILoadout};
if (_sideArms isEqualTo []) 		then {[_skillAI] call blck_fnc_selectAISidearms};



private["_vehGroup","_vehiclePatrolSpawns","_missionAI","_missiongroups","_vehicles","_return","_vehiclePatrolSpawns","_vehicle","_return","_abort","_spawnPos","_v"];
_vehicles = [];
_missionAI = [];
_abort = false;

if (_missionPatrolVehicles isEqualTo []) then
{
	_useRelativePos = false;
	_vehiclePatrolSpawns = [_coords,_noVehiclePatrols,45,60] call blck_fnc_findPositionsAlongARadius;
	{
		_v = [_skillAI] call blck_fnc_selectPatrolVehicle;
		_missionPatrolVehicles pushBack [_v, _x];
	}forEach _vehiclePatrolSpawns;
};
#define configureWaypoints false
{
	if (_useRelativePos) then
	{
		_spawnPos = _coords vectorAdd (_x select 1)
	} else {
		_spawnPos = _x select 1;
	};
	_vehicle = _x select 0;
	_vehGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;
	_patrolVehicle = objNull;

	if !(isNull _vehGroup) then 
	{
		_vehGroup setVariable["soldierType","vehicle"];
		[_vehGroup,_spawnPos,_coords,_crewCount,_crewCount,_skillAI,1,2,false,_uniforms, _headGear,_vests,_backpacks,_weaponList,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
		_missionAI append (units _vehGroup);
		blck_monitoredMissionAIGroups pushBack _vehGroup;
		#define useWaypoints true
		_patrolVehicle = [_coords,_spawnPos,_vehicle,40,60,_vehGroup,useWaypoints,_crewCount] call blck_fnc_spawnVehiclePatrol; 

		if !(isNull _patrolVehicle) then
		{
			_vehicles pushback _patrolVehicle;
		};
	} else {
		_abort = true;
	};
} forEach _missionPatrolVehicles;
if !(_abort) then 
{
	blck_monitoredVehicles append _vehicles;
	if !(isNil "blck_spawnerMode") then 
	 {	
		_return = [_vehicles, _missionAI];
	 } else {
		_return = [_vehicles, _missionAI, _abort];
	 };
} else {
	 if !(isNil "blck_spawnerMode") then 
	 {	
		{[_x] call blck_fnc_destroyVehicleAndCrew} forEach _vehicles;
		_return = grpNull;
	 } else {
		blck_monitoredVehicles append _vehicles;
		_return = [_emplacedWeps,_emplacedAI,_abort];		
	 };
};
_return
