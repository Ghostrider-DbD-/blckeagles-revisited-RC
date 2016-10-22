/*
	Author: Ghostrider-DbD-
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP / WAI for Arma 3 Epoch
	License: Attribution-NonCommercial-ShareAlike 4.0 International
	call with
	[
		_pos,
		_skillAI,
		_timeout
	] call blck_spawnReinforcements
*/

params["_pos","_skillAI","_weapons"]; 

diag_log format["HeliPatrol:: Called with parameters _pos %1 _skillAI %2 _weapons %3",_pos,_skillAI,_weapons];

private["_chopperType","_chopperTypeArmed","_spawnPos","_spawnVector","_spawnDistance"];

_chopperType = selectRandom ["B_Heli_Light_01_armed_F","O_Heli_Light_02_F","O_Heli_Light_02_v2_F","B_Heli_Transport_03_F"];

diag_log format["HeliPatrol:: _chopperType seleted = %1 ",_chopperType];

_spawnVector = round(random(360));
_spawnDistance = 200 + floor(random(1500));
_spawnPos = _pos getPos [_spawnDistance,_spawnVector];

diag_log format["HeliPatrol:: vector was %1 with distance %2 yielding a spawn position of %3 at distance from _pos of %4",_spawnVector,_spawnDistance,_spawnPos, (_pos distance2d _spawnPos)];

private["_patrolHeli"];
//create helicopter and spawn it
_patrolHeli = createVehicle [_chopperType, _spawnPos, [], 90, "FLY"];
_patrolHeli setDir (_spawnVector -180);
_patrolHeli setFuel 1;
_patrolHeli engineOn true;
_patrolHeli flyInHeight 150;
_patrolHeli setVehicleLock "LOCKED";
_patrolHeli addEventHandler ["GetOut",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];

clearWeaponCargoGlobal _patrolHeli;
clearMagazineCargoGlobal _patrolHeli;
clearItemCargoGlobal _patrolHeli;
clearBackpackCargoGlobal  _patrolHeli;

private["_modType"];
_modType = call blck_getModType;
if (_modType isEqualTo "Epoch") then
{
	[_patrolHeli,blck_ModType] call blck_fnc_protectVehicle;
};

private["_grpPilot","_unitPilot"];
// add pilot to helicopter	//add pilot (single group) to supply helicopter
_grpPilot = createGroup blck_AI_Side;
_grpPilot setBehaviour "CARELESS";
_grpPilot setCombatMode "RED";
_grpPilot setSpeedMode "FULL";
_grpPilot allowFleeing 0;
_unitPilot = _grpPilot createUnit ["I_helipilot_F", getPos _patrolHeli, [], 0, "FORM"];
_unitPilot setSkill 1;
_unitPilot assignAsDriver _patrolHeli;
_unitPilot moveInDriver _patrolHeli;

_gunner = [[100, 100, 300],blck_WeaponList_Blue,_grpPilot,_skillAI] call blck_fnc_spawnAI;
_gunner assignAsCargo _patrolHeli;
_gunner moveInCargo [_patrolHeli,2];
_gunner enablePersonTurret [2, true];

_gunner2 = [[100, 100, 300],blck_WeaponList_Blue,_grpPilot,_skillAI] call blck_fnc_spawnAI;
_gunner2 assignAsCargo _patrolHeli;
_gunner2 moveInCargo [_patrolHeli,4];
_gunner2 enablePersonTurret [4, true];

_grpPilot selectLeader _unitPilot;

//set waypoint for helicopter
private["_wpDestination"];
_wpDestination =_grpPilot addWaypoint [_pos, 0];
_wpDestination setWaypointType "MOVE";
_wpDestination setWaypointSpeed "FULL";
_wpDestination setWaypointBehaviour "CARELESS";
_wpDestination setWaypointCompletionRadius 60;

//Announce reinforcements are inbound to nearby players
private["_message"];
_message = "A Helicopter Gunship was Spotted Near You!";
["reinforcements",_message,_pos] call blck_fnc_messageplayers;

diag_log "HeliPatrol:: helispawned and inbound, message sent";

//Waits until heli gets near the position to drop crate, or if waypoint timeout has been triggered
_destinationDone = false;
_startTime = diag_tickTime;
_timoutTime = 600;

while {true} do {
	if ( (( (getPos _patrolHeli) distance2D _pos) < 100) || ((diag_tickTime - _startTime) > _timoutTime) ) exitWith {	};
	uiSleep 2;
	//diag_log format["HeliPatrol:: heli %1 is %2 from mission center",_patrolHeli,_pos distance (getPos _patrolHeli)];
};

if ( (diag_tickTime - _startTime) > _timoutTime) exitWith 
{
	// HeliPatrol took too long so lets delete them.
	deleteVehicle _patrolHeli;
	deleteVehicle _unitPilot;
	deleteGroup _grpPilot;
	diag_log "[blckeagls] HeliPatrol failed to reach the mission site: heli and crew deleted";
};

diag_log "HeliPatrol:: heli on station";

for "_i" from 1 to 5 do
{
	private["_dir","_wpPos","_wpPatrol"];
	_dir = floor(random(360));
	_wpPos = _pos getPos [50,_dir];
	_wpPatrol =_grpPilot addWaypoint [_pos, 100];
	_wpPatrol setWaypointType "LOITER";
	_wpPatrol setWaypointSpeed "NORMAL";
	_patrolHeli limitSpeed 45;
	_wpPatrol setWaypointBehaviour "COMBAT";
	_wpPatrol setWaypointLoiterType "CIRCLE";
	_wpPatrol setWaypointTimeout [60, 90, 120];
	//_wpPatrol setWaypointCompletionRadius 100;
	_wpPatrol setWaypointName "Loiter";
	
		
	/*
	_wpPatrol setWaypointType "MOVE":
	_wpPatrol setWaypointCompletionRadius 50;
	_wpPatrol setWaypointStatements 
	["true",
			"
				(Vehicle this) flyinheight 50;
				(Vehicle this) limitSpeed 45;
				if(true) then {diag_log('WAI: Heli height ' + str((position Vehicle this) select 2) + '/ Heli speed ' + str(speed this)); };
	"];
	diag_log format["HeliPatrol::  Waypoint #1 with identity %2 added", _i, _wpPatrol]; ;
	_wpPatrol setWaypointTimeout [10,15,20];
};
/*
if (_spawnPatrol) then
{
	diag_log "HeliPatrol:: heli will patrol the area, setting up waypoints";
	private["_wpPatrol"];
	
	_wpPatrol setWaypointType "LOITER";
	_wpPatrol setWaypointSpeed "NORMAL";
	_wpPatrol setWaypointBehaviour "COMBAT";
	_wpPatrol setWaypointLoiterType "CIRCLE";
	_wpPatrol setWaypointTimeout [60, 90, 120];
	_wpPatrol setWaypointCompletionRadius 100;
	_wpPatrol setWaypointName "Loiter";
	
	while { (waypointTimeoutCurrent  _grpPilot) > 0} do 
	{
		uiSleep 1; 
		diag_log format["HeliPatrol:: patrol waypoint time at %1", waypointTimeoutCurrent  _grpPilot];
	};
}
else
{
	diag_log "HeliPatrol:: Heli will not patrol, no patrol waypoints were added";
};
*/

diag_log "HeliPatrol:: send heli back to spawn";
// Send the heli back to base
private["_wpHome"];
_wpHome =_grpPilot addWaypoint [_spawnPos, 200];
_wpHome setWaypointType "MOVE";
_wpHome setWaypointSpeed "FULL";
_wpHome setWaypointBehaviour "CASUAL";
_wpHome setWaypointCompletionRadius 200;
_wpHome setWaypointName "GoHome";
_wpHome setWaypointStatements ["true", "{deleteVehicle _x} forEach units group this;deleteVehicle (vehicle this);diag_log ""helicopter and crew deleted"""];

diag_log "HeliPatrol:: sending Heli Home";
// End of sending heli home
////////////////////////

_fn_cleanupHeli = {

	params["_patrolHeli","_homePos","_grpPilot"];
	// run some tests to be sure everything went OK

	_heliHome = false;
	_startTime = diag_tickTime;

	while { !(_heliHome) } do
	{
		_heliHome = (_patrolHeli distance _homePos) < 300;
		if ( !_heliHome && ((diag_tickTime - _startTime) > 300) ) then
		{
			_heliHome = true;
			deleteVehicle _patrolHeli;
			{
				deleteVehicle _x;
			}forEach units _grpPilot;
			deleteGroup _grpPilot;
	};
	
	uiSleep 2;
	};
};

[_patrolHeli,_spawnPos,_grpPilot] spawn _fn_cleanupHeli;

diag_log "HeliPatrol:: script done";

// Return the group used for AI reinforcements for book keeping purposes in the Mission Spawner.
diag_log format["HeliPatrol::  typeName _grpToops = %1", typeName _grpToops];
_grpToops;
