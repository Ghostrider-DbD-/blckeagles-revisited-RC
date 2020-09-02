/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_mode"];

private _header = format["%4Mission.sqf generated:: blckeagls 3DEN Plugin Version %1 : Build %2 : Build Date %3",
	getNumber(configFile >> " CfgBlck3DEN" >> "CfgVersion" >> "version"),
	getNumber(configFile >> "CfgBlck3DEN" >> "CfgVersion" >> "build"),
	getText(configFile >> "CfgBlck3DEN" >> "CfgVersion" >> "date"),
	_mode
];
diag_log _header;
_header

