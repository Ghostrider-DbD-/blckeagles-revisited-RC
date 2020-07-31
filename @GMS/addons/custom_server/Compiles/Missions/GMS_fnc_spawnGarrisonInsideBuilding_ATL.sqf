
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

params["_building","_group","_statics","_men",["_aiDifficultyLevel","Red"],	["_uniforms",[]],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_launcher","none"],["_weaponList",[]],["_sideArms",[]]];
if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};

private["_staticsSpawned","_return","_obj","_unit","_u"];
_staticsSpawned = [];
{
	_x params["_staticClassName","_staticRelPos","_staticDir"];
	_obj = [_staticClassName, [0,0,0]] call blck_fnc_spawnVehicle;  
	_obj setVariable["GRG_vehType","emplaced"];
	_staticsSpawned pushBack _obj;
	_obj setPosATL (_staticRelPos vectorAdd getPosATL _building);
	_obj setDir _staticDir;
	_unit = [[0,0,0],_group,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,_launcher,_weaponList,_sideArms,false,true] call blck_fnc_spawnUnit;
	_unit moveInGunner _obj; 
}forEach _statics;
{
	_u = _x;
	_u params["_unitRelPos","_unitDir"];
	_unit = [[0,0,0],_group,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,_launcher,_weaponList,_sideArms,false,true] call blck_fnc_spawnUnit;
	_unit setPosATL (_unitRelPos vectorAdd (getPosATL _building));
	_unit setDir _unitDir;
	_unit disableAI "PATH";
}forEach _men;
_staticsSpawned
