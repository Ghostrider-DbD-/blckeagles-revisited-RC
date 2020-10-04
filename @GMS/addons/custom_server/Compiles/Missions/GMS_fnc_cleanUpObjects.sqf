	// Delete objects in a list after a certain time.
	// code to delete any smoking or on fire objects adapted from kalania 
	//http://forums.bistudio.com/showthread.php?165184-Delete-Fire-Effect/page1
	// http://forums.bistudio.com/showthread.php?165184-Delete-Fire-Effect/page2
/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

for "_i" from 1 to (count blck_oldMissionObjects) do {
	if (_i <= count blck_oldMissionObjects) then {
		private _oldObjs = blck_oldMissionObjects deleteAt 0;
		_oldObjs params [["_missionCenter",[0,0,0]],["_objarr",[]],["_timer",0]];
		if (diag_tickTime > _timer) then 
		{
			private _nearplayer = [_missionCenter,800] call blck_fnc_nearestPlayers;
			if (_nearPlayer isEqualTo []) then 
			{
				{
					if (typeName _x isEqualTo "OBJECT") then {deleteVehicle _x};
					if (typeName _x isEqualTo "STRING") then {deleteVehicle (objectFromNetId _x)};
				} forEach _objarr;
			} else {
				blck_oldMissionObjects pushback _oldObjs;
			};
		} else {
			blck_oldMissionObjects pushback _oldObjs;
		};
	};
};
