/*
	By Ghostrider-GRG-
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_building","_group",["_noStatics",0],["_typesStatics",blck_staticWeapons],["_noUnits",0],["_aiDifficultyLevel","Red"],	["_uniforms",[]],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_launcher","none"],["_weaponList",[]],["_sideArms",[]]];
if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};

private["_unit","_obj","_staticClassName","_usedBldPsn","_pos","_obj"];
private _allBldPsn =  [_building] call BIS_fnc_buildingPositions;
private _usedBldPsn = [];
private _floor = floor((count _allBldPsn)/2);       
private _ceil = ceil((count _allBldPsn)/2);
private _statics = if (_ceil > _noStatics) then {_noStatics} else {_ceil};
private _units = if (_floor > _noUnits) then {_noUnits} else {_floor};
private _staticsSpawned = [];
uiSleep 1;
for "_i" from 1 to _statics do
{
	diag_log format["_fnc_spawnGarrisonInsideBuilding_relPos: _x = %1",_x];	
	_pos = selectRandom _allBldPsn;
	_allBldPsn = _allBldPsn - [_pos];
	_staticClassName = selectRandom _typesStatics;
	_obj = [_staticClassName, [0,0,0], true] call blck_fnc_spawnVehicle;  
	_obj setVariable["GRG_vehType","emplaced"];
	_staticsSpawned pushBack _obj;
	_obj setPosATL _pos; // (_pos vectorAdd (getPosATL _building));
	_unit = [[0,0,0],_group,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,_launcher,_weaponList,_sideArms,false,true] call blck_fnc_spawnUnit;
	_unit moveInGunner _obj;             
};

for "_i" from 1 to _units do
{
	_pos = selectRandom _allBldPsn;
	_allBldPsn = _allBldPsn - [_pos];    
	_unit = [[0,0,0],_group,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,_launcher,_weaponList,_sideArms,false,true] call blck_fnc_spawnUnit;
	_unit setPosATL _pos;
};
_staticsSpawned
