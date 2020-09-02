// Spawns mines in a region centered around a specific position and returns an array with the spawned mines for later use, i.e. deletion
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

private ["_noMines","_mineTypes","_minesPlaced","_minDis","_maxDis","_closest","_radius","_xpos","_ypos","_dir","_incr","_i","_j","_posMine","_mine"];

params["_pos"];

_noMines = 50;
_mineTypes = ["ATMine","SLAMDirectionalMine"];
_minesPlaced = [];
_minDis = 50;
_maxDis = 150;
_closest = 5;
_dir = 0;
_incr = 360/ (_noMines/2);
for "_i" from 1 to _noMines/2 do
{
	for "_j" from 1 to 2 do
	{
		_radius = _maxDis - floor(random(_maxDis - _minDis));
		_xpos = (_pos select 0) + sin (_dir) * _radius;
		_ypos = (_pos select 1) + cos (_dir) * _radius;	
		_posMine = [_xpos,_ypos,0];
		_mine = createMine ["ATMine", _posMine, [], 0];
		_mine setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
		_mine setPos _posMine;
		_minesPlaced = _minesPlaced + [_mine];
	};
	_dir = _dir + _incr;
};
_minesPlaced
