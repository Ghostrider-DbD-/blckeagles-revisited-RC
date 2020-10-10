/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

	#include "\q\addons\custom_server\Configs\blck_defines.hpp"
	#include "\q\addons\custom_server\init\build.sqf"
	/*
		changing any of these variables may break the mission system
	*/
	blck_locationBlackList = [];  // Do not touch ...
	blck_debugON = false;  //  should be set to false;  ... 
	blck_debugLevel = 0;  //  should be set to 0 ... 
	#ifdef blck_milServer
	if (true) exitWith 
	{
		[format["Running configs for militarized servers build %1",blck_buildNumber]] call blck_fnc_log;
		execVM "\q\addons\custom_server\Configs\blck_configs_mil.sqf";
	};
	#endif
	[format["Loading configurations for Non-militarized servers build %1",blck_buildNumber]] call blck_fnc_log;
	/*
		**************************************
		Configurations begin here
		**************************************
	*/
	/***************************************************************
		BLCKEAGLS SUPPLEMENTAL MODULES
	****************************************************************	
		Configuration for Addons that support the overall Mission system.
		These are:
		1) a module to spawn map  addons generated with the Eden Editor
		2) And a moduel to spawn static loot crates at specific location
		3) A time acceleration module.
	*/

	blck_spawnMapAddons = false;  // When true map addons will be spawned based on parameters  define in custum_server\MapAddons\MapAddons_init.sqf
	blck_spawnStaticLootCrates = false; // When true, static loot crates will be spawned and loaded with loot as specified in custom_server\SLS\SLS_init_Epoch.sqf (or its exile equivalent).
	blck_simulationManager = blck_useBlckeaglsSimulationManager; 
	blck_hideRocksAndPlants = true; //  When true, any rocks, trees or bushes under enterable buildings will be 'hidden'

	/*
		blck_simulationManagementOff  - no simulation management occurs
		blck_useBlckeaglsSimulationManager - simulation is enabled/disabled by periodic checks for nearby players; a 'wake' function is included when a units simulation is turned on
		blck_useDynamicSimulationManagement 2 - arma dynamic simulation is used
	*/

	// Note that you can define map-specific variants in custom_server\configs\blck_custom_config.sqf
	blck_useTimeAcceleration = false; // When true, time acceleration will be periodically updated based on amount of daylight at that time according to the values below.
	blck_timeAccelerationDay = 2;  // Daytime time accelearation
	blck_timeAccelerationDusk = 4; // Dawn/dusk time accelearation
	blck_timeAccelerationNight = 12;  // Nighttim time acceleration	
	
	/**************************************************************
	
	BLACKLIST LOCATIONS
	
	**************************************************************/
	// if true then missions will not spawn within 1000 m of spawn points for Altis, Bornholm, Cherno, Esseker or stratis. 
	blck_blacklistTraderCities = true;  // Set this = true if you would like the mission system to automatically search for the locations of the Epoch/Exile trader cities. Note that these are added to the list of blacklisted locations for Epoch for the most common maps.
	
	/***********************************************************
	
	GENERAL MISSION SYSTEM CONFIGURATION
	
	***********************************************************/
	////////
	//  Client Offloading and Headless Client Configurations
	blck_useHC = true; // Experimental (should be working).
										//  Credit to Defent and eraser for their excellent work on scripts to transfer AI to clients for which these settings are required.
	blck_ai_offload_to_client = false; // forces AI to be transfered to player's PCs.  Disable if you have players running slow PCs.
										// *******************************************************
										//  Experimental; may cause issues with waypoints 
										// *******************************************************
	blck_ai_offload_notifyClient = true;  // Set true if you want notifications when AI are offloaded to a client PC. Only for testing/debugging purposes.
	blck_limit_ai_offload_to_blckeagls = true;  // when true, only groups spawned by blckeagls are evaluated. (Recommended)
	blck_allow_hunting_behaviors = true;  // Not used yet
	
	///////////////////////////////
	//  Kill message configurations
	// These determine whether and when messages are sent to players regarding AI Kills or illegal kills that might damage a vehicle.
	blck_useKillMessages = true;  // when true a message will be broadcast to all players each time an AI is killed; may impact server performance.
	blck_useKillScoreMessage = true; // when true a tile is displayed to the killer with the kill score information
	blck_useIEDMessages = true;  // Displayes a message when a player vehicle detonates and IED (such as would happen if a player killed AI with a forbidden weapon).
	
	///////////////////////////////
	// MISSION MARKER CONFIGURATION
	// blck_labelMapMarkers: Determines if when the mission composition provides text labels, map markers with have a text label indicating the mission type
	//When set to true,"arrow", text will be to the right of an arrow below the mission marker. 
	// When set to true,"dot", ext will be to the right of a black dot at the center the mission marker. 
	blck_labelMapMarkers = [true,"center"];  
	blck_preciseMapMarkers = true;  // Map markers are/are not centered at the loot crate
	blck_showCountAliveAI = true;

	//Minimum distance between missions
	blck_MinDistanceFromMission = 2000;
	blck_minDistanceToBases = 800;
	blck_minDistanceToPlayer = 800;
	blck_minDistanceFromTowns = 400;
	blck_minDistanceFromDMS = 800;  // minimum distance for a blackeagls mission from any nearby DMS missions. set to -1 to disable this check.	
	
	///////////////////////////////
	// Mission Smoke and Signals
	///////////////////////////////
	
	// global loot crate options
	// Options to spawn a smoking wreck near the crate.  When the first parameter is true, a wreck or junk pile will be spawned. 
	// It's position can be either "center" or "random".  smoking wreck will be spawned at a random location between 15 and 50 m from the mission.
	blck_SmokeAtMissions = [true,"random"];  // set to [false,"anything here"] to disable this function altogether. 
	blck_useSignalEnd = true; // When true a smoke grenade/chemlight will appear at the loot crate for 2 min after mission completion.
	blck_missionEndCondition = "allKilledOrPlayerNear"; // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"

	///////////////////////////////
	// General Mission Completion and Loot Settings
	///////////////////////////////	
	blck_killPercentage = 0.999999;  // The mission will complete if this fraction of the total AI spawned has been killed.
								// This facilitates mission completion when one or two AI are spawned into objects.	
	blck_spawnCratesTiming = "atMissionSpawnGround"; // Choices: "atMissionSpawnGround","atMissionSpawnAir","atMissionEndGround","atMissionEndAir".
							 // Crates spawned in the air will be spawned at mission center or the position(s) defined in the mission file and dropped under a parachute.
							 //  This sets the default value but can be overridden by defining  _spawnCrateTiming in the file defining a particular mission.
	blck_loadCratesTiming = "atMissionSpawn"; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
							// Pertains only to crates spawned at mission spawn.
							// This sets the default but can be overridden for specific missions by defining _loadCratesTiming
							
							// Examples:
							// To spawn crates at mission start loaded with gear set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionSpawn"
							// To spawn crates at mission start but load gear only after the mission is completed set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionCompletion"
							// To spawn crates on the ground at mission completion set blck_spawnCratesTiming = "atMissionEndGround" // Note that a loaded crate will be spawned.
							// To spawn crates in the air and drop them by chutes set blck_spawnCratesTiming = "atMissionEndAir" // Note that a loaded crate will be spawned.
	blck_allowClaimVehicle = true; // Set this to true if you wish to allow players to claim vehicles using one of the claim vehicle scripts floating around.

	///////////////////////////////
	// PLAYER PENALTIES
	///////////////////////////////	

	blck_RunGear = true;	// When set to true, AI that have been run over will ve stripped of gear, and the vehicle will be given blck_RunGearDamage of damage.
	blck_RunGearDamage = 0.2; // Damage applied to player vehicle for each AI run over
	blck_VK_Gear = true; // When set to true, AI that have been killed by a player in a vehicle in the list of forbidden vehicles or using a forbiden gun will be stripped of gear and the vehicle will be given blck_RunGearDamage of damage
	blck_VK_RunoverDamage = true; // when the AI was run over blck_RunGearDamage of damage will be applied to the killer's vehicle.
	blck_VK_GunnerDamage = false; // when the AI was killed by a gunner on a vehicle that is is in the list of forbidden vehicles, blck_RunGearDamage of damage will be applied to the killer's vehicle each time an AI is killed with a vehicle's gun.
	blck_forbidenVehicles = [];  // Examples include ["B_MRAP_01_hmg_F","O_MRAP_02_hmg_F","I_MRAP_03_hmg_F","B_MRAP_01_hmg_F","O_MRAP_02_hmg_F"]; // Add any vehicles for which you wish to forbid vehicle kills	
	// For a listing of the guns mounted on various land vehicles see the following link: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Vehicle_Weapons
	// HMG_M2 is mounted on the armed offroad that is spawned by Epoch	
	blck_forbidenVehicleGuns = []; // examples include["LMG_RCWS","LMG_M200","HMG_127","HMG_127_APC","HMG_M2","HMG_NSVT","GMG_40mm","GMG_UGV_40mm","autocannon_40mm_CTWS","autocannon_30mm_CTWS","autocannon_35mm","LMG_coax","autocannon_30mm","HMG_127_LSV_01"]; // Add any vehicles for which you wish to forbid vehicle kills, o
	

	///////////////////////////////
	// MISC MISSION PARAMETERS
	///////////////////////////////
	blck_useKilledAIName = true; // When false, the name of the killer (player), weapon and distance are displayed; otherwise the name of the player, distance and name of AI unit killed are shown.
	blck_useMines = false;   // when true mines are spawned around the mission area. these are cleaned up when a player reaches the crate. Turn this off if you have vehicle patrols.
	blck_cleanupCompositionTimer = 60*30;  // Mission objects will be deleted after the mission is completed after a deley set by this timer.
	blck_cleanUpLootChests = false; // when true, loot crates will be deleted together with other mission objects.
	blck_MissionTimeout = 60*60;  // 60 min - missions will timeout and respawn in another location. This prevents missions in impossible locations from persisting.

	///////////////////////////////
	// Paratroop Settings
	// AI paratrooper reinforcement paramters
	// The behavior of these can be linked to some degree to the spawning of patrolling helis.
	// For example, if you always want a helicopter to spawn paratroops set the value 1.
	// Recommended that you disable paratroops if using muliple aircraft/vehicle patrols
	blck_chanceParaBlue = 0; // [0 - 1] set to 0 to deactivate and 1 to always have paratroops spawn over the center of the mission. This value can be a range as well [0.1,0.3]
	blck_noParaBlue = 3; //  [1-N]
	
	blck_chanceParaRed = 0;
	blck_noParaRed = 3;
	
	blck_chanceParaGreen = 0;
	blck_noParaGreen = 4;
	
	blck_chanceParaOrange = 0;
	blck_noParaOrange = 4;
	
	// Supplemental Loot Parameters.
	
	///////////////////////////////
	//  Heli Patrol Heli Types	
	// Armed Helis
	//////////////////////////////
	_blck_littleBirds = ["B_Heli_Light_01_armed_F"];  //  AH-9 Pawnee  (WEST)
	_blck_armed_hellcats = ["I_Heli_light_03_F"];
	_blck_armed_orcas = ["O_Heli_Light_02_F","O_Heli_Light_02_v2_F"];
	_blck_armed_ghosthawks = ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"];
	_blck_armed_hurons = ["B_Heli_Transport_03_F","B_Heli_Transport_03_black_F"];
	_blck_armed_attackHelis = ["B_Heli_Attack_01_F"];
	_blck_armed_heavyAttackHelis = ["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F"];
	_blck_fighters = [
		"O_Plane_CAS_02_F",  // /ti-199 Neophron (CAS)
		"I_Plane_Fighter_03_AA_F",  //  A-143 Buzzard (AA)
		"I_Plane_Fighter_04_F",  //   	A-149 Gryphon
		"B_Plane_CAS_01_F",  // 	A-164 Wipeout (CAS)
		"B_Plane_Fighter_01_F"  //	F/A-181 Black Wasp II
		];
	blck_blacklisted_heli_ammo = ["24Rnd_missiles","24Rnd_PG_missiles","12Rnd_PG_missiles","2Rnd_LG_scalpel","6Rnd_LG_scalpel","8Rnd_LG_scalpel","M_Scalpel_AT ","14Rnd_80mm_rockets","38Rnd_80mm_rockets"];
	blck_blacklisted_heli_weapons = ["missiles_SCALPEL","missiles_titan","rockets_Skyfire","missiles_DAGR","missiles_DAR"];
	
	
	///////////////////////////////
	//  Heli Patrol Settings
	///////////////////////////////

	blck_chanceHeliPatrolBlue = 0;  //[0 - 1]  Set to 0 to deactivate and 1 to always have a heli spawn over the mission center and patrol the mission area. 
									//  The chance of paratroops dropping from the heli is defined by blck_chancePara(Blue|Red|Green|Orange) above.
									// Recommend setting the change = 1 if you wish to spawn multiple helis at a mission.
	blck_patrolHelisBlue = _blck_littleBirds;
	blck_noPatrolHelisBlue = 1;
	
	blck_chanceHeliPatrolRed = 0.1; // 0.4;
	blck_patrolHelisRed = _blck_littleBirds;
	blck_noPatrolHelisRed = 1;
	
	blck_chanceHeliPatrolGreen = 0.4;
	blck_patrolHelisGreen = _blck_littleBirds;
	blck_noPatrolHelisGreen = 1;
	
	blck_chanceHeliPatrolOrange = 0.5;
	blck_patrolHelisOrange = _blck_armed_hellcats+_blck_armed_orcas;
	blck_noPatrolHelisOrange = 1;

	////////////////////
	// Enable / Disable Missions
	////////////////////
	

	//Set to -1 to disable. Values of 2 or more force the mission spawner to spawn copies of that mission - this feature is not recommended because you may run out of available groups.
	blck_enableOrangeMissions = 1;  
	blck_enableGreenMissions = 2;
	blck_enableRedMissions = 2;
	blck_enableBlueMissions = 2;
	blck_numberUnderwaterDynamicMissions = 3;  // Values from -1 (no UMS) to N (N Underwater missions will be spawned; static UMS units and subs will be spawned.	

	////////////////////
	// MISSION TIMERS
	////////////////////
	

	// Change this value to reduce the number of spawned missions at any one time.
	blck_maxSpawnedMissions = 15;
		
	// Reduce to 1 sec for immediate spawns, or longer if you wish to space the missions out	
	blck_TMin_Orange = 480;
	blck_TMin_Green = 420;
	blck_TMin_Blue = 300;
	blck_TMin_Red = 360;
	blck_TMin_UMS = 300;	
	

	//Maximum Spawn time between missions in seconds
	blck_TMax_Orange = 560;
	blck_TMax_Green = 500;
	blck_TMax_Blue = 360;
	blck_TMax_Red = 420;
	blck_TMax_UMS = 400;


	///////////////////////////////
	// AI VEHICLE PATROL PARAMETERS
	///////////////////////////////	

	blck_useVehiclePatrols = true; // When true vehicles will be spawned at missions and will patrol the mission area.
	blck_killEmptyAIVehicles = false; // when true, the AI vehicle will be extensively damaged once all AI have gotten outor been killed.
    blck_vehicleDeleteTimer = 120*60;
	////////////////////
	// Mission Vehicle Settings
	////////////////////	
	//Defines how many AI Vehicles to spawn. Set this to -1 to disable spawning of static weapons or vehicles. To discourage players runniing with with vehicles, spawn more B_GMG_01_high
	blck_SpawnVeh_Orange = [3,4]; // Number of static weapons at Orange Missions
	blck_SpawnVeh_Green = [2,3]; // Number of static weapons at Green Missions
	blck_SpawnVeh_Blue = 1;  // Number of static weapons at Blue Missions
	blck_SpawnVeh_Red = 1;  // Number of static weapons at Red Missions

	blck_vehCrew_blue = 3;
	blck_vehCrew_red = 3;
	blck_vehCrew_green = 3;
	blck_vehCrew_orange = 3;

	///////////////////////////////
	// AI STATIC WEAPON PARAMETERS	
	///////////////////////////////
	
	blck_useStatic = true;  // When true, AI will man static weapons spawned 20-30 meters from the mission center. These are very effective against most vehicles
	blck_killEmptyStaticWeapons = true;  // When true, static weapons will have damage set to 1 when the AI manning them is killed.
	blck_staticWeapons = ["B_HMG_01_high_F","B_GMG_01_high_F"/*,"O_static_AT_F"*/];  // [0.50 cal, grenade launcher, AT Launcher]

	////////////////////
	// Mission Static Weapon Settings
	////////////////////
	
	// Defines how many static weapons to spawn. Set this to -1 to disable spawning 
	blck_SpawnEmplaced_Orange = [3,4]; // Number of static weapons at Orange Missions
	blck_SpawnEmplaced_Green = [2,3]; // Number of static weapons at Green Missions
	blck_SpawnEmplaced_Blue = 1;  // Number of static weapons at Blue Missions
	blck_SpawnEmplaced_Red = 1;  // Number of static weapons at Red Missions	



	/****************************************************************
	
	GENERAL AI SETTINGS
	
	****************************************************************/
	// When true, AI loadouts will be set from the class names in CfgPricing rather than the settings in the mod-specific configuration files
	blck_useConfigsGeneratedLoadouts = false;
	blck_logBlacklistedItems = true;
	//blck_maximumitempriceinai_loadouts = 1000;
	// lists of black-listed items to be excluded from dynamic loadouts
		blck_blacklistedVests = [
			//"V_Press_F"
		];

		blck_blacklistedUniforms = [
			"U_I_Protagonist_VR",
			"U_C_Protagonist_VR",			
			"U_O_Protagonist_VR",
			"U_B_Protagonist_VR",
			"Exile_Uniform_BambiOverall",
			"Exile_Uniform_ExileCustoms"
		];

		blck_blacklistedBackpacks = [
			//"B_ViperLightHarness_blk_F"
		];

		blck_blacklistedHeadgear = [
			"H_HelmotO_ViperSP_ghex_F",
			"H_HelmetO_VierSP_hex"
		];

		blck_blacklistedPrimaryWeapons = [
			//"srifle_LRR_tna_F"
		];

		blck_blacklistedSecondaryWeapons = [
			"hgun_Pistol_heav_02_F"
		];

		blck_blacklistedLaunchersAndSwingWeapons = [

		];

		blck_blacklistedOptics = [
			//"optic_tws"
		];

		blck_blacklistedAttachments = [

		];

		blck_blacklistedItems = [

		];	
	/////////////////////////////////////////////
	
	blck_groupBehavior = "SAFE";  // https://community.bistudio.com/wiki/ArmA:_AI_Combat_Modes
	blck_combatMode = "RED"; // Change this to "YELLOW" if the AI wander too far from missions for your tastes.
	blck_groupFormation = "WEDGE"; // Possibilities include "WEDGE","VEE","FILE","DIAMOND"

	blck_useSmokeWhenHealing = true;  // when true, injured AI will toss a smoke when they attempt to heal.
	blck_addAIMoney = true;
	blck_chanceBackpack = 0.3;  // Chance AI will be spawned with a backpack
	blck_useNVG = true; // When true, AI will be spawned with NVG if is dark
	blck_removeNVG = false; // When true, NVG will be removed from AI when they are killed.
	blck_useLaunchers = true;  // When true, some AI will be spawned with RPGs; they do not however fire on vehicles for some reason so I recommend this be set to false for now
	//blck_launcherTypes = ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F"];
	blck_launcherTypes = ["launch_RPG32_F"];
	blck_launchersPerGroup = 1;  // Defines the number of AI per group spawned with a launcher
	blck_launcherCleanup = true;// When true, launchers and launcher ammo are removed from dead AI.
	blck_minimumPatrolRadius = 22;  // AI will patrol within a circle with radius of approximately min-max meters. note that because of the way waypoints are completed they may more more or less than this distance.
	blck_maximumPatrolRadius = 45;
	
	//This defines how long after an AI dies that it's body disappears.
	blck_bodyCleanUpTimer = 60*45; // time in seconds after which dead AI bodies are deleted
	// Each time an AI is killed, the location of the killer will be revealed to all AI within this range of the killed AI, set to -1 to disable
	// values are ordered as follows [blue, red, green, orange];
	blck_AliveAICleanUpTimer = 60*15;  // Time after mission completion at which any remaining live AI are deleted.

	// How precisely player locations will be revealed to AI after an AI kill
	// values are ordered as follows [blue, red, green, orange];	
	blck_AIAlertDistance = [250,325,450,500];  //  Radius within which AI will be notified of enemy activity. Depricated as a group-sed system is used now. The group is informed of the enemy location when a group member is hit or killed.
	//blck_AIAlertDistance = [150,225,400,500];
	// How precisely player locations will be revealed to AI after an AI kill
	// values are ordered as follows [blue, red, green, orange];
	blck_AIIntelligence = [0.1, 0.2, 0.3, 0.4];  
	
	blck_baseSkill = 1.0;  // The overal skill of the AI - range 0.1 to 1.0.
	
	/***************************************************************
	
	MISSION TYPE SPECIFIC AI SETTINGS
	
	**************************************************************/
	//This defines the skill, minimum/Maximum number of AI and how many AI groups are spawned for each mission type
	// See the links below for information on how these affect the AI behavior and performance.
	// https://community.bistudio.com/wiki/Arma_3_AI_Skill 
	// https://community.bistudio.com/wiki/setSkill
	// Orange Missions
	blck_MinAI_Orange = 20;
	blck_MaxAI_Orange = 25;
	blck_AIGrps_Orange = 5;
	blck_SkillsOrange = [
		["aimingAccuracy",[0.35,0.45]],["aimingShake",[0.65,0.75]],["aimingSpeed",[0.65,0.75]],["endurance",1.00],["spotDistance",1.0],["spotTime",1.0],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]
	];
	
	// Green Missions
	blck_MinAI_Green = 16;
	blck_MaxAI_Green = 21;
	blck_AIGrps_Green = 4;
	blck_SkillsGreen = [
		["aimingAccuracy",0.3],["aimingShake",0.65],["aimingSpeed",0.65],["endurance",0.9],["spotDistance",0.9],["spotTime",0.9],["courage",0.9],["reloadSpeed",0.9],["commanding",0.9],["general",0.75]
	];
	
	// Red Missions
	blck_MinAI_Red = 12;
	blck_MaxAI_Red = 15;
	blck_AIGrps_Red = 3;
	blck_SkillsRed = [
		["aimingAccuracy",0.2],["aimingShake",0.6],["aimingSpeed",0.6],["endurance",0.80],["spotDistance",0.7],["spotTime",0.8],["courage",0.80],["reloadSpeed",0.70],["commanding",0.8],["general",0.70]
	];
	
	// Blue Missions
	blck_MinAI_Blue = 8;	
	blck_MaxAI_Blue = 12;
	blck_AIGrps_Blue = 2;
	blck_SkillsBlue = [
		["aimingAccuracy",0.1],["aimingShake",0.5],["aimingSpeed",0.5],["endurance",0.50],["spotDistance",0.6],["spotTime",0.6],["courage",0.60],["reloadSpeed",0.60],["commanding",0.7],["general",0.60]
	];
		
	// Add some money to AI;  
	blck_maxMoneyOrange = 25;
	blck_maxMoneyGreen = 20;
	blck_maxMoneyRed = 15;
	blck_maxMoneyBlue = 10;

	#ifdef GRGserver
	blck_AIAlertDistance = [250,450,650,800];  //  Radius within which AI will be notified of enemy activity. Depricated as a group-sed system is used now. The group is informed of the enemy location when a group member is hit or killed.
	//blck_AIAlertDistance = [150,225,400,500];
	// How precisely player locations will be revealed to AI after an AI kill
	// values are ordered as follows [blue, red, green, orange];
	blck_AIIntelligence = [0.3, 0.5, 0.7, 0.9];  
	
	blck_baseSkill = 0.7;  // The overal skill of the AI - range 0.1 to 1.0.
	
	/***************************************************************
	
	MISSION TYPE SPECIFIC AI SETTINGS
	
	**************************************************************/
	//This defines the skill, minimum/Maximum number of AI and how many AI groups are spawned for each mission type
	// Orange Missions
	blck_MinAI_Orange = 20;
	blck_MaxAI_Orange = 25;
	blck_AIGrps_Orange = 5;
	blck_SkillsOrange = [
		["aimingAccuracy",[0.25,0.36]],["aimingShake",[0.45,0.55]],["aimingSpeed",[0.65,0.75]],["endurance",1.00],["spotDistance",1.0],["spotTime",0.7],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]
	];
	
	// Green Missions
	blck_MinAI_Green = 16;
	blck_MaxAI_Green = 21;
	blck_AIGrps_Green = 4;
	blck_SkillsGreen = [
		["aimingAccuracy",[0.2,0.3]],["aimingShake",[0.4,0.5]],["aimingSpeed",[0.55,0.7]],["endurance",0.9],["spotDistance",0.9],["spotTime",0.65],["courage",0.9],["reloadSpeed",0.9],["commanding",0.9],["general",0.75]
	];
	
	// Red Missions
	blck_MinAI_Red = 12;
	blck_MaxAI_Red = 15;
	blck_AIGrps_Red = 3;
	blck_SkillsRed = [
		["aimingAccuracy",[0.2,0.25]],["aimingShake",[0.35,0.4]],["aimingSpeed",0.6],["endurance",0.80],["spotDistance",0.7],["spotTime",0.6],["courage",0.80],["reloadSpeed",0.70],["commanding",0.8],["general",0.70]
	];
	
	// Blue Missions
	blck_MinAI_Blue = 8;	
	blck_MaxAI_Blue = 12;
	blck_AIGrps_Blue = 2;
	blck_SkillsBlue = [
		["aimingAccuracy",[0.08,16]],["aimingShake",[0.25,0.35]],["aimingSpeed",0.5],["endurance",0.50],["spotDistance",0.6],["spotTime",0.6],["courage",0.60],["reloadSpeed",0.60],["commanding",0.7],["general",0.60]
	];
		
	// Add some money to AI; 
	blck_maxMoneyOrange = 25;
	blck_maxMoneyGreen = 20;
	blck_maxMoneyRed = 15;
	blck_maxMoneyBlue = 10;	
	#endif
	
	if (toLower(blck_modType) isEqualTo "epoch") then
	{
		execVM "\q\addons\custom_server\Configs\blck_configs_epoch.sqf";
	};
	if (toLower(blck_modType)  isEqualTo "exile") then
	{
		execVM "\q\addons\custom_server\Configs\blck_configs_exile.sqf";
	};	
	if (toLower(blck_modType) isEqualTo "default") then 
	{
		execVM "\q\addons\custom_server\Configs\blck_configs_default.sqf";		
	};
	uiSleep 10;
	if (blck_useConfigsGeneratedLoadouts) then
	{
		["Dynamic Configs Enabled"] call blck_fnc_log;
		execVM "\q\addons\custom_server\Configs\blck_dynamicConfigs.sqf";
	} else {

	};

	blck_configsLoaded = true;
	//diag_log format["<--- blck_configs loaded at %1 --->",diag_tickTime];
