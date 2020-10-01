/*
	by Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
private["_mapCenter","_waterPos","_priorUMSpositions","_maxDistance"];

switch (toLower worldName) do 
{
	case "altis": {_mapCenter = [15000,19000,0];_maxDistance = 20000};
	case "tanoa": {_mapCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");_maxDistance = 10000};
	case "malden": {_mapCenter = [6000,7000,0];_maxDistance = 5500};
	case "stratis":  {_mapCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");_maxDistance = 5000};	
	case "namalsk": {_mapCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");_maxDistance = 5000}; 
	case "taviana": {_mapCenter = [12000,12000,0];_maxDistance = 12000};
	case "napf" : {_mapCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");_maxDistance = 12000};
	case "lythium": {_mapCenter = [10000,10000,0]; _maxDistance = 6000;};
	case "vt7": {_mapCenter = [9000,9000,0]; _maxDistance = 9000};	
	default {_mapCenter = [6000,6000,0]; _maxDistance = 6000;};	
};

private _evaluate = true;
 while {_evaluate} do
{
	_waterPos = [
		_mapCenter, // center of search area
		2, // min distance to search 
		_maxDistance, // max distance to search
		0, // distance to nearest object
		2, // water mode [2 = water only]
		25, // max gradient
		0  // shoreMode [0 = anywhere]
	] call BIS_fnc_findSafePos;

	if (((getTerrainHeightASL _waterPos) < -4) &&  (getTerrainHeightASL _waterPos) > -10) then
	{
		_evaluate = false;
	};
};
//diag_log format["_findShoreLocation: _waterPos = %1",_waterPos];
_waterPos







