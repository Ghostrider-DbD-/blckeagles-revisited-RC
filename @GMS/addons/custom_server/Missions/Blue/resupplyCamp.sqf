/*
	Mission Template by Ghostrider [GRG]
	Mission Compositions by Bill prepared for ghostridergaming
	Copyright 2016
	Last modified 3/20/17
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#include "\q\addons\custom_server\Missions\privateVars.sqf";
	
//diag_log "[blckeagls] Spawning Blue Mission with template = resupplyCamp";
_crateLoot = blck_BoxLoot_Blue;
_lootCounts = blck_lootCountsBlue;
_startMsg = "A Bandit resupply camp has been spotted. Check the Blue marker on your map for its location";
_endMsg = "The Bandit resupply camp at the Blue Marker is under player control";
_markerLabel = "";
_markerType = ["ellipse",[175,175],"GRID"];
_markerColor = "ColorBlue";
_markerMissionName = "Resupply Camp";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
		["Land_Cargo_Patrol_V1_F",[-29.41016,0.13477,-0.0224228],359.992,[true,true]], 
		["Land_Cargo_House_V1_F",[29.2988,-0.1,0.150505],54.9965,[true,true]], 
		["CamoNet_INDP_big_F",[-20.4346,15.43164,-0.00395203],54.9965,[false,true]], 
		["Land_BagBunker_Small_F",[-20.4346,15.43164,-0.0138168],119.996,[false,true]], 
		["Land_BagBunker_Small_F",[-20.3604,-15.6035,-0.0130463],44.9901,[false,true]], 
		["Land_BagBunker_Small_F",[18.4453,-15.791,0.00744629],305.003,[false,true]], 
		["Land_BagBunker_Small_F",[18.3711,15.5703,0.0101624],254.999,[false,true]],
		["CamoNet_INDP_big_F",[18.3711,15.5703,-0.00395203],54.9965,[false,true]]
		]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Blue;
_maxNoAI = blck_MaxAI_Blue;
_noAIGroups = blck_AIGrps_Blue;
_noVehiclePatrols = blck_SpawnVeh_Blue;
_noEmplacedWeapons = blck_SpawnEmplaced_Blue;
//_uniforms = blck_SkinList;  // Setting this in the mission file overrides the defaults 
//_headgear = blck_headgear;  // Setting this in the mission file overrides the defaults 
//_vests = blck_vests;
//_backpacks = blck_backpacks;
//_weaponList = ["blue"] call blck_fnc_selectAILoadout;
//_sideArms = blck_Pistols;
//_chanceHeliPatrol = blck_chanceHeliPatrolBlue;  // Setting this in the mission file overrides the defaults 
//_noChoppers = blck_noPatrolHelisBlue;
//_missionHelis = blck_patrolHelisBlue;

//_chancePara = blck_chanceParaBlue; // Setting this in the mission file overrides the defaults 
//_noPara = blck_noParaBlue;  // Setting this in the mission file overrides the defaults 
//_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
//_paraSkill = "red";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.
//_chanceLoot = 0.0; 
//_paraLoot = blck_BoxLoot_Blue;
//_paraLootCounts = blck_lootCountsRed;  // Throw in something more exotic than found at a normal blue mission.

//_spawnCratesTiming = blck_spawnCratesTiming; // Choices: "atMissionSpawnGround","atMissionEndGround","atMissionEndAir". 
						 // Crates spawned in the air will be spawned at mission center or the position(s) defined in the mission file and dropped under a parachute.
						 //  This sets the default value but can be overridden by defining  _spawnCrateTiming in the file defining a particular mission.
//_loadCratesTiming = blck_loadCratesTiming; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
						// Pertains only to crates spawned at mission spawn.
						// This sets the default but can be overridden for specific missions by defining _loadCratesTiming
						
						// Examples:
						// To spawn crates at mission start loaded with gear set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionSpawn"
						// To spawn crates at mission start but load gear only after the mission is completed set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionCompletion"
						// To spawn crates on the ground at mission completion set blck_spawnCratesTiming = "atMissionEndGround" // Note that a loaded crate will be spawned.
						// To spawn crates in the air and drop them by chutes set blck_spawnCratesTiming = "atMissionEndAir" // Note that a loaded crate will be spawned.
_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
									// Setting this in the mission file overrides the defaults 

//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
