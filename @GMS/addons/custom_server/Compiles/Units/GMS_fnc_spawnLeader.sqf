/*
  by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords","_leaderConfigs"];
private["_leader","_building","_result"];
_leader = [_coords, _leaderConfigs] call blck_fnc_spawnCharacter;
_leader remoteExec["GMS_fnc_initLeader", -2, true];
_leader setVariable["assetType",2,true];
_leader setVariable["endAnimation",["Acts_CivilShocked_1"],true];
_building = [_leader,_coords,_leaderConfigs select 7] call blck_fnc_placeCharacterInBuilding;
_result = [_leader,_building];
_result


