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

private _evaluate = true;
 while {_evaluate} do
{
	_waterPos = [
		blck_mapCenter, // center of search area
		2, // min distance to search 
		blck_maxSeaSearchDistance, // max distance to search
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







