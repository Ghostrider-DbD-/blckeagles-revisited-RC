/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_mode"];
missionNamespace setVariable["blck_endState",_mode];
systemChat format["Mission End State updated to %1",_mode];