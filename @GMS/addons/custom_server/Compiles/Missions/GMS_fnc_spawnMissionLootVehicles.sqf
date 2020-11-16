/*
	by Ghostridere-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords","_missionLootVehicles",["_loadCrateTiming","atMissionSpawn"],["_lock",0]];
if (count _coords isEqualTo 2) then {_coords pushBack 0};
private _vehs = [];
{
	_x params["_vehType","_vehOffset",["_dir",0],"_lootArray","_lootCounts"];
	_veh = [_vehType, _coords vectorAdd _vehOffset] call blck_fnc_spawnVehicle;
	[_veh, _dir] call blck_fnc_setDirUp;
	_veh lock _lock;
	if (_loadCrateTiming isEqualTo "atMissionSpawnGround") then
	{
		[_veh,_lootArray,_lootCounts] call blck_fnc_fillBoxes;
		_veh setVariable["lootLoaded",true];
		//private _crateMoney = missionNamespace getVariable (format["blck_crateMoney%1",_difficulty]);
		[_veh,missionNamespace getVariable (format["blck_crateMoney%1",_difficulty])] call blck_fnc_addMoneyToObject;		
	} else {
		_veh setVariable["lootArray",_lootArray];
		_veh setVariable["lootCounts",_lootCounts];
		_veh setVariable["lootLoaded",false];		
	};
	_vehs pushback _veh;
}forEach _missionLootVehicles;
_vehs
