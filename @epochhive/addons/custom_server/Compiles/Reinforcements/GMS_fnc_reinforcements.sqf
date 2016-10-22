/*
	Author: Ghostrider-DbD-
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP
	License: Attribution-NonCommercial-ShareAlike 4.0 International
	call with
	[
		_pos,
		_numAI,
		_skillAI,
		_chanceLoot,
		_loogCounts,
		_weapons,
		_uniforms,
		_headgear,
		_patrol
	] call blck_spawnReinforcements
*/

params["_pos","_numAI","_skillAI","_chanceLoot","_lootCounts","_weapons","_uniforms","_headgear","_patrol"]; 

diag_log format["reinforcements:: Called with parameters _pos %1 _numAI %2 _skillAI %3 _chanceLoot %4",_pos,_numAI,_skillAI,_chanceLoot];

private["_chopperType","_chopperTypeArmed","_spawnPos","_spawnVector","_spawnDistance"];

// spawn an unarmed heli

_chopperType = selectRandom["B_Heli_Transport_03_unarmed_EPOCH","O_Heli_Light_02_unarmed_EPOCH","I_Heli_Transport_02_EPOCH"];

diag_log format["reinforcements:: _chopperType seleted = %1",_chopperType];

_spawnVector = round(random(360));
_spawnDistance = 200 + floor(random(1500));
_dropLoot = (random(1) < _chanceLoot);

// Use the new functionality of getPos
//  https://community.bistudio.com/wiki/getPos
_spawnPos = _pos getPos [_spawnDistance,_spawnVector];

diag_log format["reinforcements:: vector was %1 with distance %2 yielding a spawn position of %3 at distance from _pos of %4",_spawnVector,_spawnDistance,_spawnPos, (_pos distance2d _spawnPos)];

private["_supplyHeli"];
//create helicopter and spawn it
_supplyHeli = createVehicle [_chopperType, _spawnPos, [], 90, "FLY"];
_supplyHeli setDir (_spawnVector -180);
_supplyHeli setFuel 1;
_supplyHeli engineOn true;
_supplyHeli flyInHeight 250;
_supplyHeli setVehicleLock "LOCKED";
_supplyHeli addEventHandler ["GetOut",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];

clearWeaponCargoGlobal _supplyHeli;
clearMagazineCargoGlobal _supplyHeli;
clearItemCargoGlobal _supplyHeli;
clearBackpackCargoGlobal  _supplyHeli;

[_supplyHeli,blck_ModType] call blck_fnc_protectVehicle;

private["_grpPilot","_unitPilot"];
// add pilot to helicopter	//add pilot (single group) to supply helicopter
_grpPilot = createGroup blck_AI_Side;
_grpPilot setBehaviour "CARELESS";
_grpPilot setCombatMode "RED";
_grpPilot setSpeedMode "FULL";
_grpPilot allowFleeing 0;
_unitPilot = _grpPilot createUnit ["I_helipilot_F", getPos _supplyHeli, [], 0, "FORM"];
_unitPilot setSkill 1;
_unitPilot assignAsDriver _supplyHeli;
_unitPilot moveInDriver _supplyHeli;

//set waypoint for helicopter
private["_wpDestination"];
_wpDestination =_grpPilot addWaypoint [_pos, 0];
_wpDestination setWaypointType "MOVE";
_wpDestination setWaypointSpeed "FULL";
_wpDestination setWaypointBehaviour "CARELESS";
_wpDestination setWaypointCompletionRadius 60;

//Announce reinforcements are inbound to nearby players
private["_message"];
_message = "A Helicopter Carrying Reinforcements was Spotted Near You!";
["reinforcements",_message,_pos] call blck_fnc_messageplayers;

diag_log "reinforcements:: helispawned and inbound, message sent";

//Waits until heli gets near the position to drop crate, or if waypoint timeout has been triggered
_destinationDone = false;
_startTime = diag_tickTime;
_timoutTime = 600;

while {true} do {
	if ( (( (getPos _supplyHeli) distance2D _pos) < 100) || ((diag_tickTime - _startTime) > _timoutTime) ) exitWith {	};
	uiSleep 2;
	//diag_log format["reinforcements:: heli %1 is %2 from mission center",_supplyHeli,_pos distance (getPos _supplyHeli)];
};

if ( (diag_tickTime - _startTime) > _timoutTime) exitWith 
{
	// reinforcements took too long so lets delete them.
	deleteVehicle _supplyHeli;
	deleteVehicle _unitPilot;
	deleteGroup _grpPilot;
	diag_log "[blckeagls] Reinforcements failed to reach the mission site: heli and crew deleted";
};

diag_log "reinforcements:: heli on station";

private["_grpToops"];
_grpToops = grpNull;
_spawnTroops = if (_numAI > 0) then {true} else {false};
//  Spawn and paradrop troops
if (_spawnTroops) then
{
	_grpToops = [_pos,_supplyHeli,_numAI,_skillAI,_weapons,_uniforms,_headgear] spawn blck_spawnHeliParaTroops;
	diag_log format["reinforcements:: spawnHeliParaTroups returned variable %1 with type %2", _grpToops, typeName _grpToops];
};

_spawnCrate = if (random(1) < _chanceLoot) then {true} else {false};
if (_spawnCrate) then
{
	[_supplyHeli,_lootCounts,_skillAI] spawn blck_spawnHeliParaCrate;
};

_spawnPatrol = ( random(1) < _patrol);
if (_spawnPatrol) then
{
	[_pos,_skillAI, 120] spawn blck_spawnHeliPatrol;
};


diag_log "reinforcements:: send heli back to spawn";
// Send the heli back to base
private["_wpHome"];
_wpHome =_grpPilot addWaypoint [_spawnPos, 200];
_wpHome setWaypointType "MOVE";
_wpHome setWaypointSpeed "FULL";
_wpHome setWaypointBehaviour "CASUAL";
_wpHome setWaypointCompletionRadius 200;
_wpHome setWaypointName "GoHome";
_wpHome setWaypointStatements ["true", "{deleteVehicle _x} forEach units group this;deleteVehicle (vehicle this);diag_log ""helicopter and crew deleted"""];

diag_log "reinforcements:: sending Heli Home";
// End of sending heli home
////////////////////////

_fn_cleanupHeli = {

	params["_supplyHeli","_homePos","_grpPilot"];
	// run some tests to be sure everything went OK

	_heliHome = false;
	_startTime = diag_tickTime;

	while { !(_heliHome) } do
	{
		_heliHome = (_supplyHeli distance _homePos) < 300;
		if ( !_heliHome && ((diag_tickTime - _startTime) > 300) ) then
		{
			_heliHome = true;
			deleteVehicle _supplyHeli;
			{
				deleteVehicle _x;
			}forEach units _grpPilot;
			deleteGroup _grpPilot;
	};
	
	uiSleep 2;
	};
};

[_supplyHeli,_spawnPos,_grpPilot] spawn _fn_cleanupHeli;

diag_log "reinforcements:: script done";

// Return the group used for AI reinforcements for book keeping purposes in the Mission Spawner.
diag_log format["reinforcements::  typeName _grpToops = %1", typeName _grpToops];
_grpToops;
