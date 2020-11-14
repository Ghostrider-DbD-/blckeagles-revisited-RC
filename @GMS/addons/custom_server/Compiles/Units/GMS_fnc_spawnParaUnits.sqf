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
//  Acomodate case where para are spawned over water.
params["_pos","_numAI","_skilllevel",["_uniforms",[]],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weapons",[]],["_sideArms",[]],["_isScuba",false]];

if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};

private _params = ["_pos","_numAI","_skillAI"];
private _paraGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;
private _arc = 45;
private _dir = 0;

#define infantryPatrolRadius 30
#define infantryWaypointTimeout [5,7.5,10]
#define launcherType "none"

[_pos,20,30,_paraGroup,"random","SAD","paraUnits",infantryPatrolRadius,infantryWaypointTimeout] call blck_fnc_setupWaypoints;
for "_i" from 1 to _numAI do
{
	private _unitPos = _pos getPos[1,_dir];
	private _chute = createVehicle ["Steerable_Parachute_F", [_unitPos select 0, _unitPos select 1, 250], [], 0, "FLY"];
	[_chute] call blck_fnc_protectVehicle;
	private "_unit";
	if (surfaceIsWater _unitPos && _isScuba) then 
	{
		_unit = [_unitPos,_paraGroup,_skillLevel,blck_UMS_uniforms,blck_UMS_headgear,blck_UMS_vests,_backpacks,launcherType, blck_UMS_weapons, _sideArms, _isScuba] call blck_fnc_spawnUnit;
	} else { 
		_unit = [_unitPos,_paraGroup,_skillLevel,_uniforms,_headGear,_vests,_backpacks,launcherType, _weaponList, _sideArms, _isScuba] call blck_fnc_spawnUnit;
	};

	_unit assignAsDriver _chute;
	_unit moveInDriver _chute;
	_unit setVariable["chute",_chute];
	_dir = _dir + _arc;
	uiSleep 2;  //  To space them out a bit
};

blck_monitoredMissionAIGroups pushback _paraGroup;

_paraGroup
