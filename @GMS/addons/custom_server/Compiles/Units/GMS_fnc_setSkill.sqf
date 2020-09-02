/*
  Set skills for an AI Unit
  by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params ["_unit","_skillsArrray"];
private["_skillLevel"];
{
	_skillLevel = [_x select 1] call blck_fnc_getNumberFromRange;
	_unit setSkill [(_x select 0), _skillLevel];
} forEach _skillsArrray;
