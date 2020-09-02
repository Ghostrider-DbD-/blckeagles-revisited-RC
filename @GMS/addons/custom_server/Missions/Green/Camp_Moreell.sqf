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

//diag_log "[blckeagls] Spawning Green Mission with template = default";
_crateLoot = blck_BoxLoot_Green;
_lootCounts = blck_lootCountsGreen;
_startMsg = "Enemy Camp Moreell was built in a nearby sector! Check the Green marker on your map for the location!";
_endMsg = "The Camp Moreell at the Green Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[200,200],"Solid"];
_markerColor = "ColorGreen";
_markerMissionName = "Camp Moreell";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Patrol_V3_F",[-3.45557,32.6038,-0.00143814],163.034,true,true,[["O_HMG_01_high_F",[-1.75244,0.382568,4.33092],0.00157772]],[]],
     ["Land_Cargo_HQ_V3_F",[1.5835,1.53711,-0.00143814],90.021,true,true,[["O_HMG_01_high_F",[-4.53003,1.89331,3.1134],270.551],["O_Mortar_01_F",[0.884277,-5.92041,3.1624],178.341],["O_GMG_01_high_F",[-11.2842,-8.48218,-0.0118098],221.694],["O_HMG_01_high_F",[-12.6897,-6.82007,-0.0121179],236.126],["O_GMG_01_high_F",[10.885,-11.4487,-0.0118084],147.658],["O_GMG_01_high_F",[19.3098,-6.53003,-0.0118093],147.655]],[]],
     ["Land_Cargo_Patrol_V3_F",[10.9478,34.4741,-0.00143814],195.395,true,true,[["O_HMG_01_high_F",[1.41943,0.690674,4.33092],359.999]],[]]
];



_missionLandscape = [
     ["Land_HBarrier_Big_F",[-14.1831,0.348877,-0.00143862],54.7855,true,true],
     ["Land_HBarrier_1_F",[-7.70728,-8.24048,-0.00143862],295.873,true,true],
     ["Land_BagFence_Long_F",[-11.6091,-6.83057,-0.00143862],45.3947,true,true],
     ["Land_BagFence_Round_F",[-12.8318,-4.68042,-0.00143862],90.3947,true,true],
     ["Land_BagFence_Round_F",[-9.44946,-8.13599,-0.00143862],0.394724,true,true],
     ["Land_Cargo_House_V3_F",[-11.8579,27.8225,-0.00143862],341.505,true,true],
     ["CamoNet_OPFOR_open_F",[-14.8772,18.198,-0.00143862],90.3947,true,true],
     ["Land_HBarrier_Big_F",[-24.5461,25.9207,-0.00143862],195.395,true,true],
     ["Land_HBarrier_Big_F",[-7.8335,30.6655,-0.00143862],255.395,true,true],
     ["Land_HBarrier_Big_F",[-24.0242,10.8638,-0.00143862],165.395,true,true],
     ["Land_HBarrier_Big_F",[-18.0986,7.95679,-0.00143862],255.395,true,true],
     ["Land_HBarrier_Big_F",[-19.7212,22.9065,-0.00143862],90.3947,true,true],
     ["Land_HBarrier_Big_F",[-31.6633,25.0271,-0.00143862],150.395,true,true],
     ["Land_HBarrier_Big_F",[-12.3518,34.6216,-0.00143862],345.395,true,true],
     ["Land_HBarrier_Big_F",[-17.9399,30.3276,-0.00143862],300.395,true,true],
     ["Land_HBarrier_Big_F",[-19.3733,16.4546,-0.00143862],90.3947,true,true],
     ["Land_HBarrier_1_F",[-32.8965,12.5454,-0.00143862],42.5069,true,true],
     ["Land_HBarrier_1_F",[-30.3511,10.0146,-0.00143862],42.5069,true,true],
     ["CamoNet_OPFOR_big_F",[-27.2468,18.4834,-0.00143862],75.3947,true,true],
     ["Land_BagFence_Round_F",[-33.3694,10.7087,-0.00143862],87.5069,true,true],
     ["Land_BagFence_Round_F",[-31.8938,9.28491,-0.00143862],357.507,true,true],
     ["Land_HBarrier_5_F",[9.15552,-4.91626,-0.00143862],269.593,true,true],
     ["Land_HBarrier_5_F",[9.13477,0.585938,-0.00143862],269.593,true,true],
     ["Land_Cargo_House_V3_F",[25.2329,2.59155,-0.00143862],105.395,true,true],
     ["Land_HBarrier_Big_F",[-2.57373,-8.99463,-0.00143862],180.395,true,true],
     ["Land_HBarrier_Big_F",[26.4961,-2.62256,-0.00143862],195.395,true,true],
     ["Land_HBarrier_Big_F",[5.79712,-8.80371,-0.00143862],180.395,true,true],
     ["Land_HBarrier_1_F",[14.0208,-8.50757,-0.00143862],334.157,true,true],
     ["Land_HBarrier_1_F",[22.1511,-3.42603,-0.00143862],324.626,true,true],
     ["Land_HBarrier_1_F",[19.1423,-5.3833,-0.00143862],324.626,true,true],
     ["Land_HBarrier_1_F",[10.7295,-9.9397,-0.00143862],334.157,true,true],
     ["Land_BagFence_Round_F",[22.5408,-5.08765,-0.00143862],279.626,true,true],
     ["Land_BagFence_Round_F",[20.8389,-6.23145,-0.00143862],9.62595,true,true],
     ["Land_BagFence_Round_F",[14.1299,-10.2107,-0.00143862],289.157,true,true],
     ["Land_BagFence_Round_F",[12.262,-11.0569,-0.00143862],19.157,true,true],
     ["Land_HBarrier_5_F",[7.05835,9.52783,-0.00143862],181.048,true,true],
     ["Land_HBarrier_5_F",[26.3564,29.2161,-0.00143862],195.395,true,true],
     ["Land_HBarrier_5_F",[9.08203,5.92139,-0.00143862],269.593,true,true],
     ["Land_HBarrier_Big_F",[18.55,34.8018,-0.00143862],195.395,true,true],
     ["Land_HBarrier_Big_F",[1.32568,35.1333,-0.00143862],255.395,true,true],
     ["Land_HBarrier_Big_F",[7.22388,36.5254,-0.00143862],285.395,true,true],
     ["Land_HBarrier_Big_F",[-4.35571,36.8228,-0.00143862],345.395,true,true],
     ["Land_HBarrier_Big_F",[7.04761,30.9424,-0.00143862],195.395,true,true],
     ["Land_BagFence_Long_F",[24.1768,15.7207,-0.00143862],105.395,true,true],
     ["Land_BagFence_Long_F",[22.7461,10.5283,-0.00143862],285.395,true,true],
     ["Land_HBarrier_3_F",[25.4558,17.1135,-0.00143862],195.395,true,true],
     ["Land_HBarrier_3_F",[22.7898,29.1609,-0.00143862],285.395,true,true],
     ["Land_HBarrier_3_F",[23.3201,8.88696,-0.00143862],195.395,true,true],
     ["Land_HBarrier_Big_F",[12.9075,38.3318,-0.00143862],195.395,true,true],
     ["Land_HBarrier_Big_F",[30.9158,1.41919,-0.00143862],105.395,true,true],
     ["Land_HBarrier_5_F",[29.5054,24.8923,-0.00143862],269.593,true,true],
     ["Land_HBarrier_5_F",[29.5303,19.5947,-0.00143862],269.593,true,true],
     ["CamoNet_OPFOR_open_F",[28.1597,12.0786,-0.00143862],195.395,true,true],
     ["Land_HBarrier_Big_F",[31.4031,16.592,-0.00143862],0.394724,true,true],
     ["Land_HBarrier_Big_F",[28.876,7.35913,-0.00143862],195.395,true,true],
     ["Land_HBarrier_1_F",[33.3733,10.5449,-0.00143862],15.3947,true,true],
     ["Land_HBarrier_1_F",[27.9988,12.1958,-0.00143862],195.395,true,true],
     ["Land_BagFence_Long_F",[32.6428,9.11694,-0.00143862],285.395,true,true],
     ["Land_BagFence_Long_F",[28.4683,13.8879,-0.00143862],105.395,true,true],
     ["Land_HBarrier_3_F",[29.9619,29.1274,-0.00143862],105.395,true,true],
     ["Land_HBarrier_3_F",[34.8462,14.4836,-0.00143862],90.3947,true,true],
     ["Land_BagBunker_Large_F",[27.696,35.6018,-0.00143862],195.395,true,true]
];

_missionLootBoxes = [
      [selectRandom blck_crateTypes,[9.8,9.8,0],_crateLoot,_lootCounts,0.000320471]  
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["O_LSV_02_armed_F",[34.9805,-28.0225,-0.0376697],359.999]
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [

];



//////////
//   The lines below define additional variables you may wish to configure.


//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Green;
_maxNoAI = blck_MaxAI_Green;
_noAIGroups = blck_AIGrps_Green;
_noVehiclePatrols = blck_SpawnVeh_Green;
_noEmplacedWeapons = blck_SpawnEmplaced_Green;
//_uniforms = blck_SkinList;
//_headgear = blck_headgear;

//_chancePara = 0.75; // Setting this in the mission file overrides the defaults 
//_noPara = 5;  // Setting this in the mission file overrides the defaults 
//_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
//_paraSkill = "Green";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.

//_chanceLoot = 0.7; 
//private _lootIndex = selectRandom[1,2,3,4];
//private _paralootChoices = [blck_contructionLoot,blck_contructionLoot,blck_highPoweredLoot,blck_supportLoot];
//private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
//_paraLoot = _paralootChoices select _lootIndex;
//_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  
