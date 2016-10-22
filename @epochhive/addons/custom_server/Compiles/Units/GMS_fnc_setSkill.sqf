/*
  Set skills for an AI Unit
  by Ghostrider
  Last updated 8/14/16   
*/

// Self explanatory
// [_group, _skill] call blck_setSkill;
params ["_unit","_skillsArrray"];

{
	_unit setSkill [(_x select 0),(_x select 1)];
} forEach _skillsArrray;
