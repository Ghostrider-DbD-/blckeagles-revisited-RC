/*
	By Ghostrider [GRG]
	Copyright 2018
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

_fnc_dropMissionCrates = {
	private ["_crates","_marker","_markers","_blck_localMissionMarker","_location","_airborneCrates","_curPosCrate"];
	_crates = _this select 0;	
	_markers = [];
	
	{
		[(getPos _x), _x, true, 150] call blck_fnc_paraDropObject;
	} forEach _crates;
	
	_airborneCrates = _crates;
	while {count _airborneCrates > 0} do
	{
		uiSleep 1;
		{
			if ((getPos _x) select 2 < 5) then 
			{
				_airborneCrates = _airborneCrates - [_x];
				_chute = _x getVariable["chute",objNull];
				detach _x;
				deleteVehicle _chute;
				_location = getPos _x;
				_blck_localMissionMarker = [format["crateMarker%1%2",_location select 0, _location select 1],_location,"","","ColorBlack",["mil_dot",[]]];
				_marker = [_blck_localMissionMarker] call blck_fnc_spawnMarker;
				blck_temporaryMarkers pushBack [_marker,diag_tickTime + 300];
				_curPosCrate = getPos _x;
				_x setPos [_curPosCrate select 0, _curPosCrate select 1, 0.3];
			};
		} forEach _crates;
	};
};

params[ ["_coords", [0,0,0]], ["_cratesToSpawn",[]], ["_loadCrateTiming","atMissionSpawn"],["_spawnCrateTiming","atMissionSpawn"],["_missionState","start"], ["_difficulty","red"] ];


private _params = ["_coords","_cratesToSpawn","_loadCrateTiming","_spawnCrateTiming","_missionState","_difficulty"];

if ((count _coords) == 2) then // assume only X and Y offsets are provided
{
	_coords pushback 0;; // calculate the world coordinates
};
private _cratesSpawned = [];

{
	_x params["_crateType","_crateOffset","_lootArray","_lootCounts",["_crateDir",0]];
	
	private _pos = _coords vectorAdd _crateOffset;
	private _crate = [_pos,_crateType] call blck_fnc_spawnCrate;
	[_crate, _crateDir] call blck_fnc_setDirUp;
	_crate setVariable["lootArray",_lootArray];
	_crate setVariable["lootCounts",_lootCounts];
	_crate setVariable["difficulty",_difficulty];
	if (_loadCrateTiming isEqualTo "atMissionSpawn" || _missionState isEqualTo "end") then
	{
		[_crate] call blck_fnc_loadMissionCrate;
	};
	_cratesSpawned pushback _crate;
	
}forEach _cratesToSpawn;

if (_spawnCrateTiming in ["atMissionEndAir","atMissionSpawnAir"]) then 
{
	[_cratesSpawned] spawn _fnc_dropMissionCrates;
};

_cratesSpawned
