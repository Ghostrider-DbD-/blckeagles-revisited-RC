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
_startMsg = "A IDAP HQ was sighted in a nearby sector! Check the Blue marker on your map for the location!";
_endMsg = "The IDAP HQ at the Blue Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[200,200],"Solid"];
_markerColor = "ColorBlue";
_markerMissionName = "IDAP";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Patrol_V3_F",[-24.0081,2.26978,-0.00143814],126.833,true,true,[["B_G_HMG_02_high_F",[-0.0534668,1.83252,4.38749],311.417]],[]],
     ["Land_Cargo_Patrol_V3_F",[-5.29565,-28.9109,-0.00143814],1.92,true,true,[["B_G_HMG_02_high_F",[1.3645,-1.13159,4.38749],184.956]],[]],
     ["Land_Cargo_HQ_V3_F",[-0.00732422,-3.21069,-0.00143814],270.541,true,true,[["B_G_HMG_02_high_F",[1.68311,6.03589,3.16996],360]],[]]
];


_missionLandscape = [
     ["Land_Sign_WarningMilitaryArea_F",[-7.08057,-34.5996,-0.00143862],2.31973,true,true],
     ["Land_CncShelter_F",[-11.4443,-31.9636,-0.00143862],0,true,true],
     ["Land_CncShelter_F",[-11.4595,-33.4424,-0.00143862],0,true,true],
     ["Land_HBarrier_Big_F",[-13.7441,-29.9917,-0.00143862],270.667,true,true],
     ["Land_HBarrier_Big_F",[-28.533,-12.366,-0.00143862],92.486,true,true],
     ["Land_HBarrier_Big_F",[-25.606,-19.6677,-0.00143862],223.764,true,true],
     ["Land_HBarrier_Big_F",[-18.7449,-24.3645,-0.00143862],29.6621,true,true],
     ["Land_HBarrier_Big_F",[-9.21753,-20.6865,-0.00143862],92.486,true,true],
     ["Land_HBarrier_Big_F",[-9.28906,-28.9602,-0.00143862],92.486,true,true],
     ["CamoNet_OPFOR_big_F",[-21.7307,-10.7373,1.64043],272.913,true,true],
     ["Land_Cargo_House_V3_F",[-13.5071,0.647949,-0.00143862],0.832826,true,true],
     ["Land_HBarrier_Big_F",[-8.40747,-6.52612,-0.00143862],269.796,true,true],
     ["Land_HBarrier_Big_F",[-20.4199,6.59521,-0.00143862],180.674,true,true],
     ["Land_HBarrier_Big_F",[-11.9136,6.71753,-0.00143862],180.674,true,true],
     ["Land_HBarrier_Big_F",[-28.7576,-3.9104,-0.00143862],269.796,true,true],
     ["Land_HBarrier_Big_F",[-8.60986,1.66675,-0.00143862],269.796,true,true],
     ["Land_HBarrier_Big_F",[-26.3406,3.49731,-0.00143862],305.711,true,true],
     ["CamoNet_OPFOR_F",[5.36572,-16.136,0.610557],90.0482,true,true],
     ["Land_HBarrier_Big_F",[0.511719,-24.9692,-0.00143862],2.055,true,true],
     ["Land_HBarrier_Big_F",[6.54102,-21.916,-0.00143862],307.294,true,true],
     ["Land_HBarrier_Big_F",[-1.5127,-29.9829,-0.00143862],270.667,true,true],
     ["Land_HBarrier_Big_F",[8.75342,-14.7712,-0.00143862],269.796,true,true],
     ["Land_HBarrier_Big_F",[-6.03955,-33.3083,-0.00143862],2.055,true,true],
     ["Land_HBarrier_5_F",[-5.41772,-20.895,-0.00143862],2.05508,true,true],
     ["Land_HBarrier_Big_F",[8.23633,2.08301,-0.00143862],269.796,true,true],
     ["Land_HBarrier_Big_F",[-3.49609,6.90259,-0.00143862],180.674,true,true],
     ["Land_HBarrier_Big_F",[8.43506,-6.2915,-0.00143862],269.796,true,true],
     ["Land_HBarrier_Big_F",[4.94263,6.96313,-0.00143862],180.674,true,true],
     ["CargoNet_01_barrels_F",[-22.2239,-18.2131,-0.00143814],0.000125958,true,true],
     ["CargoNet_01_barrels_F",[6.12988,-10.5715,-0.00143862],0.000316873,true,true],
     ["CargoNet_01_barrels_F",[4.43457,-19.3284,-0.00143862],3.40987e-006,true,true]
];

_missionLootBoxes = [
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["B_G_Offroad_01_armed_F",[3.04663,-40.3821,0.00804186],262.322]
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [

];

_missionGroups = [
     //[[-19.4963,-14.0864,4.76837e-007],3,6,"Red",30,45],
     //[[-14.4426,-4.01489,4.76837e-007],3,6,"Red",30,45],
     //[[-1.97192,-13.9941,4.76837e-007],3,6,"Red",30,45]
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
_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
									// Setting this in the mission file overrides the defaults 

#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  
