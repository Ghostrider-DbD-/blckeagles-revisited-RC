/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_difficulty"];
missionNamespace setVariable["blck_difficulty",_difficulty];
private _m = format["Mission Difficulty updated to %1",_difficulty];
systemChat _m;
diag_log _m;

