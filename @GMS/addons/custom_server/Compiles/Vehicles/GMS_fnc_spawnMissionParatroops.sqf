/*
	Author: Ghostrider [GRG]
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP
	License: Attribution-NonCommercial-ShareAlike 4.0 International
	
	This is basically a container that determines whether a paragroop group should be created and if so creates a group and passes it off to the routine that spawns the paratroops.
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords","_skillAI","_weapons","_uniforms","_headGear",["_grpParatroops",grpNull],["_heli",objNull]];

private["_grpParatroops","_chanceParatroops","_aborted","_return"];

_skillAI = toLower _skillAI;
_chanceParatroops = 0;
_noPara = 0;
_aborted = false;

if (_skillAI isEqualTo "blue") then {
	_chanceParatroops = blck_chanceParaBlue;
	_noPara = blck_noParaBlue;
};
if (_skillAI isEqualTo "green") then {
	_chanceParatroops = blck_chanceParaGreen;
	_noPara = blck_noParaGreen;
};
if (_skillAI isEqualTo "orange") then {
	_chanceParatroops = blck_chanceParaOrange;
	_noPara = blck_noParaOrange;
};
if (_skillAI isEqualTo "red") then {

	_chanceParatroops = blck_chanceParaRed;
	_noPara = blck_noParaRed;
};

if ( (random(1) < _chanceParatroops)) then
{
	if (isNull _grpParatroops) then
	{
		_grpParatroops = createGroup blck_AI_Side; 
	};
	_aborted = [_coords,_grpParatroops,_noPara,_skillAI,_weapons,_uniforms,_headGear,_heli] call blck_fnc_spawnParaUnits;
};

if (_aborted) then
{
	_return = [[],true];
} else {
	_return = [(units _grpParatroops),false];
};

_return

