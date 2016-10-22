// Spawns a vehicle or emplaced weapons, man's it, and destroys it when the AI gets out.
// by Ghostrider-DBD-
// Last Updated 9-10-16

private["_emplaced","_safepos","_emp","_gunner"];
params["_pos","_emplacedGroup","_emplacedTypes",["_minDist",20],["_maxDist",35] ];

if (isNull _emplacedGroup) exitWith {};
	
_safepos = [_pos,_minDist,_maxDist,0,0,20,0] call BIS_fnc_findSafePos;
_emplaced = selectRandom _emplacedTypes; 
_emp = createVehicle[_emplaced, _safepos, [], 0, "NONE"];

private["_modType"];
_modType = call blck_getModType;
if (_modType isEqualTo "Epoch") then
{
	//_emp call EPOCH_server_vehicleInit;
	_emp call EPOCH_server_setVToken;
};

clearWeaponCargoGlobal    _emp;
clearMagazineCargoGlobal  _emp;
clearBackpackCargoGlobal  _emp;
clearItemCargoGlobal      _emp;

_emp addEventHandler ["GetOut",{(_this select 0) setDamage 1;}];
_emp addEventHandler ["GetIn",{(_this select 0) setDamage 1;}];
_gunner = (units _emplacedGroup) select 0;
_gunner moveingunner _emp;
_emp setVehicleLock "LOCKEDPLAYER";
[_emp] spawn blck_fnc_vehicleMonitor;	
	
//diag_log format["spawnEmplaced.sqf: Emplaced weapon %1 spawned"];

_emp
