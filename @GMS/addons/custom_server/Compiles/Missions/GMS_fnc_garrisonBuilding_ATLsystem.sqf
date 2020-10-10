
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
params["_center",
        "_garrisonedBuilding_ATLsystem",
        ["_aiDifficultyLevel","Red"],
        ["_uniforms",[]],
        ["_headGear",[]],
        ["_vests",[]],
        ["_backpacks",[]],
        ["_weaponList",[]],
        ["_sideArms",[]]
];

if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};

private["_group","_buildingsSpawned","_staticsSpawned","_g","_building","_return"];
_buildingsSpawned = [];
_staticsSpawned = [];   
_group = [blck_AI_Side,true] call blck_fnc_createGroup; 
if !(isNull _group) then 
{
    {
        _g = _x;        
        _x params["_bldClassName","_bldRelPos","_bldDir","_s","_d","_statics","_men"];
        _building = createVehicle[_bldClassName,[0,0,0],[],0,"CAN_COLLIDE"];
        _building setPosATL (_bldRelPos vectorAdd _center);
        _building setDir _bldDir;
        _buildingsSpawned pushBack (netID _building);
        _staticsSpawned = [_building,_group,_statics,_men,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,"none",_weaponList,_sideArms] call blck_fnc_spawnGarrisonInsideBuilding_ATL;
    }forEach _garrisonedBuilding_ATLsystem;
};

_return = [_group,_buildingsSpawned,_staticsSpawned];
_return
