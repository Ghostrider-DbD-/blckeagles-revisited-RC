/*
	Generates an array of equidistant positions along the circle of diameter _radius
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last Modified 8-13-16
*/

private["_locs","_radius","_startDir","_currentDir","_Arc","_dist","_newpos","_xpos","_ypos"];
params["_center","_num","_minDistance","_maxDistance"];

_locs = [];
_startDir = round(random(360));
_currentDir = _startDir;
_Arc = 360/_num;

for "_i" from 1 to _num do
{
	_currentDir = _currentDir + _Arc;
	//diag_log format["spawnEmplaced: _currentDir is %1 for cycle %2",_currentDir,_i];
	_dist = round(_minDistance + (random(_maxDistance - _minDistance)));
	_newpos = _center getPos [_dist, _currentDir];
	//diag_log format["findPositionAlongRadius:: distance of pos %1 from center is %2",_newpos, _newpos distance _center];
	_locs pushback _newpos;
};
//diag_log format["_fnc_findPositionsAlongARadius:: _locations = %1",_locations];
_locs



