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

//diag_log "[blckeagls] Spawning Blue Mission with template = default";
_crateLoot = blck_BoxLoot_Blue;
_lootCounts = blck_lootCountsBlue;
_startMsg = "A Forgotten HQ was sighted in a nearby sector! Check the Blue marker on your map for the location!";
_endMsg = "The Forgotten HQ at the Blue Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[200,200],"Solid"];
_markerColor = "ColorBlue";
_markerMissionName = "Forgotten HQ";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Patrol_V2_F",[-16.0361,-36.5635,-0.00143862],0,true,true,[["O_G_HMG_02_high_F",[1.07422,-1.17676,4.38749],183.214]],[]],
     ["Land_Cargo_Patrol_V2_F",[1.44385,-36.4934,-0.00143862],0,true,true,[["O_G_HMG_02_high_F",[-1.49438,-1.08521,4.38749],183.771]],[]],
     ["Land_Cargo_HQ_V2_F",[-20.6721,-8.55249,-0.00143862],180,true,true,[["O_G_HMG_02_high_F",[-4.84253,-3.34399,3.16997],0.00630354]],[]],
     ["Land_Cargo_Tower_V2_F",[-16.9631,-26.0334,-0.00143909],180,true,true,[["O_G_HMG_02_high_F",[-4.54858,0.758057,17.9329],0.00661736],["O_G_HMG_02_high_F",[3.65967,3.33838,17.9329],0.000690221]],[]],
     ["Land_Cargo_HQ_V2_F",[7.14893,2.62769,-0.00143862],270.279,true,true,[["O_G_HMG_02_high_F",[-0.843506,5.84277,3.16996],0.00567617]],[]]
];


_missionLandscape = [
     ["Land_CncWall4_F",[-32.4219,-12.8027,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[-32.4495,-2.36279,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[-32.4219,-7.55273,-0.00143909],90,true,true],
     ["Land_CncWall1_F",[-32.4219,-16.0527,-0.00143909],90,true,true],
     ["Land_CncWall1_F",[-32.1719,-17.3027,-0.00143909],60,true,true],
     ["Land_CncWall4_F",[-17.2,-37.5388,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[-19.45,-35.2888,-0.00143909],90,true,true],
     ["Land_CncWall1_F",[-13.95,-37.2888,-0.00143909],345,true,true],
     ["Land_CncWall1_F",[-0.469971,-37.123,-0.00143909],15,true,true],
     ["Land_CncWall1_F",[-1.70728,-36.5938,-0.00143909],30,true,true],
     ["Land_CncWall1_F",[-12.7,-36.7888,-0.00143909],330,true,true],
     ["Land_Mil_WiredFence_Gate_F",[-7.18335,-36.4424,-0.00143909],0,true,true],
     ["Land_LampShabby_F",[-2.78442,-36.3179,-0.00143909],267.423,true,true],
     ["Land_LampShabby_F",[-11.5483,-36.9063,-0.00143909],96.8408,true,true],
     ["Land_Razorwire_F",[-15.4663,-50.6616,-0.00143909],0,true,true],
     ["Land_Garbage_square5_F",[-5.48242,-33.7585,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_Dam_F",[-23.4219,-33.3027,0.0484428],90,true,true],
     ["Oil_Spill_F",[-0.250732,-46.9929,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[-18.6699,-48.1602,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[-8.92188,-48.0527,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[-23.377,-43.2129,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[-10.9219,-12.4277,-0.00143909],270,true,true],
     ["Land_CncWall4_F",[-10.9219,-7.17773,-0.00143909],270,true,true],
     ["Land_CncWall4_F",[-23.9219,-17.8027,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[-19.0479,-28.729,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[-18.5469,-17.8027,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[-29.2969,-17.8027,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[-19.0479,-23.479,-0.00143909],90,true,true],
     ["Land_CncWall1_F",[-12.0469,-16.5527,-0.00143909],315,true,true],
     ["Land_CncWall1_F",[-13.0469,-17.1777,-0.00143909],345,true,true],
     ["Land_CncWall1_F",[-11.2969,-15.5527,-0.00143909],300,true,true],
     ["Land_CncWall1_F",[-18.7979,-20.229,-0.00143909],105,true,true],
     ["Land_CncWall1_F",[-19.2,-32.0388,-0.00143909],105,true,true],
     ["Land_CncWall1_F",[-1.87036,-6.15894,-0.00143909],76.1339,true,true],
     ["Land_CncWall1_F",[-18.2979,-18.979,-0.00143909],120,true,true],
     ["Land_CncWall1_F",[-0.776123,-8.00391,-0.00143909],44.3183,true,true],
     ["Land_CncWall1_F",[-1.98975,-5.05225,-0.00143909],89.3183,true,true],
     ["Land_CncWall1_F",[-10.9346,-1.3584,-0.00143909],254.791,true,true],
     ["Land_CncWall1_F",[-1.50586,-7.08521,-0.00143909],59.3183,true,true],
     ["Land_LampShabby_F",[-12.0967,-15.9277,-0.00143909],304.187,true,true],
     ["Land_CncShelter_F",[-5.76489,-3.25,-0.00143909],90.2789,true,true],
     ["Land_CncShelter_F",[-2.69824,-3.26221,-0.00143909],90.2789,true,true],
     ["Land_CncShelter_F",[-10.3674,-3.21143,-0.00143909],90.2789,true,true],
     ["Land_CncShelter_F",[-7.29834,-3.24414,-0.00143909],90.2789,true,true],
     ["Land_CncShelter_F",[-8.83398,-3.21729,-0.00143909],90.2789,true,true],
     ["Land_CncShelter_F",[-4.23169,-3.25635,-0.00143909],90.2789,true,true],
     ["Land_CncShelter_F",[-14.8062,-17.8242,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[-23.4219,-23.3027,-0.00143909],90,true,true],
     ["Land_Garbage_line_F",[-6.69629,-14.0273,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[-2.08496,5.92285,-0.00143909],90.2789,true,true],
     ["Land_CncWall4_F",[-24.9495,-0.112793,-0.00143909],180,true,true],
     ["Land_CncWall4_F",[-2.11108,0.548096,-0.00143909],90.2789,true,true],
     ["Land_CncWall4_F",[-19.6995,-0.112793,-0.00143909],180,true,true],
     ["Land_CncWall4_F",[-2.05884,11.2979,-0.00143909],90.2789,true,true],
     ["Land_CncWall4_F",[-30.1995,-0.112793,-0.00143909],180,true,true],
     ["Land_CncWall4_F",[-14.4768,-0.108398,-0.00143909],180,true,true],
     ["Land_CncWall1_F",[-0.293457,14.4143,-0.00143909],180.279,true,true],
     ["Land_CncWall1_F",[-11.5137,-0.462158,-0.00143909],218.676,true,true],
     ["Land_CncWall1_F",[-1.54468,14.1704,-0.00143909],150.279,true,true],
     ["Land_CncWall4_F",[2.78003,-37.373,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[5.15894,-34.9495,-0.00143909],270,true,true],
     ["Land_New_WiredFence_5m_F",[18.6162,-49.2598,-0.00143909],180,true,true],
     ["Land_Mil_WiredFence_Gate_F",[1.02295,-48.2319,-0.00143909],0,true,true],
     ["Land_Razorwire_F",[14.8767,-50.5405,-0.0014348],0,true,true],
     ["Land_Garbage_square5_F",[3.02661,-41.5759,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[22.4329,-43.2773,-0.00143766],90,true,true],
     ["Land_New_WiredFence_10m_F",[20.8657,-33.5273,-0.00143909],270,true,true],
     ["Land_New_WiredFence_10m_F",[11.0781,-47.8027,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[15.5647,-3.63062,-0.00143909],270.279,true,true],
     ["Land_CncWall4_F",[12.5393,-8.48145,-0.00143909],0.278918,true,true],
     ["Land_CncWall4_F",[2.11768,-8.40479,-0.00143909],0.278918,true,true],
     ["Land_CncWall4_F",[7.28931,-8.45581,-0.00143909],0.278918,true,true],
     ["Land_CncWall4_F",[5.1084,-19.2168,-0.00143909],270,true,true],
     ["Land_CncWall4_F",[5.07373,-13.9578,-0.00143909],270,true,true],
     ["Land_CncWall4_F",[5.14282,-29.6782,-0.00143909],270,true,true],
     ["Land_CncWall4_F",[5.11499,-24.4495,-0.00143909],270,true,true],
     ["Land_CncWall1_F",[15.2651,-8.03906,-0.00143909],300.801,true,true],
     ["Land_CncWall1_F",[15.5632,-6.90161,-0.00143909],270.801,true,true],
     ["Land_HelipadSquare_F",[14.0413,-24.9829,-0.00143909],0,true,true],
     ["Land_New_WiredFence_5m_F",[18.8281,-8.80273,-0.00143909],180,true,true],
     ["Land_LampShabby_F",[14.521,-6.92456,-0.00143909],315,true,true],
     ["Land_CncShelter_F",[4.83472,-10.1133,-0.00143909],90.2789,true,true],
     ["Land_GarbageBags_F",[2.49902,-16.0364,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[20.8281,-23.5527,-0.00143909],270,true,true],
     ["Land_New_WiredFence_10m_F",[20.8281,-13.5527,-0.00143909],270,true,true],
     ["Land_Wreck_Heli_Attack_02_F",[13.4341,-23.897,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[15.6953,12.0864,-0.00143909],270.279,true,true],
     ["Land_CncWall4_F",[13.4563,14.3474,-0.00143909],180.279,true,true],
     ["Land_CncWall4_F",[15.6443,1.58667,-0.00143909],270.279,true,true],
     ["Land_CncWall4_F",[8.2063,14.3728,-0.00143909],180.279,true,true],
     ["Land_CncWall4_F",[15.6697,6.83643,-0.00143909],270.279,true,true],
     ["Land_CncWall4_F",[2.9563,14.3984,-0.00143909],180.279,true,true]
];

_missionLootBoxes = [
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["O_G_Offroad_01_armed_F",[-10.8826,-67.0554,0.00841188],85.3805],
     ["O_G_Offroad_01_armed_F",[-7.25098,-35.3657,0.00811148],357.094]
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [

];

_missionGroups = [
     //[[-10.0691,-41.8555,0],3,6,"Red",30,45],
     //[[-1.13232,-24.1541,0],3,6,"Red",30,45],
     //[[-9.49146,-26.8044,0],3,6,"Red",30,45],
     //[[12.8374,-37.3408,0],3,6,"Red",30,45]
];



//////////
//   The lines below define additional variables you may wish to configure.


//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Blue;
_maxNoAI = blck_MaxAI_Blue;
_noAIGroups = blck_AIGrps_Blue;
_noVehiclePatrols = blck_SpawnVeh_Blue;
_noEmplacedWeapons = blck_SpawnEmplaced_Blue;
//_uniforms = blck_SkinList;
//_headgear = blck_headgear;

_chancePara = 0.75; // Setting this in the mission file overrides the defaults 
_noPara = 5;  // Setting this in the mission file overrides the defaults 
_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
_paraSkill = "Blue";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.

_chanceLoot = 0.7; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [blck_contructionLoot,blck_contructionLoot,blck_highPoweredLoot,blck_supportLoot];
private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

_spawnCratesTiming = blck_spawnCratesTiming; // Choices: "atMissionSpawnGround","atMissionEndGround","atMissionEndAir". 
						 // Crates spawned in the air will be spawned at mission center or the position(s) defined in the mission file and dropped under a parachute.
						 //  This sets the default value but can be overridden by defining  _spawnCrateTiming in the file defining a particular mission.
_loadCratesTiming = blck_loadCratesTiming; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
						// Pertains only to crates spawned at mission spawn.
						// This sets the default but can be overridden for specific missions by defining _loadCratesTiming
						
						// Examples:
						// To spawn crates at mission start loaded with gear set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionSpawn"
						// To spawn crates at mission start but load gear only after the mission is completed set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionCompletion"
						// To spawn crates on the ground at mission completion set blck_spawnCratesTiming = "atMissionEndGround" // Note that a loaded crate will be spawned.
						// To spawn crates in the air and drop them by chutes set blck_spawnCratesTiming = "atMissionEndAir" // Note that a loaded crate will be spawned.
_endCondition = "allKilledOrPlayerNear";  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
									// Setting this in the mission file overrides the defaults 

#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  
