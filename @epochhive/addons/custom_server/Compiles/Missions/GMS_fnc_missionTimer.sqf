/*
  Generic Mission timer
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
*/
private ["_coords","_missionName","_scriptDone"];
params["_availableMissions","_missionPath","_markerClass","_aiDifficultyLevel","_tMin","_tMax"];
_aiDifficultyLevel = toLower (_aiDifficultyLevel);
/*
_availableMissions = _this select 0;
_missionPath = _this select 1;
_markerClass = _this select 2;
_aiDifficultyLevel = toLower (_this select 3);
_tMin = _this select 4;
_tMax = _this select 5;
*/

diag_log format["[blckeagls] Generic Mission Timer started with _this %1",_this];
//diag_log format["[blckeagls] Generic Mission Timer _t %1 _tMax %2",_tMin,_tMax];
while {true} do {
	waitUntil {[_tMin, _tMax] call blck_fnc_waitTimer};
	//uisleep 10;
	_coords = [] call blck_fnc_FindSafePosn;
	_coords pushback 0;	
	blck_ActiveMissionCoords pushback _coords;
	_missionName = selectRandom _availableMissions;
	_scriptDone = false;
	_scriptDone = [_coords,_markerClass,_aiDifficultyLevel] execVM format["\q\addons\custom_server\Missions\%1\%2.sqf",_missionPath,_missionName];
	waitUntil{scriptDone _scriptDone};
	blck_ActiveMissionCoords = blck_ActiveMissionCoords - [ _coords];
	blck_recentMissionCoords pushback [_coords,diag_tickTime];  // these coordinates are automatically deleted by findSafePsn after a certain period
};
