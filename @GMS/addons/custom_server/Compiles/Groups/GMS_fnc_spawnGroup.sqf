/*
	blck_fnc_spawnGroup
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_numbertospawn","_safepos","_launcherType","_infantryType"];	
params[["_group","Error"],"_pos",  "_center", ["_numai1",5],  ["_numai2",10],  ["_skillLevel","red"], ["_minDist",30], ["_maxDist",45],["_configureWaypoints",true], ["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]], ["_scuba",false],["_patrolRadius",30]];


if (_weaponList isEqualTo []) then {_weaponList = [_skillLevel] call blck_fnc_selectAILoadout};
if (_sideArms isEqualTo [])  then {_sideArms = [_skillLevel] call blck_fnc_selectAISidearms};
if (_uniforms isEqualTo [])  then {_uniforms = [_skillLevel] call blck_fnc_selectAIUniforms};
if (_headGear isEqualTo [])  then {_headGear = [_skillLevel] call blck_fnc_selectAIHeadgear};
if (_vests isEqualTo [])     then {_vests = [_skillLevel] call blck_fnc_selectAIVests};
if (_backpacks isEqualTo []) then {_backpacks = [_skillLevel] call blck_fnc_selectAIBackpacks};

_numbertospawn = [_numai1,_numai2] call blck_fnc_getNumberFromRange;

if !(isNull _group) then
{
	if (_weaponList isEqualTo []) then
	{
		_weaponList = [_skillLevel] call blck_fnc_selectAILoadout;
	};

	//Spawns the correct number of AI Groups, each with the correct number of units
	for "_i" from 1 to _numbertospawn do 
	{
		_i = _i + 1;
		if (blck_useLaunchers && _i <= blck_launchersPerGroup) then
		{
			_launcherType = selectRandom blck_launcherTypes;
		} else {
			_launcherType = "none";
		};
		private _unitPos = [_pos,3,6] call blck_fnc_findRandomLocationWithinCircle;
	 	[_unitPos,_group,_skillLevel,_uniforms,_headGear,_vests,_backpacks,_launcherType, _weaponList, _sideArms, _scuba] call blck_fnc_spawnUnit;
		//diag_log format["_fnc_spawnGroup: _unit %1 spawned at %2 at a distance from the group center of %3 and _vector of %4",_unit,_unitPos,_unitPos distance _pos,_pos getRelDir _unitPos];
	};
	_group selectLeader ((units _group) select 0);
	if (_configureWaypoints) then
	{
		if (_scuba) then {_infantryType = "scuba"} else {_infantryType = "infantry"};
		#define infantryPatrolRadius 30
		#define infantryWaypointTimeout [5,7.5,10]
		[_pos,_minDist,_maxDist,_group,"random","SAD",_infantryType,_patrolRadius,infantryWaypointTimeout] spawn blck_fnc_setupWaypoints;
	};
} else 
{
	diag_log "_fnc_spawnGroup:: ERROR CONDITION : NULL GROUP CREATED";
};


