// Spawns mines in a region centered around a specific position and returns an array with the spawned mines for later use, i.e. deletion
/*
	By Ghostrider-DBD-
	Copyright 2016
	Last updated 8-14-16
*/
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
		//_posMine = [[_xpos,_ypos,0],0,10,_closest,0,20,0] call BIS_fnc_findSafePos; // find a random loc
		_mine = createMine ["ATMine", _posMine, [], 0];
		_mine setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
		_mine setPos _posMine;
		//https://community.bistudio.com/wiki/setVectorUp
		_minesPlaced = _minesPlaced + [_mine];
		//diag_log format["[spawnMines.sqf] mine # %2 spawned at %1",_posMine,_i];
	};
	_dir = _dir + _incr;
};
_minesPlaced