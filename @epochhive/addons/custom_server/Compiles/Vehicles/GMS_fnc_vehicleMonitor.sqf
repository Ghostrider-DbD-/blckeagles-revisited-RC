/*
	Handle the case that all AI assigned to a vehicle are dead.
	Allows players to enter and use the vehicle when appropriate
	or otherwise destroys the vehicle.
	
	By Ghostrider-DBD-
	Copyright 2016
	Last updated 8-14-16
*/

private ["_unit","_units","_count","_group","_driver","_gunner","_cargo"];
params["_veh"];

_count = 0;

waitUntil { count crew _veh > 0};
//diag_log format["vehicle Manned %1",_veh];
while { (getDammage _veh < 1.0) && ({alive  _x} count crew _veh > 0)} do 
{		//diag_log format["vehicleMonitor: vehicle crew consists of %1", crew _veh];
		//diag_log format["vehicleMonitor: number of crew alive is %1", {alive  _x} count crew _veh];
		_veh setVehicleAmmo 1;
		_veh setFuel 1;
		sleep 10;
		/*
		//if ({alive  _x} count crew _veh < 1) then { _veh setDamage 1.1;};
		if (!alive gunner _veh) then { 
			{
				if (_x != driver _veh) exitWith {_x moveingunner _veh;};
			} forEach crew _veh;
		};
		if (!alive gunner _veh) then {driver _veh moveingunner _veh;};
		if (!alive driver _veh) then {
			{
				if (_x != gunner _veh) exitWith { _x moveindriver _veh;};
			} forEach crew _veh;
		};
		*/
		//diag_log format["vehicleMonitor.sqf: driver is %1; gunner is %2", driver _veh, gunner _veh];
};
//diag_log format["vehicleMonitor:: Vehicle %1 is empty",_veh];
//blck_PVS_aiVehicleEmpty = _veh;
//publicVariableServer "blck_PVS_aiVehicleEmpty";

//diag_log format["vehiclemonitor.sqf all crew for vehicle %1 are dead",_veh];

if (typeOf _veh in blck_staticWeapons) then // always destroy mounted weapons
{
	//diag_log format["vehicleMonitor.sqf: _veh %1 is (in blck_staticWeapons) = true",_veh];
	_veh setDamage 1;
} else {
	//diag_log format["vehicleMonitor.sqf: _veh %1 is (in blck_staticWeapons) = false",_veh];
	if (blck_killEmptyAIVehicles) then
	{
		private ["_v","_startTime"];
		//diag_log format["vehicleMonitor.sqf: _veh %1 is about to be killed",_veh];
		uiSleep 10;
		_veh setDamage 1;
		_startTime = diag_ticktime;
		waitUntil{sleep 5;(diag_tickTime - _startTime) > 120;};  // delete destroyed vehicles after 2 min
		deleteVehicle _veh;
	}
	else
	{
		//diag_log format["vehicleMonitor.sqf: make vehicle available to players; stripping eventHandlers from_veh %1",_veh];	
		_veh removealleventhandlers "GetIn";
		_veh removealleventhandlers "GetOut";
		_veh setVehicleLock "UNLOCKED" ;
	};
};


