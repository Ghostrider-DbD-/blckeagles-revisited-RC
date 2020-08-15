/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_mode"];
switch (_mode) do 
{
	case "random": {missionNamespace setVariable["blck_missionLocations","random"]};
	case "fixed": {missionNamespace setVariable["blck_missionLocations","fixed"]};
};
systemChat format["Mission Locations updated to %1",_mode];