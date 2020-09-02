/*
	Author: Ghostrider [GRG]
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP
	License: Attribution-NonCommercial-ShareAlike 4.0 International

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
	--------------------------
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_pos","_numAI","_skillAI",["_uniforms",[]],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weapons",[]],["_sideArms",[]],["_isScuba",false]];

if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};

private["_arc","_dir","_spawnPos","_chute","_unit","_return","_paraGroup"];
private _params = ["_pos","_numAI","_skillAI"];
#ifdef blck_debugMode
{
	diag_log format["_fnc_spawnParaUnits: %1 = %2",_x, _this select _forEachIndex];
}forEach _params;
#endif
_paraGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;
#define infantryPatrolRadius 30
#define infantryWaypointTimeout [5,7.5,10]
[_pos,20,30,_paraGroup,"random","SAD","paraUnits",infantryPatrolRadius,infantryWaypointTimeout] call blck_fnc_setupWaypoints;

#define launcherType "none"
private ["_arc","_spawnPos"];
_arc = 45;
_dir = 0;

for "_i" from 1 to _numAI do
{
	_spawnPos = _pos getPos[1,_dir];
	_chute = createVehicle ["Steerable_Parachute_F", [_spawnPos select 0, _spawnPos select 1, 250], [], 0, "FLY"];
	[_chute] call blck_fnc_protectVehicle;
	_unit = [getPos _chute,_paraGroup,_skillAI,_uniforms,_headGear,_vests,_backpacks,launcherType,_weapons,_sideArms,_isScuba] call blck_fnc_spawnUnit;
	_unit assignAsDriver _chute;
	_unit moveInDriver _chute;
	_unit setVariable["chute",_chute];
	_dir = _dir + _arc;
	
	uiSleep 2;
};

blck_monitoredMissionAIGroups pushback _paraGroup;

_paraGroup
