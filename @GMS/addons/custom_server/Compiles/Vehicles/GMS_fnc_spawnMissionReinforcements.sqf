/*

	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords","_missionHelis","_spawnHeli",["_aiSkillsLevel","Red"],["_chancePara",0],["_noPara",0],["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]]];

if (_uniforms isEqualTo []) 	then {_uniforms = [_skillAI] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])	then {_headGear = [_skillAI] call blck_fnc_selectAIHeadgear};
if (_vests isEqualTo []) 		then {_vests = [_skillAI] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) 	then {_backpacks = [_skillAI] call blck_fnc_selectAIBackpacks};
if (_weaponList  isEqualTo []) 	then {_weaponList = [_skillAI] call blck_fnc_selectAILoadout};
if (_sideArms isEqualTo []) 		then {[_skillAI] call blck_fnc_selectAISidearms};

private["_return","_temp","_missionHelis"];

_aiSkillsLevel = toLower _aiSkillsLevel;

if ( _spawnHeli ) then // if helipatrols are 'enabled' then paratroops will only drop if a heli spawns.
																		// The chance that they drop is linked to the value for them for that difficulty _aiSkillsLevel
																		//see _fnc_spannMissionParatroops for how this is handled.
{
	_temp = [_coords,_missionHelis,_aiDifficultyLevel,_chancePara,_noPara,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call blck_fnc_spawnMissionHeli; 
	if (typeName _temp isEqualTo "ARRAY") then
	{
		_return = [_temp select 0, _temp select 1, _temp select 2];
	}
	else
	{
		_return = [objNull, [], true];
	};
} else {
		if (blck_debugLevel > 2) then {diag_log "_fnc_spawnMissionReinforcements (68): calling _fnc_spawnMissionParatroops to spawn para reinforcements";};
		_temp = [objNull,[],false];

		_temp = [_coords,_aiSkillsLevel,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call blck_fnc_spawnMissionParatroops;

		if (typeName _temp isEqualTo "ARRAY") then
		{
			_return = [objNull, _temp select 0 /*units*/, _temp select 1 /*true/false*/];
		} else {
			_return = [objNull, [],true];
		};
};	

_return