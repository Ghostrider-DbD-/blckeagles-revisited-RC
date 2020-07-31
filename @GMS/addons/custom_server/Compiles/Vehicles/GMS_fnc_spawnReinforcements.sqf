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

params["_coords","_aiSkillsLevel","_weapons","_uniforms","_headgear",["_chancePara",0]];

private["_chanceHeliPatrol","_return","_temp","_missionHelis"];

_aiSkillsLevel = toLower _aiSkillsLevel;

if (_aiSkillsLevel isEqualTo "blue") then {
	_chanceHeliPatrol = blck_chanceHeliPatrolBlue;
	_missionHelis = blck_patrolHelisBlue;
};
if (_aiSkillsLevel isEqualTo "green") then {
	_chanceHeliPatrol = blck_chanceHeliPatrolGreen;
	_missionHelis = blck_patrolHelisGreen;
};
if (_aiSkillsLevel isEqualTo "orange") then {
	_chanceHeliPatrol = blck_chanceHeliPatrolOrange;
	_missionHelis = blck_patrolHelisOrange;
};
if (_aiSkillsLevel isEqualTo "red") then
{
	_chanceHeliPatrol = blck_chanceHeliPatrolRed;
	_missionHelis = blck_patrolHelisRed;	
};

if ( (_chanceHeliPatrol > 0) && (random (1) < _chanceHeliPatrol) ) then // if helipatrols are 'enabled' then paratroops will only drop if a heli spawns.
																		// The chance that they drop is linked to the value for them for that difficulty _aiSkillsLevel
																		//see _fnc_spannMissionParatroops for how this is handled.
{
	_temp = [_coords,_aiSkillsLevel,_weapons,_uniforms,_headgear,_missionHelis,_chancePara] call blck_fnc_spawnMissionHeli; 
	if (typeName _temp isEqualTo "ARRAY") then
	{
		_return = [_temp select 0, _temp select 1, _temp select 2];
	}
	else
	{
		_return = [objNull, [], true];
	};
} else {
		_temp = [_coords,_aiSkillsLevel,_weapons,_uniforms,_headgear] call blck_fnc_spawnMissionParatroops;

		if (typeName _temp isEqualTo "ARRAY") then
		{
			_return = [objNull, _temp select 0 /*units*/, _temp select 1 /*true/false*/];
		} else {
			_return = [objNull, [],true];
		};
};	

_return