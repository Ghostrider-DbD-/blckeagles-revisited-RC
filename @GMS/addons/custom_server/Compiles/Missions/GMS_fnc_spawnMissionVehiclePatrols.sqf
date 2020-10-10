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

private["_spawnPos","_return"];
private _vehicles = [];
private _missionAI = [];
private _abort = false;
private _patrolsThisMission = +_missionPatrolVehicles;
//diag_log format["_spawnMissionVehiclePatrols(30): _noVehiclePatrols = %1 | _patrolsThisMission = %2",_noVehiclePatrols,_patrolsThisMission];
if (_patrolsThisMission isEqualTo []) then
{
	_useRelativePos = false;
	private _spawnLocations = [_coords,_noVehiclePatrols,45,60] call blck_fnc_findPositionsAlongARadius;
	//diag_log format["_spawnMissionVehiclePatrols (35): _spawnLocations = %1",_spawnLocations];
	{

		private _v = [_skillAI] call blck_fnc_selectPatrolVehicle;
		_patrolsThisMission pushBack [_v, _x];
		diag_log format["_spawnMissionVehiclePatrols(36): _v = %1 | _patrolsThisMission = %2",_v,_patrolsThisMission];
	}forEach _spawnLocations;
};
//diag_log format["_spawnMissionVehiclePatrols(42): _patrolsThisMission = %1",_patrolsThisMission];
#define configureWaypoints false
{
	if (_useRelativePos) then
	{
		_spawnPos = _coords vectorAdd (_x select 1)
	} else {
		_spawnPos = _x select 1;
	};
	private _vehicle = _x select 0;	
	private _vehGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;
	_patrolVehicle = objNull;
	if !(isNull _vehGroup) then 
	{
		_vehGroup setVariable["soldierType","vehicle"];
		[_vehGroup,_spawnPos,_coords,_crewCount,_crewCount,_skillAI,1,2,false,_uniforms, _headGear,_vests,_backpacks,_weaponList,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
		_missionAI append (units _vehGroup);
		blck_monitoredMissionAIGroups pushBack _vehGroup;
		_spawnPos = _spawnPos findEmptyPosition[0,50,_vehicle];;
		#define useWaypoints true
		_patrolVehicle = [_coords,_spawnPos,_vehicle,40,60,_vehGroup,useWaypoints,_crewCount] call blck_fnc_spawnVehiclePatrol; 

		if !(isNull _patrolVehicle) then
		{
			_vehicles pushback _patrolVehicle;
		};
	} else {
		_abort = true;
	};
} forEach _patrolsThisMission;

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
