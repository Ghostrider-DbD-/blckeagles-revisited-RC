/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
params["_message"];

// As found in fn_3DENExportTerrainBuilder.sqf
//private _message = ["this is ","an array"];
private _lineBreak = toString [10];
uiNameSpace setVariable ["Display3DENCopy_data", ["missionName.sqf", _message joinString _lineBreak]];
(findDisplay 313) createdisplay "Display3DENCopy";