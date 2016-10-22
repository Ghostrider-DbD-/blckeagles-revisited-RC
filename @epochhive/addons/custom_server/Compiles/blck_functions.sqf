/*
	AI Mission for Epoch Mod for Arma 3
	For the Mission System originally coded by blckeagls
	By Ghostrider
	Functions and global variables used by the mission system.
	Last modified 2/10/16
*/
blck_functionsCompiled = false;

// General functions
blck_fnc_waitTimer = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Functions\GMS_fnc_waitTimer.sqf";
blck_fnc_FindSafePosn = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Functions\GMS_fnc_findSafePosn.sqf"; 
blck_fnc_randomPosition = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Functions\GMS_fnc_randomPosn.sqf";// find a randomPosn. see script for details.
blck_fnc_findPositionsAlongARadius  = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Functions\GMS_fnc_findPositionsAlongARadius.sqf";
blck_fnc_giveTakeCrypto = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Functions\GMS_fnc_giveTakeCrypto.sqf";
// Player-related functions
blck_fnc_rewardKiller = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_rewardKiller.sqf";
blck_fnc_MessagePlayers = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Functions\GMS_fnc_AIM.sqf";  // Send messages to players regarding Missions
blck_getModType = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Functions\GMS_getModType.sqf";  // Send messages to players regarding Missions

// Mission-related functions
blck_fnc_missionTimer = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionTimer.sqf";
blck_fnc_playerInRange = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_playerInRange.sqf";
blck_fnc_spawnCrate = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_spawnCrate.sqf"; // Simply spawns a crate of a specified type at a specific position.
blck_fnc_spawnMissionCrates = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_spawnMissionCrates.sqf";  // Spawn loot crates at specific positions relative to the mission center; these will be filled with loot following the parameters in the composition array for the mission
blck_fnc_cleanupObjects = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_cleanUpObjects.sqf";
blck_fnc_spawnCompositionObjects = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\otl7_Mapper.sqf";
blck_fnc_spawnRandomLandscape = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_spawnRandomLandscape.sqf";
blck_fnc_fillBoxes = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_fillBoxes.sqf"; // Adds items to an object according to passed parameters. See the script for details.
blck_fnc_smokeAtCrates = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_smokeAtCrates.sqf"; // Spawns a wreck and adds smoke to it
blck_fnc_spawnMines = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_spawnMines.sqf";  // Deploys mines at random locations around the mission center
blck_fnc_clearMines = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_clearMines.sqf"; // clears mines in an array passed as a parameter
blck_fnc_signalEnd = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Missions\GMS_fnc_signalEnd.sqf"; // deploy smoke grenades at loot crates at the end of the mission.

// Group-related functions
blck_fnc_spawnGroup = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Groups\GMS_fnc_spawnGroup.sqf";  // Spawn a single group and populate it with AI units]
blck_fnc_setupWaypoints = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Groups\GMS_fnc_setWaypoints.sqf";  // Set default waypoints for a group
//blck_fnc_spawnGroups = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Groups\GMS_fnc_spawnGroups.sqf";  //  Call spawnGroup multiple times using specific parameters for group positioning
//blck_fnc_endCondition = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Groups\GMS_fnc_endCondition.sqf";  //GRMS_fnc_endCondition

// Functions specific to vehicles, whether wheeled or static
blck_fnc_spawnEmplacedWeapon = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Vehicles\GMS_fnc_spawnEmplaced.sqf";  // Self-evident
blck_fnc_spawnVehicle = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Vehicles\GMS_fnc_spawnVehicle.sqf";            //  Spawn a temporary vehicle of a specified type at a specific position
blck_fnc_spawnVehiclePatrol = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Vehicles\GMS_fnc_spawnVehiclePatrol.sqf";  // Spawn an AI vehicle control and have it patrol the mission perimeter
blck_fnc_vehicleMonitor = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Vehicles\GMS_fnc_vehicleMonitor.sqf";  // Process events wherein all AI in a vehicle are killed
//blck_fnc_spawnMissionVehicles = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Vehicles\GMS_fnc_spawnMissionVehicles.sqf";  // Spawn non-AI vehicles at missions; these will be filled with loot following the parameters in the composition array for the mission
blck_fnc_Reinforcements = compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Reinforcements\GMS_fnc_reinforcements.sqf"; 
blck_spawnHeliParaTroops  = compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Reinforcements\GMS_fnc_heliSpawnParatroops.sqf"; 
blck_spawnHeliParaCrate  = compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Reinforcements\GMS_fnc_heliSpawnCrate.sqf"; 
blck_spawnHeliPatrol = compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Reinforcements\GMS_fnc_heliSpawnPatrol.sqf"; 
blck_fnc_protectVehicle = compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Vehicles\GMS_fnc_protectVehicle.sqf";

// functions to support Units
blck_fnc_removeGear = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_removeGear.sqf"; // Strip an AI unit of all gear.
blck_fnc_spawnAI = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_spawnUnit.sqf"; // spawn individual AI
blck_EH_AIKilled = "\q\addons\custom_server\Compiles\Units\GMS_EH_AIKilled.sqf";  // Event handler to process AI deaths	
//blck_EH_AIHandleDamage = "\q\addons\custom_server\Compiles\Units\GMS_EH_AIHandleDamage.sqf"; //  GRMS_EH_AIHandleDamage
blck_fnc_processAIKill = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_processAIKill.sqf";
blck_fnc_removeLaunchers = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_removeLaunchers.sqf";
blck_fnc_removeNVG = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_removeNVG.sqf";
blck_fnc_alertNearbyUnits = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_alertNearbyUnits.sqf";
blck_fnc_processIlleagalAIKills = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_processIlleagalAIKills.sqf";
[] execVM "\q\addons\custom_server\Compiles\Units\GMS_fnc_cleanupDeadAI.sqf"; // handles deletion of AI bodies and gear when it is time.
blck_fnc_setSkill = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_setSkill.sqf";
blck_fnc_cleanupAliveAI = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Compiles\Units\GMS_fnc_cleanupAliveAI.sqf";


// Event handlers
"blck_PVS_aiKilled" addPublicVariableEventHandler  {
	diag_log format["blck_PVS_aiKilled handler:: unit = %1 and killer = %2 and this = #3",_this select 1 select 0,_this select 1 select 1, _this];
	[_this select 1 select 0,_this select 1 select 1] call blck_fnc_processAIKill;
};

"blck_PVS_aiVehicleEmpty" addPublicVariableEventHandler  {
	private ["_veh"];
	_veh = _this select 1;
	//diag_log format["blck_PVS_aiVehicleEmpty:: _this = %1 and _veh = %2",_this,0];

	if (typeOf _veh in blck_staticWeapons) then // always destroy mounted weapons
	{
		//diag_log format["vehicleMonitor.sqf: _veh %1 is (in blck_staticWeapons) = true",_veh];
		_veh removealleventhandlers "GetIn";
		_veh removealleventhandlers "GetOut";		
		_veh setDamage 1;
	} else {
		//diag_log format["vehicleMonitor.sqf: _veh %1 is (in blck_staticWeapons) = false",_veh];
		if (blck_killEmptyAIVehicles) then 
		{
				//diag_log format["vehicleMonitor.sqf: _veh %1 is about to be killed",_veh];
				_veh removealleventhandlers "GetIn";
				_veh removealleventhandlers "GetOut";
				_veh setVehicleLock "UNLOCKED" ;				
				uiSleep 1;
				_veh setDamage 1.1;
				uiSleep 15;
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
};


diag_log "[blckeagls] Functions Loaded";
blck_functionsCompiled = true;
