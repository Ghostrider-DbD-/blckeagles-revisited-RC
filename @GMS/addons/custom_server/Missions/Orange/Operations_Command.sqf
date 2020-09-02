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

//diag_log "[blckeagls] Spawning Orange Mission with template = default";
_crateLoot = blck_BoxLoot_Orange;
_lootCounts = blck_lootCountsOrange;
_startMsg = "An Operations Command was sighted in a nearby sector! Check the Orange marker on your map for the location!";
_endMsg = "The Operations Command at the Orange Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[300,300],"Solid"];
_markerColor = "ColorOrange";
_markerMissionName = "Operations Command";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Patrol_V3_F",[-26.1375,13.395,-0.00143862],104.247,true,true,[["O_HMG_01_high_F",[-1.16919,-1.02051,4.33092],359.999]],[]],
     ["Land_Cargo_Tower_V3_F",[0.0512695,-43.2329,-0.00143909],1.37485,true,true,[["O_HMG_01_high_F",[-11.6333,3.14819,-0.0121188],360],["O_Mortar_01_F",[-3.08325,4.21802,17.9254],0.000187431],["O_GMG_01_high_F",[-3.21069,-3.16113,17.8767],360],["O_GMG_01_high_F",[4.70557,-0.741943,17.8767],360]],[]],
     ["Land_Cargo_Patrol_V3_F",[-22.3018,-36.6943,-0.00143862],16.3749,true,true,[["O_HMG_01_high_F",[-1.44019,-0.544922,4.33092],0.000570454],["O_HMG_01_high_F",[-6.95337,5.57886,-0.0121193],359.998]],[]],
     ["Land_Cargo_HQ_V3_F",[0.157227,3.02832,-0.00143862],91.3748,true,true,[["O_Mortar_01_F",[1.9917,1.24707,3.16241],359.999],["O_HMG_01_high_F",[-4.22266,1.80176,3.1134],359.999],["O_HMG_01_high_F",[3.10205,-5.8584,3.1134],359.999],["O_HMG_01_high_F",[-6.48584,7.63452,-0.0121193],359.998],["O_HMG_01_high_F",[9.13306,15.3284,-0.0121193],359.998]],[]],
     ["Land_Cargo_Tower_V3_F",[-16.1003,25.6072,-0.00143909],181.375,true,true,[["O_HMG_01_high_F",[3.25903,3.35229,17.8764],359.997],["O_GMG_01_high_F",[-4.9707,0.915771,17.8767],359.995]],[]],
     ["Land_Cargo_Patrol_V3_F",[21.9438,-2.25854,-0.00143862],269.918,true,true,[["O_GMG_01_high_F",[1.11499,0.921387,4.33123],360]],[]],
     ["Land_Cargo_House_V3_F",[7.7749,-26.0698,-0.00143909],1.37485,true,true,[["O_HMG_01_high_F",[2.2688,8.65552,-0.0121188],360]],[]]
];



_missionLandscape = [
     ["CamoNet_OPFOR_open_F",[-31.8352,-29.0081,-0.00143909],235.13,true,true],
     ["CamoNet_OPFOR_open_F",[-43.8352,-16.6941,-0.00143909],181.375,true,true],
     ["Land_HBarrier_Big_F",[-37.4087,-8.59814,-0.00143909],286.375,true,true],
     ["Land_HBarrier_Big_F",[-29.3643,-37.0271,-0.00143909],37.1575,true,true],
     ["Land_HBarrier_Big_F",[-35.4788,-31.5889,-0.00143909],50.6964,true,true],
     ["Land_HBarrier_Big_F",[-38.9624,-25.2727,-0.00143909],255.154,true,true],
     ["Land_BagBunker_Large_F",[-43.364,-16.4709,-0.00143909],91.3748,true,true],
     ["Land_HBarrier_Big_F",[-34.405,-1.28906,-0.00143909],301.375,true,true],
     ["Land_HBarrier_Big_F",[-29.0862,14.3416,-0.00143909],286.375,true,true],
     ["Land_HBarrier_Big_F",[-31.1816,6.38184,-0.00143909],286.375,true,true],
     ["Land_LampHalogen_F",[-29.8584,2.74854,-0.00143862],256.375,true,true],
     ["Land_HBarrierWall_corridor_F",[-16.1533,-40.845,-0.00143909],106.375,true,true],
     ["Land_HBarrier_Big_F",[-10.9395,-43.5535,-0.00143909],13.6286,true,true],
     ["Land_HBarrier_Big_F",[-3.8855,-44.2878,-0.00143909],0.866833,true,true],
     ["Land_HBarrier_Big_F",[-22.3318,-40.6543,-0.00143909],200.888,true,true],
     ["Land_HBarrier_Big_F",[4.41016,-44.2852,-0.00143909],0.866833,true,true],
     ["Land_HBarrier_5_F",[2.9043,-17.4326,-0.00143909],271.375,true,true],
     ["Land_HBarrier_5_F",[-5.53174,-9.47681,-0.00143909],181.375,true,true],
     ["Land_Cargo_House_V3_F",[-1.97241,-25.8367,-0.00143909],1.37485,true,true],
     ["Land_HBarrier_Big_F",[-9.21558,-15.051,-0.00143909],271.375,true,true],
     ["Land_HBarrier_Big_F",[-5.97168,-20.2385,-0.00143909],181.375,true,true],
     ["Land_HBarrier_Big_F",[2.51318,-20.2158,-0.00143909],181.375,true,true],
     ["Land_HBarrier_3_F",[2.83398,-22.9663,-0.00143909],91.3748,true,true],
     ["Land_HBarrier_3_F",[2.75586,-26.2246,-0.00143909],91.3748,true,true],
     ["Land_HBarrier_3_F",[2.94287,-10.5574,-0.00143909],271.375,true,true],
     ["Land_HBarrier_3_F",[0.964355,-9.63477,-0.00143909],1.37485,true,true],
     ["Land_HBarrier_3_F",[-6.09448,-25.2507,-0.00143909],271.375,true,true],
     ["Land_HBarrier_3_F",[1.72021,-27.6951,-0.00143909],1.37485,true,true],
     ["Land_HBarrier_3_F",[-6.02515,-22.2542,-0.00143909],271.375,true,true],
     ["Land_HBarrier_3_F",[4.84912,-27.7708,-0.00143909],1.37485,true,true],
     ["Land_HBarrier_3_F",[-5.15039,-27.5239,-0.00143909],1.37485,true,true],
     ["Land_HelipadCircle_F",[-22.2104,-10.7046,-0.00143909],90.8075,true,true],
     ["Land_TTowerBig_2_F",[-3.03882,-15.5251,-0.00143909],1.37485,true,true],
     ["Land_HBarrier_5_F",[-24.4253,17.3018,-0.00143909],194.949,true,true],
     ["Land_HBarrier_5_F",[-12.988,7.96045,-0.00143909],181.375,true,true],
     ["Land_HBarrier_5_F",[-26.457,9.23633,-0.00143909],16.5662,true,true],
     ["Land_Cargo_House_V3_F",[-15.2529,3.47607,-0.00143909],91.3748,true,true],
     ["Land_HBarrier_Big_F",[-5.96069,14.4766,-0.00143909],1.375,true,true],
     ["Land_HBarrier_Big_F",[2.22437,14.509,-0.00143909],1.375,true,true],
     ["Land_HBarrier_Big_F",[-9.21826,9.43896,-0.00143909],271.375,true,true],
     ["Land_HBarrier_Big_F",[-9.23389,1.12988,-0.00143909],271.375,true,true],
     ["Land_HBarrier_Big_F",[-9.2439,-6.94019,-0.00143909],271.375,true,true],
     ["Land_HBarrier_Big_F",[-26.9719,22.2693,-0.00143909],286.375,true,true],
     ["Land_HBarrier_3_F",[-10.071,23.9849,-0.00143909],91.3748,true,true],
     ["Land_HBarrier_Big_F",[-14.6584,26.7698,-0.00143909],1.375,true,true],
     ["Land_HBarrier_Big_F",[-22.5229,26.7314,-0.00143909],1.375,true,true],
     ["Land_HBarrier_Big_F",[-6.28784,26.8616,-0.00143909],1.375,true,true],
     ["Land_HBarrier_Big_F",[1.70752,25.8137,-0.00143909],16.375,true,true],
     ["CamoNet_OPFOR_open_F",[13.4675,-46.5574,-0.00143909],256.375,true,true],
     ["Land_BagBunker_Large_F",[13.6731,-46.6125,-0.00143909],346.375,true,true],
     ["Land_HBarrier_Big_F",[25.0122,-8.42798,-0.00143909],89.245,true,true],
     ["Land_HBarrier_Big_F",[20.2207,-26.6072,-0.00143909],346.375,true,true],
     ["Land_HBarrier_Big_F",[10.3425,-20.1804,-0.00143909],181.375,true,true],
     ["Land_HBarrier_Big_F",[13.3196,-15.1829,-0.00143909],91.375,true,true],
     ["Land_HBarrier_Big_F",[25.2847,-22.1433,-0.00143909],89.8961,true,true],
     ["Land_HBarrier_Big_F",[15.2939,-23.981,-0.00143909],61.375,true,true],
     ["Land_HBarrier_Big_F",[17.6921,-30.4187,-0.00143909],261.124,true,true],
     ["Land_HBarrier_Big_F",[18.2314,-37.9956,-0.00143909],275.055,true,true],
     ["Land_HBarrier_1_F",[26.3027,-13.0132,-0.00143909],224.245,true,true],
     ["Land_HBarrier_1_F",[26.3459,-17.553,-0.00143909],134.896,true,true],
     ["Land_HBarrier_3_F",[24.4424,-13.2629,-0.00143909],179.245,true,true],
     ["Land_HBarrier_3_F",[23.5449,-11.0381,-0.00143909],89.245,true,true],
     ["Land_HBarrier_3_F",[23.5166,-19.6731,-0.00143909],269.896,true,true],
     ["Land_HBarrier_3_F",[24.4841,-17.4751,-0.00143909],359.896,true,true],
     ["Land_HBarrier_3_F",[26.4421,-11.2278,-0.00143909],89.245,true,true],
     ["Land_HBarrier_3_F",[26.521,-19.3137,-0.00143909],269.896,true,true],
     ["Land_Tank_rust_F",[17.9231,-22.1641,-0.00143909],238.726,true,true],
     ["Land_LampHalogen_F",[25.1262,-18.7678,-0.00143862],151.326,true,true],
     ["Land_LampHalogen_F",[25.188,-11.5505,-0.00143862],241.375,true,true],
     ["Land_HBarrierWall_corridor_F",[8.88965,13.3088,-0.00143909],76.3748,true,true],
     ["Land_HBarrierWall_corridor_F",[11.9426,4.98389,-0.00143909],1.37485,true,true],
     ["Land_HBarrierWall_corridor_F",[14.0635,10.1843,-0.00143909],331.375,true,true],
     ["CamoNet_OPFOR_open_F",[16.8806,13.8459,-0.00143909],46.3748,true,true],
     ["Land_HBarrierWall4_F",[12.9727,17.2073,-0.00143909],301.375,true,true],
     ["Land_HBarrierWall4_F",[13.927,14.678,-0.00143909],241.375,true,true],
     ["Land_HBarrier_Big_F",[24.7051,-0.242188,-0.00143909],89.245,true,true],
     ["Land_HBarrier_Big_F",[8.90503,22.6189,-0.00143909],33.6192,true,true],
     ["Land_HBarrier_Big_F",[13.2727,-6.86401,-0.00143909],91.375,true,true],
     ["Land_HBarrier_Big_F",[24.3503,8.13452,-0.00143909],89.245,true,true],
     ["Land_HBarrier_Big_F",[13.3027,-0.90332,-0.00143909],91.375,true,true],
     ["Land_BagBunker_Small_F",[20.2654,17.5417,-0.00143909],226.375,true,true],
     ["Land_LampHalogen_F",[10.6421,2.27686,-0.00143862],241.375,true,true],
     ["Land_LampHalogen_F",[11.4541,10.5645,-0.00143862],136.375,true,true],
     ["Land_HBarrierWall_corner_F",[21.3845,12.748,-0.00143909],46.3748,true,true],
     ["Land_HBarrierWall_corner_F",[15.5208,19.1467,-0.00143909],346.375,true,true],
     ["Land_HBarrierWall_corner_F",[18.5425,9.32104,-0.00143909],136.375,true,true]
];

_missionLootBoxes = [
      [selectRandom blck_crateTypes,[-22.2104,-10.704,0],_crateLoot,_lootCounts,0.000320471]        
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["O_LSV_02_unarmed_F",[-53.4402,-44.895,-0.037971],359.999],
     ["O_LSV_02_armed_F",[7.56689,40.9209,-0.0379591],359.999],
     ["O_LSV_02_armed_F",[38.9788,-44.417,-0.0373936],359.999]
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = []; //



//////////
//   The lines below define additional variables you may wish to configure.


//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Orange;
_maxNoAI = blck_MaxAI_Orange;
_noAIGroups = blck_AIGrps_Orange;
_noVehiclePatrols = blck_SpawnVeh_Orange;
_noEmplacedWeapons = blck_SpawnEmplaced_Orange;
//_uniforms = blck_SkinList;
//_headgear = blck_headgear;

_chancePara = 0.75; // Setting this in the mission file overrides the defaults 
_noPara = 5;  // Setting this in the mission file overrides the defaults 
_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
_paraSkill = "Red";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.

_chanceLoot = 0.7; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [blck_contructionLoot,blck_contructionLoot,blck_highPoweredLoot,blck_supportLoot];
private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

_endCondition = blck_missionEndCondition; // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  
