/*

	[_missionEmplacedWeapons,_noEmplacedWeapons,_aiDifficultyLevel,_coords,_uniforms,_headGear] call blck_fnc_spawnEmplacedWeaponArray;
	By Ghostrider [GRG]
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords",["_missionEmplacedWeapons",[]],["_useRelativePos",true],["_noEmplacedWeapons",0],["_aiDifficultyLevel","red"],["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]]];
if (_uniforms isEqualTo []) 		then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])		then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests isEqualTo []) 			then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) 		then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};
if (_weaponList  isEqualTo []) 	then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms isEqualTo []) 		then {[_aiDifficultyLevel] call blck_fnc_selectAISidearms};

private["_return","_emplacedWeps","_emplacedAI","_wep","_units","_gunner","_abort","_pos","_mode","_useRelativePos","_useRelativePos"];
_emplacedWeps = [];
_emplacedAI = [];
_units = [];
_abort = false;
_pos = [];

private _emplacedWepData = +_missionEmplacedWeapons;
//diag_log format["_spawnEmplacedWeaponArray(30): _noEmplacedWeapons = %1 | _emplacedWepData = %2",_noEmplacedWeapons,_emplacedWepData];

// Define _emplacedWepData if not already configured.
if (_emplacedWepData isEqualTo []) then
{
	private _wepPositions = [_coords,_noEmplacedWeapons,35,50] call blck_fnc_findPositionsAlongARadius;

	{
		_static = selectRandom blck_staticWeapons;
		_emplacedWepData pushback [_static,_x];
	} forEach _wepPositions;
	_useRelativePos = false;
};

//diag_log format["_spawnEmplacedWeaponArray(45): _noEmplacedWeapons = %1 | _emplacedWepData = %2",_noEmplacedWeapons,_emplacedWepData];

{
	if (_useRelativePos) then 
	{
		_pos = _coords vectorAdd (_x select 1);
	} else {
		_pos = (_x select 1);
	};

	#define configureWaypoints false
	#define minAI 1
	#define maxAI 1
	#define minDist 1
	#define maxDist 2

	private _empGroup = [blck_AI_Side,true]  call blck_fnc_createGroup;
	if !(isNull _empGroup) then 
	{
		[_empGroup,(_x select 1),_pos,minAI,maxAI,_aiDifficultyLevel,minDist,maxDist,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call blck_fnc_spawnGroup;
		_empGroup setcombatmode "RED";
		_empGroup setBehaviour "COMBAT";
		_empGroup setVariable ["soldierType","emplaced"];
		[(_x select 1),0.01,0.02,_empGroup,"random","SAD","emplaced"] spawn blck_fnc_setupWaypoints;
		private _wep = [(_x select 0),[0,0,0]] call blck_fnc_spawnVehicle;
		_wep setVariable["GRG_vehType","emplaced"];	
		_wep setPos _pos;
		_wep setdir (random 359);
		[_wep,2] call blck_fnc_configureMissionVehicle;	
		_emplacedWeps pushback _wep;
		_units = units _empGroup;
		_gunner = _units select 0;
		_gunner moveingunner _wep;
		_gunner setVariable["GRG_vehType","emplaced"];	
		_emplacedAI append _units;		
	} else {
		_abort = true;
		_return = grpNull;
		["createGroup returned grpNull","warning"] call blck_fnc_log;
	};
} forEach _emplacedWepData;
if !(_abort) then 
{
	blck_monitoredVehicles append _emplacedWeps;
	 if !(isNil "blck_spawnerMode") then 
	 {
		_return = [_emplacedWeps,_emplacedAI];
	 } else {
		_return = [_emplacedWeps,_emplacedAI,_abort];
	 };
} else {
	 if !(isNil "blck_spawnerMode") then 
	 {	
		{[_x] call blck_fnc_destroyVehicleAndCrew} forEach _emplacedWeps;
		_return = grpNull;
	 } else {
		blck_monitoredVehicles append _emplacedWeps;
		_return = [_emplacedWeps,_emplacedAI,_abort];		
	 };
};

_return
