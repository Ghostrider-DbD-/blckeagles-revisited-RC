/*
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last Modified 8-13-16
	
  Waits for a random period between _min and _max seconds
  Call as
  [_minTime, _maxTime] call blck_fnc_waitTimer
  Returns true; 
*/
private["_wait","_Tstart"];
params["_min","_max"];

_wait = round( _min + (_max - _min) );
uiSleep _wait;

true
