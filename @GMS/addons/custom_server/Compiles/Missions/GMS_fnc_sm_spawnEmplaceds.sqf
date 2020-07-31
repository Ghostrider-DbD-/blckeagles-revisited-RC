/*
	by Ghostrider [GRG]
	for ghostridergaming
	12/5/17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_missionEmplacedWeapons","_noEmplacedWeapons","_aiDifficultyLevel","_coords","_uniforms","_headGear"];
private["_return","_emplacedWeps","_emplacedAI","_wep","_units","_gunner","_abort","_pos","_mode"];
_emplacedWeps = [];
_emplacedAI = [];
_units = [];
_abort = false;
_pos = [];

// Define _missionEmplacedWeapons if not already configured.
if (_missionEmplacedWeapons isEqualTo []) then
{
	_missionEmplacedWeaponPositions = [_coords,_noEmplacedWeapons,35,50] call blck_fnc_findPositionsAlongARadius;
	{
		_static = selectRandom blck_staticWeapons;
		_missionEmplacedWeapons pushback [_static,_coords vectorAdd _x,_aiDifficultyLevel];
	} forEach _missionEmplacedWeaponPositions;
};

{
	_wepnClassName = _x select 0;
	_pos = _x select 1;
	_difficulty = _x select 2;
	__empGroup = [_pos,_pos,1,1,_difficulty,1,2,false,_uniforms,_headGear] call blck_fnc_spawnGroup;
	_empGroup setcombatmode "RED";
	_empGroup setBehaviour "COMBAT";
	_wep = [_wepnClassName,[0,0,0]] call blck_fnc_spawnVehicle;
	_wep setVariable["GRG_vehType","emplaced"];	
	_wep setPosATL _pos;
	[_wep,false] call blck_fnc_configureMissionVehicle;	
	_units = units _empGroup;
	_gunner = _units select 0;
	_gunner moveingunner _wep;	
} forEach _missionEmplacedWeapons;
blck_monitoredVehicles append _emplacedWeps;

true
