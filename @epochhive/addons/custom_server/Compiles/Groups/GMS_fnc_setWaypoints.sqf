// Sets up waypoints for a specified group.
/*
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last Modified 8-13-16
*/

private["_dist","_dir","_arc","_xpos","_ypos","_newpos","_wpradius","_wpnum","_oldpos"];
params["_pos","_minDis","_maxDis","_group"];

/*
_pos = _this select 0; // center of the patrol area
_minDis = _this select 1; // minimum distance from the center of a patrol area for waypoints
_maxDis = _this select 2; // maximum distance from the center of a patrol area for waypoints
_group = _this select 3;
*/

_wpradius = 30;
_wpnum = 6;
_oldpos = _pos;
_newpos = _oldpos;
_dir = random 360;
_arc = 360/_wpnum;
//Set up waypoints for our AI
for [{ _x=1 },{ _x < _wpnum },{ _x = _x + 1; }] do {
	_dir = _dir + _arc;
	if (_dir > 360) then {_dir = _dir - 360;};
	while{_oldpos distance _newpos < 20}do{ 
			sleep .1;

			_dist = (_minDis+(random (_maxDis - _minDis)));
			_xpos = (_pos select 0) + sin (_dir) * _dist;
			_ypos = (_pos select 1) + cos (_dir) * _dist;
			_newpos = [_xpos,_ypos,0];
	};	
	_oldPos = _newpos;	
	_wp = _group addWaypoint [[_xpos,_ypos,0], _wpradius];
	_wp setWaypointType "MOVE";
};
_wp = _group addWaypoint [[_xpos,_ypos,0], _wpradius];
_wp setWaypointType "CYCLE";
