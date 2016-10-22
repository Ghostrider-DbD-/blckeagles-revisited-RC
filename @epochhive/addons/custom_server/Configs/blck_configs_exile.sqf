/*
AI Mission Compiled by blckeagls @ Zombieville.net
Further modified by Ghostrider - 
This file contains most constants that define mission parameters, AI behavior and loot for mission system.
Last modified 8/1/15
*/
	
	blck_configsLoaded = false;
	/**************************************************************
	
	BLACKLIST LOCATIONS
	
	**************************************************************/
	// if true then missions will not spawn within 1000 m of spawn points for Altis, Bornholm, Cherno, Esseker or stratis. 
	blck_blacklistSpawns = true;
	// list of locations that are protected against mission spawns	
	blck_locationBlackList = [
	//Add location as [xpos,ypos,0],minimumDistance],
	// Note that there should not be a comma after the last item in this table
		[[0,0,0],0]
	];
	
	/***********************************************************
	
	GENERAL MISSION SYSTEM CONFIGURATION
	
	***********************************************************/
	
	// MISSION MARKER CONFIGURATION
	// blck_labelMapMarkers: Determines if when the mission composition provides text labels, map markers with have a text label indicating the mission type
	//When set to true,"arrow", text will be to the right of an arrow below the mission marker. 
	// When set to true,"dot", ext will be to the right of a black dot at the center the mission marker. 
	blck_labelMapMarkers = [true,"center"];  
	blck_preciseMapMarkers = true;  // Map markers are/are not centered at the loot crate
	
	// Options to spawn a smoking wreck near the mission.  When the first parameter is true, a wreck or junk pile will be spawned. 
	// It's position can be either "center" or "random".  smoking wreck will be spawned at a random location between 15 and 50 m from the mission.
	blck_SmokeAtMissions = [false,"random"];  // set to [false,"anything here"] to disable this function altogether. 
	blck_useSignalEnd = true; // When true a smoke grenade will appear at the loot crate for 2 min after mission completion.
	
	// Loot Crates
	//blck_missionCrateTypes = ["Box_NATO_Wps_F","Box_FIA_Ammo_F","Box_FIA_Support_F","Box_FIA_Wps_F","I_SupplyCrate_F","Box_IND_AmmoVeh_F","Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F"];
	
	// PLAYER PENALTIES
	blck_RunGear = true;	// When set to true, AI that have been run over will ve stripped of gear, and the vehicle will be given blck_RunGearDamage of damage.
	blck_RunGearDamage = 0.2; // Damage applied to player vehicle for each AI run over
	blck_VK_Gear = true; // When set to true, AI that have been killed by a player in a vehicle in the list of forbidden vehicles or using a forbiden gun will be stripped of gear and the vehicle will be given blck_RunGearDamage of damage
	blck_VK_RunoverDamage = true; // when the AI was run over blck_RunGearDamage of damage will be applied to the killer's vehicle.
	blck_VK_GunnerDamage = true; // when the AI was killed by a gunner on a vehicle that is is in the list of forbidden vehicles, blck_RunGearDamage of damage will be applied to the killer's vehicle each time an AI is killed with a vehicle's gun.
	blck_forbidenVehicles = ["B_MRAP_01_hmg_F","O_MRAP_02_hmg_F","Exile_Car_BRDM2_HQ","Exile_Car_HMMWV_M134_Green","Exile_Car_HMMWV_M134_Desert","Exile_Car_HMMWV_M2_Green","Exile_Car_HMMWV_M2_Desert","Exile_Car_ProwlerLight","Exile_Car_BTR40_MG_Green","Exile_Car_BTR40_MG_Camo"]; // Add any vehicles for which you wish to forbid vehicle kills	
	// For a listing of the guns mounted on various land vehicles see the following link: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Vehicle_Weapons
	blck_forbidenVehicleGuns = ["LMG_RCWS","LMG_M200","HMG_127","HMG_127_APC","HMG_M2","HMG_NSVT","GMG_40mm","GMG_UGV_40mm","autocannon_40mm_CTWS","autocannon_30mm_CTWS","autocannon_35mm","LMG_coax","autocannon_30mm","DShKM","DSHKM","HMG_127_LSV_01"];  // Add any vehicles for which you wish to forbid vehicle kills, o
	
	// GLOBAL MISSION PARAMETERS
	blck_useMines = false;   // when true mines are spawned around the mission area. these are cleaned up when a player reaches the crate.
	blck_useVehiclePatrols = true; // When true vehicles will be spawned at missions and will patrol the mission area.
	blck_killEmptyAIVehicles = false; // when true, the AI vehicle will be extensively damaged once all AI have gotten out.
	blck_AIPatrolVehicles = ["Exile_Car_Offroad_Armed_Guerilla01","Exile_Car_Offroad_Armed_Guerilla02","Exile_Car_HMMWV_M2_Green","Exile_Car_HMMWV_M2_Desert","Exile_Car_BTR40_MG_Green","Exile_Car_BTR40_MG_Camo"]; // Type of vehicle spawned to defend AI bases

	//Set to -1 to disable. Values of 2 or more force the mission spawner to spawn copies of that mission.
	blck_enableOrangeMissions = 1;  
	blck_enableGreenMissions = 1;
	blck_enableRedMissions = 1;
	blck_enableBlueMissions = -1;
	blck_enableHunterMissions = 2;
	blck_enableScoutsMissions = 2;

	// AI VEHICLE PATROL PARAMETERS
	//Defines how many AI Vehicles to spawn. Set this to -1 to disable spawning of static weapons or vehicles. To discourage players runniing with with vehicles, spawn more B_GMG_01_high
	blck_SpawnVeh_Orange = 4; // Number of static weapons at Orange Missions
	blck_SpawnVeh_Green = 3; // Number of static weapons at Green Missions
	blck_SpawnVeh_Blue = -1;  // Number of static weapons at Blue Missions
	blck_SpawnVeh_Red = 1;  // Number of static weapons at Red Missions

	// AI STATIC WEAPON PARAMETERS
	blck_useStatic = true;  // When true, AI will man static weapons spawned 20-30 meters from the mission center. These are very effective against most vehicles
	blck_staticWeapons = ["B_HMG_01_high_F"/*,"B_GMG_01_high_F","O_static_AT_F"*/];  // [0.50 cal, grenade launcher, AT Launcher]

	// Defines how many static weapons to spawn. Set this to -1 to disable spawning 
	blck_SpawnEmplaced_Orange = 3; // Number of static weapons at Orange Missions
	blck_SpawnEmplaced_Green = 3; // Number of static weapons at Green Missions
	blck_SpawnEmplaced_Blue = 1;  // Number of static weapons at Blue Missions
	blck_SpawnEmplaced_Red = 2;  // Number of static weapons at Red Missions	

	// AI paratrooper reinforcement paramters
	//blck_AIHelis = ["B_Heli_Light_01_armed_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F"];
	blck_reinforcementsOrange = [0,5,0,0];  // Chance of reinforcements, number of reinforcements, Chance of reinforcing heli patrols, chance of dropping supplies for the reinforcements
	blck_reinforcementsGreen = [0,4,0,0];
	blck_reinforcementsRed = [0,3,0,0];
	blck_reinforcementsBlue = [0,2,0.0,0];
	
	// MISSION TIMERS
	// Reduce to 1 sec for immediate spawns, or longer if you wish to space the missions out	
	blck_TMin_Orange = 250;
	blck_TMin_Green = 200;
	blck_TMin_Blue = 120;
	blck_TMin_Red = 150;
	blck_TMin_Hunter = 120;
	blck_TMin_Scouts = 115;
	blck_TMin_Crashes = 115;
	//Maximum Spawn time between missions in seconds
	blck_TMax_Orange = 360;
	blck_TMax_Green = 300;
	blck_TMax_Blue = 200;
	blck_TMax_Red = 250;
	blck_TMax_Hunter = 200;
	blck_TMax_Scouts = 200;
	blck_TMax_Crashes = 200;
	
	blck_MissionTimout = 40*60;  // 40 min

	// Define the maximum number of crash sites on the map at any one time
	blck_maxCrashSites = 3;  // recommended settings: 3 for Altis, 2 for Tanoa, 1 for smaller maps. Set to -1 to disable
	/****************************************************************
	
	GENERAL AI SETTINGS
	
	****************************************************************/
	
	blck_combatMode = "RED"; // Change this to "YELLOW" if the AI wander too far from missions for your tastes.
	blck_groupFormation = "WEDGE"; // Possibilities include "WEDGE","VEE","FILE","DIAMOND"
	blck_AI_Side = EAST;
	blck_ModType = "Exile";

	blck_chanceBackpack = 0.3;  // Chance AI will be spawned with a backpack
	blck_useNVG = true; // When true, AI will be spawned with NVG if is dark
	blck_useLaunchers = false;  // When true, some AI will be spawned with RPGs; they do not however fire on vehicles for some reason so I recommend this be set to false for now
	//blck_launcherTypes = ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F"];
	blck_launcherTypes = ["launch_RPG32_F"];
	blck_chanceAIBackpack = 0.33;  // the chance that AI will be spawned with a backpack from the list below.
	blck_backpack = [			
			"B_AssaultPack_blk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_dgtl",
			"B_AssaultPack_khk",
			"B_AssaultPack_mcamo",
			"B_AssaultPack_rgr",
			"B_AssaultPack_sgg",
			"B_Bergen_blk",
			"B_Bergen_mcamo",
			"B_Bergen_rgr",
			"B_Bergen_sgg",
			"B_Carryall_cbr",
			"B_Carryall_khk",
			"B_Carryall_mcamo",
			"B_Carryall_ocamo",
			"B_Carryall_oli",
			"B_Carryall_oucamo",
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_ocamo",
			"B_FieldPack_oucamo",
			"B_HuntingBackpack",
			"B_Kitbag_cbr",
			"B_Kitbag_mcamo",
			"B_Kitbag_sgg",
			"B_OutdoorPack_blk",
			"B_OutdoorPack_blu",
			"B_OutdoorPack_tan",
			"B_TacticalPack_blk",
			"B_TacticalPack_mcamo",
			"B_TacticalPack_ocamo",
			"B_TacticalPack_oli",
			"B_TacticalPack_rgr"
		];  
	blck_launchersPerGroup = 1;  // Defines the number of AI per group spawned with a launcher
	blck_launcherCleanup = true;// When true, launchers and launcher ammo are removed from dead AI.

	//This defines how long after an AI dies that it's body disappears.
	blck_bodyCleanUpTimer = 1200; // time in seconds after which dead AI bodies are deleted
	// Each time an AI is killed, the location of the killer will be revealed to all AI within this range of the killed AI, set to -1 to disable
	// values are ordered as follows [blue, red, green, orange];
	blck_AliveAICleanUpTime = 900;  // Time after mission completion at which any remaining live AI are deleted.
	blck_cleanupCompositionTimer = 1200;
	blck_AIAlertDistance = [150,225,425,550];
	// How precisely player locations will be revealed to AI after an AI kill
	// values are ordered as follows [blue, red, green, orange];
	blck_AIIntelligence = [0.5, 1, 2, 4];  

	/***************************************************************
	
	MISSION TYPE SPECIFIC AI SETTINGS
	
	**************************************************************/
	//This defines the skill, minimum/Maximum number of AI and how many AI groups are spawned for each mission type
	// Orange Missions
	blck_MinAI_Orange = 20;
	blck_MaxAI_Orange = 25;
	blck_AIGrps_Orange = 6;
	blck_SkillsOrange = [
		["aimingAccuracy",0.4],["aimingShake",0.7],["aimingSpeed",0.4],["endurance",1.00],["spotDistance",0.7],["spotTime",0.7],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]
	];
	
	// Green Missions
	blck_MinAI_Green = 16;
	blck_MaxAI_Green = 21;
	blck_AIGrps_Green = 5;
	blck_SkillsGreen = [
		["aimingAccuracy",0.25],["aimingShake",0.5],["aimingSpeed",0.4],["endurance",0.9],["spotDistance",0.6],["spotTime",0.6],["courage",85],["reloadSpeed",0.75],["commanding",0.9],["general",0.75]
	];
	
	// Red Missions
	// Red Missions
	blck_MinAI_Red = 12;
	blck_MaxAI_Red = 15;
	blck_AIGrps_Red = 3;
	blck_SkillsRed = [
		["aimingAccuracy",0.16],["aimingShake",0.3],["aimingSpeed",0.3],["endurance",0.60],["spotDistance",0.5],["spotTime",0.5],["courage",0.70],["reloadSpeed",0.70],["commanding",0.8],["general",0.70]
	];
	
	// Blue Missions
	blck_MinAI_Blue = 8;	
	blck_MaxAI_Blue = 12;
	blck_AIGrps_Blue = 2;
	blck_SkillsBlue = [
		["aimingAccuracy",0.10],["aimingShake",0.2],["aimingSpeed",0.55],["endurance",0.50],["spotDistance",0.65],["spotTime",0.80],["courage",0.60],["reloadSpeed",0.60],["commanding",0.7],["general",0.60]
	];
	
/*********************************************************************************

AI WEAPONS, UNIFORMS, VESTS AND GEAR

**********************************************************************************/
		blck_RifleSniper = [ 
			"srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","srifle_DMR_01_F" 		
		];

		blck_RifleAsault = [
			"arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F",
			"arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F","arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F"
		];

		blck_RifleLMG = [
			"LMG_Mk200_F","LMG_Zafir_F"
		];

		blck_RifleOther = [
			"SMG_01_F","SMG_02_F"
		];

		blck_Pistols = [
			"hgun_PDW2000_F","hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Pistol_Signal_F"
		];	
		
		blck_DLC_MMG = [
					"MMG_01_hex_F","MMG_02_sand_F","MMG_01_tan_F","MMG_02_black_F","MMG_02_camo_F"
		];
		
		blck_DLC_Sniper = [
			"srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F","srifle_DMR_03_F","srifle_DMR_03_tan_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F"
		];
		
	//This defines the random weapon to spawn on the AI
	//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
	blck_WeaponList_Orange = blck_RifleSniper + blck_RifleAsault + blck_RifleLMG + blck_DLC_Sniper + blck_DLC_MMG;
	blck_WeaponList_Green = blck_RifleSniper + 	blck_RifleAsault +blck_RifleLMG + blck_DLC_MMG;
	blck_WeaponList_Blue = blck_RifleOther + blck_RifleAsault +blck_RifleLMG;
	blck_WeaponList_Red = blck_RifleOther + blck_RifleSniper + 	blck_RifleAsault + blck_RifleLMG;
	
	blck_tools = ["Exile_Item_Matches","Exile_Item_CookingPot","Exile_Melee_Axe","Exile_Item_CanOpener","Exile_Item_Handsaw","Exile_Item_Pliers"];
	blck_buildingMaterials = ["Exile_Item_ExtensionCord","Exile_Item_JunkMetal","Exile_Item_LightBulb","Exile_Item_MetalBoard","Exile_Item_MetalPole","Exile_Item_Cement","Exile_Item_Sand"];
	
	blck_BanditHeadgear = ["H_Shemag_khk","H_Shemag_olive","H_Shemag_tan","H_ShemagOpen_khk"];
	//This defines the skin list, some skins are disabled by default to permit players to have high visibility uniforms distinct from those of the AI.
	blck_headgear = [
			"H_Cap_blk",
			"H_Cap_blk_Raven",
			"H_Cap_blu",
			"H_Cap_brn_SPECOPS",
			"H_Cap_grn",
			"H_Cap_headphones",
			"H_Cap_khaki_specops_UK",
			"H_Cap_oli",
			"H_Cap_press",
			"H_Cap_red",
			"H_Cap_tan",
			"H_Cap_tan_specops_US",
			"H_Watchcap_blk",
			"H_Watchcap_camo",
			"H_Watchcap_khk",
			"H_Watchcap_sgg",
			"H_MilCap_blue",
			"H_MilCap_dgtl",
			"H_MilCap_mcamo",
			"H_MilCap_ocamo",
			"H_MilCap_oucamo",
			"H_MilCap_rucamo",
			"H_Bandanna_camo",
			"H_Bandanna_cbr",
			"H_Bandanna_gry",
			"H_Bandanna_khk",
			"H_Bandanna_khk_hs",
			"H_Bandanna_mcamo",
			"H_Bandanna_sgg",
			"H_Bandanna_surfer",
			"H_Booniehat_dgtl",
			"H_Booniehat_dirty",
			"H_Booniehat_grn",
			"H_Booniehat_indp",
			"H_Booniehat_khk",
			"H_Booniehat_khk_hs",
			"H_Booniehat_mcamo",
			"H_Booniehat_tan",
			"H_Hat_blue",
			"H_Hat_brown",
			"H_Hat_camo",
			"H_Hat_checker",
			"H_Hat_grey",
			"H_Hat_tan",
			"H_StrawHat",
			"H_StrawHat_dark",
			"H_Beret_02",
			"H_Beret_blk",
			"H_Beret_blk_POLICE",
			"H_Beret_brn_SF",
			"H_Beret_Colonel",
			"H_Beret_grn",
			"H_Beret_grn_SF",
			"H_Beret_ocamo",
			"H_Beret_red",
			"H_Shemag_khk",
			"H_Shemag_olive",
			"H_Shemag_olive_hs",
			"H_Shemag_tan",
			"H_ShemagOpen_khk",
			"H_ShemagOpen_tan",
			"H_TurbanO_blk"	
	];
	blck_helmets = [
			"H_HelmetB",
			"H_HelmetB_black",
			"H_HelmetB_camo",
			"H_HelmetB_desert",
			"H_HelmetB_grass",
			"H_HelmetB_light",
			"H_HelmetB_light_black",
			"H_HelmetB_light_desert",
			"H_HelmetB_light_grass",
			"H_HelmetB_light_sand",
			"H_HelmetB_light_snakeskin",
			"H_HelmetB_paint",
			"H_HelmetB_plain_blk",
			"H_HelmetB_sand",
			"H_HelmetB_snakeskin",
			"H_HelmetCrew_B",
			"H_HelmetCrew_I",
			"H_HelmetCrew_O",
			"H_HelmetIA",
			"H_HelmetIA_camo",
			"H_HelmetIA_net",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetO_oucamo",
			"H_HelmetSpecB",
			"H_HelmetSpecB_blk",
			"H_HelmetSpecB_paint1",
			"H_HelmetSpecB_paint2",
			"H_HelmetSpecO_blk",
			"H_HelmetSpecO_ocamo",
			"H_CrewHelmetHeli_B",
			"H_CrewHelmetHeli_I",
			"H_CrewHelmetHeli_O",
			"H_HelmetCrew_I",
			"H_HelmetCrew_B",
			"H_HelmetCrew_O",
			"H_PilotHelmetHeli_B",
			"H_PilotHelmetHeli_I",
			"H_PilotHelmetHeli_O"
	];
	blck_headgearList = blck_headgear + blck_helmets;
	blck_SkinList = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
			"U_C_Journalist",
			"U_C_Poloshirt_blue",
			"U_C_Poloshirt_burgundy",
			"U_C_Poloshirt_salmon",
			"U_C_Poloshirt_stripped",
			"U_C_Poloshirt_tricolour",
			"U_C_Poor_1",
			"U_C_Poor_2",
			"U_C_Poor_shorts_1",
			"U_C_Scientist",
			"U_OrestesBody",
			"U_Rangemaster",
			"U_NikosAgedBody",
			"U_NikosBody",
			"U_Competitor",
			"U_B_CombatUniform_mcam",
			"U_B_CombatUniform_mcam_tshirt",
			"U_B_CombatUniform_mcam_vest",
			"U_B_CombatUniform_mcam_worn",
			"U_B_CTRG_1",
			"U_B_CTRG_2",
			"U_B_CTRG_3",
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve",
			"U_I_CombatUniform_tshirt",
			"U_I_OfficerUniform",
			"U_O_CombatUniform_ocamo",
			"U_O_CombatUniform_oucamo",
			"U_O_OfficerUniform_ocamo",
			"U_B_SpecopsUniform_sgg",
			"U_O_SpecopsUniform_blk",
			"U_O_SpecopsUniform_ocamo",
			"U_I_G_Story_Protagonist_F",
			"U_C_HunterBody_grn",
			"U_IG_Guerilla1_1",
			"U_IG_Guerilla2_1",
			"U_IG_Guerilla2_2",
			"U_IG_Guerilla2_3",
			"U_IG_Guerilla3_1",
			"U_BG_Guerilla2_1",
			"U_IG_Guerilla3_2",
			"U_BG_Guerrilla_6_1",
			"U_BG_Guerilla1_1",
			"U_BG_Guerilla2_2",
			"U_BG_Guerilla2_3",
			"U_BG_Guerilla3_1",
			"U_BG_leader",
			"U_IG_leader",
			"U_I_G_resistanceLeader_F",
			"U_B_FullGhillie_ard",
			"U_B_FullGhillie_lsh",
			"U_B_FullGhillie_sard",
			"U_B_GhillieSuit",
			"U_I_FullGhillie_ard",
			"U_I_FullGhillie_lsh",
			"U_I_FullGhillie_sard",
			"U_I_GhillieSuit",
			"U_O_FullGhillie_ard",
			"U_O_FullGhillie_lsh",
			"U_O_FullGhillie_sard",
			"U_O_GhillieSuit",
			"U_I_Wetsuit",
			"U_O_Wetsuit",
			"U_B_Wetsuit",
			"U_B_survival_uniform",
			"U_B_HeliPilotCoveralls",
			"U_I_HeliPilotCoveralls",
			"U_B_PilotCoveralls",
			"U_I_pilotCoveralls",
			"U_O_PilotCoveralls"
			];

	blck_vests = [
			"V_Press_F",
			"V_Rangemaster_belt",
			"V_TacVest_blk",
			"V_TacVest_blk_POLICE",
			"V_TacVest_brn",
			"V_TacVest_camo",
			"V_TacVest_khk",
			"V_TacVest_oli",
			"V_TacVestCamo_khk",
			"V_TacVestIR_blk",
			"V_I_G_resistanceLeader_F",
			"V_BandollierB_blk",
			"V_BandollierB_cbr",
			"V_BandollierB_khk",
			"V_BandollierB_oli",
			"V_BandollierB_rgr",
			"V_Chestrig_blk",
			"V_Chestrig_khk",
			"V_Chestrig_oli",
			"V_Chestrig_rgr",
			"V_HarnessO_brn",
			"V_HarnessO_gry",
			"V_HarnessOGL_brn",
			"V_HarnessOGL_gry",
			"V_HarnessOSpec_brn",
			"V_HarnessOSpec_gry",
			"V_PlateCarrier1_blk",
			"V_PlateCarrier1_rgr",
			"V_PlateCarrier2_rgr",
			"V_PlateCarrier3_rgr",
			"V_PlateCarrierGL_blk",
			"V_PlateCarrierGL_mtp",
			"V_PlateCarrierGL_rgr",
			"V_PlateCarrierH_CTRG",
			"V_PlateCarrierIA1_dgtl",
			"V_PlateCarrierIA2_dgtl",
			"V_PlateCarrierIAGL_dgtl",
			"V_PlateCarrierIAGL_oli",
			"V_PlateCarrierL_CTRG",
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrierSpec_mtp",
			"V_PlateCarrierSpec_rgr"
			];
		
		blck_weaponOptics = ["optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","optic_SOS",
							"optic_MRCO","optic_DMS","optic_Yorris","optic_MRD","optic_LRPS","optic_NVS","optic_Nightstalker"];
		blck_weaponSilencers = ["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M",
								"muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_acp"];
		blck_weaponLights = ["acc_flashlight","acc_pointer_IR"];
		blck_WeaponAttachments = blck_weaponOptics + blck_weaponSilencers + blck_weaponLights;
	
		//CraftingFood
		blck_Meats=[
			
		];
		blck_Drink = [
				"Exile_Item_PlasticBottleCoffee",
				"Exile_Item_PowerDrink",
				"Exile_Item_PlasticBottleFreshWater",
				"Exile_Item_Beer",
				"Exile_Item_EnergyDrink",
				"Exile_Item_MountainDupe"
		];
		blck_Food = [
			"Exile_Item_EMRE",		
			"Exile_Item_GloriousKnakworst",
			"Exile_Item_Surstromming",
			"Exile_Item_SausageGravy",
			"Exile_Item_Catfood",
			"Exile_Item_ChristmasTinner",
			"Exile_Item_BBQSandwich",
			"Exile_Item_Dogfood",
			"Exile_Item_BeefParts",
			"Exile_Item_Cheathas",
			"Exile_Item_Noodles",
			"Exile_Item_SeedAstics",
			"Exile_Item_Raisins",
			"Exile_Item_Moobar",
			"Exile_Item_InstantCoffee"
		];
		blck_ConsumableItems = blck_Meats + blck_Drink + blck_Food;
		blck_throwableExplosives = ["HandGrenade","MiniGrenade"];
		blck_otherExplosives = ["1Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag"];
		blck_explosives = blck_throwableExplosives + blck_otherExplosives;
		blck_medicalItems = ["Exile_Item_InstaDoc","Exile_Item_Bandage","Exile_Item_Vishpirin"];
		blck_specialItems = blck_throwableExplosives + blck_medicalItems;
		
		blck_NVG = ["NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR","Exile_Item_XM8"];

/***************************************************************************************
DEFAULT CONTENTS OF LOOT CRATES FOR EACH MISSION
Note however that these configurations can be used in any way you like or replaced with mission-specific customized loot arrays
for examples of how you can do this see \Major\Compositions.sqf
***************************************************************************************/			

	// values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
	blck_lootCountsOrange = [8,32,8,30,16,1];   // Orange
	blck_lootCountsGreen = [7,24,6,16,18,1]; // Green
	blck_lootCountsRed = [5,16,4,10,6,1];  // Red	
	blck_lootCountsBlue = [4,12,3,6,6,1];   // Blue
	
	blck_BoxLoot_Orange = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
		[  
			[// Weapons	
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["MMG_01_tan_F","150Rnd_93x64_Mag"],
				["MMG_02_black_F","150Rnd_93x64_Mag"],
				["MMG_02_camo_F","150Rnd_93x64_Mag"],
				["MMG_02_sand_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_02_F","10Rnd_338_Mag"],
				["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],
				["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],
				["srifle_DMR_05_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"],				
				["srifle_DMR_04_F","10Rnd_127x54_Mag"],
				["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]		
			],
			[//Magazines
				["3rnd_HE_Grenade_Shell",3,6],				
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",7,14],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,5],
				// Marksman Pack Ammo
				["10Rnd_338_Mag",1,5],
				["10Rnd_338_Mag",1,5],				
				["10Rnd_127x54_Mag" ,1,5],
				["10Rnd_127x54_Mag",1,5],
				["10Rnd_93x64_DMR_05_Mag" ,1,5],
				["10Rnd_93x64_DMR_05_Mag" ,1,5]				
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],
				["optic_Arco",1,3],
				["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[// Materials and supplies				
				["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,8],["Exile_Item_ExtensionCord",1,8],["Exile_Item_FuelCanisterEmpty",1,2],
				["Exile_Item_JunkMetal",1,10],["Exile_Item_LightBulb",1,10],["Exile_Item_MetalBoard",1,10],["Exile_Item_MetalPole",1,10],["Exile_Item_CamoTentKit",1,10],["Exile_Item_WorkBenchKit",1,10],
				["Exile_Item_WoodWindowKit",1,10],["Exile_Item_WoodWallKit",1,10],["Exile_Item_WoodStairsKit",1,10],["Exile_Item_WoodGateKit",1,10],["Exile_Item_WoodDoorwayKit",1,10],["Exile_Item_MetalBoard",1,10],
				["Exile_Item_MetalBoard",1,10],["Exile_Item_ExtensionCord",1,10],["Exile_Item_MetalPole",1,10],["Exile_Item_Sand",3,10],["Exile_Item_Cement",3,10],["Exile_Item_MetalWire",3,10],["Exile_Item_MetalScrews",3,10]
				//
			],
			[//Items
				["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Rangefinder",1,2],["Exile_Item_Bandage",1,3],["Exile_Item_Vishpirin",1,3],  
				["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3],
				["Exile_Item_BeefParts",1,3],["Exile_Item_Cheathas",1,3],["Exile_Item_Noodles",1,3],["Exile_Item_SeedAstics",1,3],["Exile_Item_Raisins",1,3],["Exile_Item_Moobar",1,3],["Exile_Item_InstantCoffee",1,3],["Exile_Item_EMRE",1,3],
				["Exile_Item_PlasticBottleCoffee",1,3],["Exile_Item_PowerDrink",1,3],["Exile_Item_PlasticBottleFreshWater",1,3],["Exile_Item_Beer",1,3],["Exile_Item_EnergyDrink",1,3],["Exile_Item_MountainDupe",1,3]				
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_cbr",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],
				["B_FieldPack_blk",1,2],["B_FieldPack_cbr",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oucamo",1,2],
				["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],["B_Kitbag_sgg",1,2],
				["B_Parachute",1,2],["V_RebreatherB",1,2],["V_RebreatherIA",1,2],["V_RebreatherIR",1,2],
				["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],["B_TacticalPack_rgr",1,2],
				["B_Bergen_blk",1,2],["B_Bergen_mcamo",1,2],["B_Bergen_rgr",1,2],["B_Bergen_sgg",1,2],
				["B_HuntingBackpack",1,2],["B_OutdoorPack_blk",1,2],["B_OutdoorPack_blu",1,2],["B_OutdoorPack_tan",1,2]
			]
	];		
		
	blck_BoxLoot_Green = 
		[
			[// Weapons
				// Format is ["Weapon Name","Magazine Name"],
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["SMG_02_F","30Rnd_9x21_Mag"],
				["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],		
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],	
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"]				
			],
			[//Magazines
				// Format is ["Magazine name, Minimum number to add, Maximum number to add],
				["3rnd_HE_Grenade_Shell",2,4],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",6,12],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,3],
				// Marksman Pack Ammo				
				["10Rnd_338_Mag",1,4],
				["10Rnd_338_Mag",1,4],				
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]					
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[// Materials and supplies				
				["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,8],["Exile_Item_ExtensionCord",1,8],["Exile_Item_FuelCanisterEmpty",1,2],
				["Exile_Item_JunkMetal",1,5],["Exile_Item_LightBulb",1,5],["Exile_Item_MetalBoard",1,5],["Exile_Item_MetalPole",1,5],["Exile_Item_CamoTentKit",1,5],["Exile_Item_WorkBenchKit",1,5],
				["Exile_Item_MetalBoard",1,5],["Exile_Item_MetalWire",3,10],["Exile_Item_MetalScrews",3,10],["Exile_Item_ExtensionCord",1,5],["Exile_Item_MetalPole",1,5],["Exile_Item_Sand",2,5],["Exile_Item_Cement",2,5]
			],
			[//Items
				["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Rangefinder",1,2],["Exile_Item_Bandage",1,6],["Exile_Item_Vishpirin",1,6],  
				["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3],
				["Exile_Item_BeefParts",1,3],["Exile_Item_Cheathas",1,3],["Exile_Item_Noodles",1,3],["Exile_Item_SeedAstics",1,3],["Exile_Item_Raisins",1,3],["Exile_Item_Moobar",1,3],["Exile_Item_InstantCoffee",1,3],["Exile_Item_EMRE",1,3],
				["Exile_Item_PlasticBottleCoffee",1,3],["Exile_Item_PowerDrink",1,3],["Exile_Item_PlasticBottleFreshWater",1,3],["Exile_Item_Beer",1,3],["Exile_Item_EnergyDrink",1,3],["Exile_Item_MountainDupe",1,3]	
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_cbr",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],
				["B_FieldPack_blk",1,2],["B_FieldPack_cbr",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oucamo",1,2],
				["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],["B_Kitbag_sgg",1,2],
				["B_Parachute",1,2],["V_RebreatherB",1,2],["V_RebreatherIA",1,2],["V_RebreatherIR",1,2],
				["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],["B_TacticalPack_rgr",1,2],
				["B_Bergen_blk",1,2],["B_Bergen_mcamo",1,2],["B_Bergen_rgr",1,2],["B_Bergen_sgg",1,2],
				["B_HuntingBackpack",1,2],["B_OutdoorPack_blk",1,2],["B_OutdoorPack_blu",1,2],["B_OutdoorPack_tan",1,2]
			]
		];
		
	blck_BoxLoot_Blue = 
		[
			[// Weapons
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["SMG_02_F","30Rnd_9x21_Mag"],
				["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"]		
			],
			[//Magazines
				["3rnd_HE_Grenade_Shell",1,2],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",3,10],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,4],
				["HandGrenade",1,3],
				// Marksman Pack Ammo				
				["150Rnd_93x64_Mag",1,4],
				["10Rnd_338_Mag",1,4],
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],	
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[// Materials and supplies				
				["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,3],["Exile_Item_ExtensionCord",1,2],["Exile_Item_FuelCanisterEmpty",1,2],
				["Exile_Item_JunkMetal",1,6],["Exile_Item_LightBulb",1,6],["Exile_Item_MetalBoard",1,6],["Exile_Item_MetalPole",1,6],["Exile_Item_CamoTentKit",1,6]
			],
			[//Items
				["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Rangefinder",1,2],["Exile_Item_Bandage",1,3],["Exile_Item_Vishpirin",1,3],  
				["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3],
				["Exile_Item_BeefParts",1,3],["Exile_Item_Cheathas",1,3],["Exile_Item_Noodles",1,3],["Exile_Item_SeedAstics",1,3],["Exile_Item_Raisins",1,3],["Exile_Item_Moobar",1,3],["Exile_Item_InstantCoffee",1,3],["Exile_Item_EMRE",1,3],
				["Exile_Item_PlasticBottleCoffee",1,3],["Exile_Item_PowerDrink",1,3],["Exile_Item_PlasticBottleFreshWater",1,3],["Exile_Item_Beer",1,3],["Exile_Item_EnergyDrink",1,3],["Exile_Item_MountainDupe",1,3]	
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_cbr",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],
				["B_FieldPack_blk",1,2],["B_FieldPack_cbr",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oucamo",1,2],
				["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],["B_Kitbag_sgg",1,2],
				["B_Parachute",1,2],["V_RebreatherB",1,2],["V_RebreatherIA",1,2],["V_RebreatherIR",1,2],
				["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],["B_TacticalPack_rgr",1,2],
				["B_Bergen_blk",1,2],["B_Bergen_mcamo",1,2],["B_Bergen_rgr",1,2],["B_Bergen_sgg",1,2],
				["B_HuntingBackpack",1,2],["B_OutdoorPack_blk",1,2],["B_OutdoorPack_blu",1,2],["B_OutdoorPack_tan",1,2]
			]
		];
	
	blck_BoxLoot_Red = 
		[	
			[// Weapons
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["SMG_02_F","30Rnd_9x21_Mag"],
				["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"]
			],
			[//Magazines
		
				["3rnd_HE_Grenade_Shell",1,5],["30Rnd_65x39_caseless_green",3,6],["30Rnd_556x45_Stanag",3,6],["30Rnd_556x45_Stanag",3,6],["30Rnd_45ACP_Mag_SMG_01",3,6],["20Rnd_556x45_UW_mag",3,6],
				["10Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,7],["200Rnd_65x39_cased_Box",3,6],["100Rnd_65x39_caseless_mag_Tracer",3,6],
				// Marksman Pack Ammo				
				["150Rnd_93x64_Mag",1,4],
				["10Rnd_338_Mag",1,4],
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],		
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],			
			[// Materials and supplies				
				["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,8],["Exile_Item_ExtensionCord",1,8],["Exile_Item_FuelCanisterEmpty",1,2],
				["Exile_Item_JunkMetal",1,5],["Exile_Item_LightBulb",1,5],["Exile_Item_MetalBoard",1,5],["Exile_Item_MetalPole",1,5],["Exile_Item_CamoTentKit",1,5],["Exile_Item_WorkBenchKit",1,5],
				["Exile_Item_MetalBoard",1,5],["Exile_Item_MetalWire",3,10],["Exile_Item_MetalScrews",3,10],["Exile_Item_ExtensionCord",1,5],["Exile_Item_MetalPole",1,5],["Exile_Item_Sand",2,5],["Exile_Item_Cement",2,5]
			],
			[//Items
				["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Exile_Item_Energydrink",1,4],["Exile_Item_Beer",1,3],["Rangefinder",1,2],
				["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3] 
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_cbr",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],
				["B_FieldPack_blk",1,2],["B_FieldPack_cbr",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oucamo",1,2],
				["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],["B_Kitbag_sgg",1,2],
				["B_Parachute",1,2],["V_RebreatherB",1,2],["V_RebreatherIA",1,2],["V_RebreatherIR",1,2],
				["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],["B_TacticalPack_rgr",1,2],
				["B_Bergen_blk",1,2],["B_Bergen_mcamo",1,2],["B_Bergen_rgr",1,2],["B_Bergen_sgg",1,2],
				["B_HuntingBackpack",1,2],["B_OutdoorPack_blk",1,2],["B_OutdoorPack_blu",1,2],["B_OutdoorPack_tan",1,2]
			]
		];

	// Time the marker remains after completing the mission in seconds - experimental not yet implemented

	blck_crateTypes = ["Box_FIA_Ammo_F","Box_FIA_Support_F","Box_FIA_Wps_F","I_SupplyCrate_F","Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","IG_supplyCrate_F","Box_NATO_Wps_F","I_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F"];  // Default crate type.
		
	diag_log format["[blckeagls] Configurations for Exile Loaded"];

	blck_configsLoaded = true;
