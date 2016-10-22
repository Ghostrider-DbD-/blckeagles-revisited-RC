/*
	Spawn a vehicle and protect it against cleanup by Epoch
	Returns the object (vehicle) created.
	By Ghostrider-DBD-
	Last modified 9-10-16
*/

private["_veh"];
params["_vehType","_pos"];
//_vehType = _this select 0;  // type of vehicle to be spawned
//_pos = _this select 1;  // position at which vehicle is to be spawned
	
//diag_log format["spawnVehicle.sqf:   _this = %1",_this];
_veh = createVehicle[_vehType, _pos, [], 0, "NONE"];
uisleep 0.1;

private["_modType"];
_modType = call blck_getModType;
if (_modType isEqualTo "Epoch") then
{
	_veh call EPOCH_server_vehicleInit;
	_veh call EPOCH_server_setVToken;
};

_veh setVehicleLock "LOCKEDPLAYER";
[_veh] spawn blck_fnc_vehicleMonitor;
//[_vehToSpawn, blck_ModType] call blck_fnc_protectVehicle;
_veh
	
