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
_startMsg = "A Service Point was sighted in a nearby sector! Check the Blue marker on your map for the location!";
_endMsg = "The Service Point at the Blue Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[200,200],"Solid"];
_markerColor = "ColorBlue";
_markerMissionName = "Service Point";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Patrol_V1_F",[-19.2107,-30.5151,-0.00143814],0,true,true,[["B_G_HMG_02_high_F",[1.16187,-1.16968,4.38749],177.998],["B_G_HMG_02_high_F",[-2.16211,13.6677,0.0444469],95.0891]],[]],
     ["Land_Cargo_Patrol_V1_F",[-0.0581055,-30.4399,-0.00143814],0,true,true,[["B_G_HMG_02_high_F",[-1.44629,-1.22632,4.38749],184.401]],[]]
];

_missionLandscape = [
     ["Land_RoadBarrier_01_F",[-9.31006,-35.3601,-0.00143862],0,true,true],
     ["Land_Sign_WarningMilitaryArea_F",[-2.61255,-36.5635,-0.00143862],359.892,true,true],
     ["Land_HBarrierBig_F",[-24.6367,-14.2813,-0.00143862],271.204,true,true],
     ["Land_HBarrierBig_F",[-18.7668,-25.9514,-0.00143862],0.792412,true,true],
     ["Land_HBarrierBig_F",[-24.3547,-22.8525,-0.00143862],269.27,true,true],
     ["Land_HBarrierBig_F",[-24.0122,-31.4038,-0.00143862],269.27,true,true],
     ["Land_HBarrierBig_F",[-18.7783,-34.6914,-0.00143862],0.792412,true,true],
     ["Land_PaperBox_closed_F",[-21.1392,-13.5237,-0.00143862],0,true,true],
     ["CamoNet_INDP_open_F",[-20.3684,-17.9075,-0.00143862],93.326,true,true],
     ["Land_Device_assembled_F",[-4.73267,4.11304,-0.00143862],0,true,true],
     ["Land_Cargo_House_V1_F",[-12.1433,1.5144,-0.00143862],359.944,true,true],
     ["Land_Cargo_House_V1_F",[-18.6406,-5.72363,-0.00143862],270.169,true,true],
     ["Land_HBarrierBig_F",[-13.1831,7.9502,-0.00143862],181.375,true,true],
     ["Land_HBarrierBig_F",[-24.7129,-5.87695,-0.00143862],271.204,true,true],
     ["Land_HBarrierBig_F",[-4.71753,8.1543,-0.00143862],181.375,true,true],
     ["Land_HBarrierBig_F",[-24.738,2.64307,-0.00143862],271.568,true,true],
     ["Land_HBarrierBig_F",[-21.6355,7.85986,-0.00143862],181.375,true,true],
     ["CargoPlaftorm_01_green_F",[-19.5588,2.55005,-0.00143862],0,true,true],
     ["Land_HBarrierBig_F",[-0.253174,-26.094,-0.00143862],0.792412,true,true],
     ["Land_HBarrierBig_F",[13.2122,-14.0542,-0.00143862],270.301,true,true],
     ["Land_HBarrierBig_F",[8.23169,-25.9136,-0.00143862],359.697,true,true],
     ["Land_HBarrierBig_F",[-0.206543,-34.8694,-0.00143862],359.697,true,true],
     ["Land_HBarrierBig_F",[13.2056,-22.5811,-0.00143862],271.956,true,true],
     ["Land_HBarrierBig_F",[4.76733,-31.5369,-0.00143862],271.956,true,true],
     ["Land_BagFence_Long_F",[15.9219,-12.9792,-0.00143862],359.93,true,true],
     ["Land_PaperBox_closed_F",[2.95581,-21.4031,-0.00143862],327.535,true,true],
     ["Land_PaperBox_closed_F",[9.46167,-21.7529,-0.00143862],88.9779,true,true],
     ["Land_BagFence_Corner_F",[17.7617,-12.5837,-0.00143862],89.1122,true,true],
     ["Land_MedicalTent_01_wdl_generic_outer_F",[6.18726,-18.9663,-0.00143862],90.6678,true,true],
     ["Land_BagFence_Short_F",[18.0669,-11.1177,-0.00143862],270.301,true,true],
     ["Land_Cargo_House_V1_F",[18.2529,0.919678,-0.00143862],359.944,true,true],
     ["Land_RoadBarrier_01_F",[13.8696,-5.63843,-0.00143862],89.9252,true,true],
     ["Land_HBarrierBig_F",[13.0317,2.95288,-0.00143862],271.956,true,true],
     ["Land_HBarrierBig_F",[3.65161,8.21143,-0.00143862],181.375,true,true],
     ["Land_HBarrierBig_F",[9.88525,8.16089,-0.00143862],181.89,true,true],
	 //
     ["B_Slingload_01_Repair_F",[-34.0637,-5.31909,-0.00143814],286.86,true,true],
     ["B_Slingload_01_Ammo_F",[-33.7891,1.13989,-0.00143719],1.26154,true,true],
     ["CargoNet_01_barrels_F",[-20.8491,-21.4822,-0.00143909],326.531,true,true],
     //["Land_Pod_Heli_Transport_04_fuel_F",[-19.5588,2.55005,7.17512],0,true,true],
     ["CargoNet_01_barrels_F",[-7.34326,5.33838,-0.00143862],36,true,true],
     ["B_Slingload_01_Cargo_F",[-28.2134,-3.27197,-0.00143862],347.458,true,true],
     ["B_Slingload_01_Ammo_F",[-1.96753,20.9294,-0.00143814],13.8038,true,true],
     ["B_Slingload_01_Fuel_F",[-4.57788,15.0125,-0.00143862],307.628,true,true],
     ["CargoNet_01_barrels_F",[5.34155,-21.6731,0.269362],13.203,true,true],
     ["B_Slingload_01_Repair_F",[2.70557,16.3206,-0.00143814],299.402,true,true],
     ["CargoNet_01_barrels_F",[2.15674,5.51074,-0.00143957],326.531,true,true],
     ["B_Slingload_01_Cargo_F",[8.86084,17.0483,-0.00143862],360,true,true],
     ["Land_RepairDepot_01_green_F",[5.00415,1.97778,-0.000936985],180.302,true,true]
];

_missionLootBoxes = [
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["B_G_Offroad_01_armed_F",[-8.93213,-44.4866,0.00822115],273.053],
     ["B_G_Offroad_01_armed_F",[16.876,-5.17969,0.00825357],294.284]
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [
     //["B_G_HMG_02_high_F",[-21.3728,-16.8474,0.0430088],95.0891],
     //["B_G_HMG_02_high_F",[16.0146,-12.0088,0.043014],89.3354]
];

_missionGroups = [
     //[[-18.5681,-19.4417,4.76837e-007],3,6,"Red",30,45],
     //[[-9.15723,-30.8086,4.76837e-007],3,6,"Red",30,45],
     //[[7.19946,-18.9819,4.76837e-007],3,6,"Red",30,45],
     //[[3.74561,-8.16309,4.76837e-007],3,6,"Red",30,45]
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
