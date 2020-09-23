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
private _allBldPsn =  [[_building] call BIS_fnc_buildingPositions] call BIS_fnc_arrayShuffle;
private _countBldPsn = count _allBldPsn;
private _floor = floor(_countBldPsn/2);       
private _ceil = ceil(_countBldPsn/2);
private _statics = if (_ceil > _noStatics) then {_noStatics} else {_ceil};
private _units = if (_floor > _noUnits) then {_noUnits} else {_floor};
private _staticsSpawned = [];
private _locsUsed = [];
uiSleep 1;
for "_i" from 1 to _statics do
{
	if (_allBldPsn isEqualTo []) exitWith {};	
	_pos = _allBldPsn deleteAt 0;
	_locsUsed pushBack _pos;
	_staticClassName = selectRandom _typesStatics;
	_obj = [_staticClassName, [0,0,0]] call blck_fnc_spawnVehicle;  
	_obj setVariable["GRG_vehType","emplaced"];
	_staticsSpawned pushBack _obj;
	_obj setPosATL _pos; // (_pos vectorAdd (getPosATL _building));
	_unit = [[0,0,0],_group,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,_launcher,_weaponList,_sideArms,false,true] call blck_fnc_spawnUnit;
	_unit moveInGunner _obj;             
};
private _infantryPos = _allBldPsn;
for "_i" from 1 to _units do
{
	if (_allBldPsn isEqualTo []) exitWith {};
	_pos = _allBldPsn deleteAt 0;   
	_unit = [[0,0,0],_group,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,_launcher,_weaponList,_sideArms,false,true] call blck_fnc_spawnUnit;
	_unit setPosATL _pos;
	{
		_wp = _group addWaypoint [_x, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointCompletionRadius 0;
		_wp waypointAttachObject _building;
		_wp setWaypointHousePosition _foreachindex;
		_wp setWaypointTimeout [15, 20, 30];
	} forEach (_building buildingPos -1);
};
_staticsSpawned
