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
_startMsg = "An Anemy Ammunition Depot was sighted in a nearby sector! Check the Orange marker on your map for the location!";
_endMsg = "The Ammunition depot at the Orange Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[200,200],"Solid"];
_markerColor = "ColorOrange";
_markerMissionName = "Ammunition Depot";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_MilOffices_V1_F",[0.936035,53.2339,-0.00146103],0.0551743,true,true,[["B_HMG_01_high_F",[-14.6453,4.44092,0.48988],0.00164355],["B_HMG_01_high_F",[16.2224,2.84473,0.48988],0.00164314],["B_HMG_01_high_F",[16.2043,-18.5793,-0.0121188],360],["B_HMG_01_high_F",[19.0071,-25.5498,-0.0121188],360]],[]]
];



_missionLandscape = [
     //["babe_helper",[-3584.79,-2745.02,-0.00146103],0,true,true],
     //["Sign_Arrow_Green_F",[-3582.29,-2745.52,-0.00146103],0,true,true],
     //["Sign_Arrow_F",[-3582.29,-2745.52,-0.00146103],0,true,true],
     //["Sign_Arrow_Yellow_F",[-3582.29,-2745.52,-0.00146103],0,true,true],
     ["Land_dp_smallTank_F",[-23.4897,0.757568,-0.00146103],315.055,true,true],
     ["Land_HBarrier_Big_F",[-30.251,0.998047,-0.00146103],90.6364,true,true],
     ["Land_HBarrier_Big_F",[-30.0261,-4.99609,-0.00146103],88.8324,true,true],
     ["Land_HBarrier_Big_F",[-24.3879,-7.97534,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[-15.9822,-8.03101,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[-7.62939,-8.03394,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[-30.4287,8.68091,-0.00146103],90.6364,true,true],
     ["Land_HBarrier_Big_F",[-30.5715,17.0325,-0.00146103],90.6364,true,true],
     ["Land_HBarrier_Big_F",[-30.8035,33.8059,-0.00146103],90.6364,true,true],
     ["Land_HBarrier_Big_F",[-30.7122,25.4006,-0.00146103],90.6364,true,true],
     ["Land_i_Barracks_V1_F",[-21.0911,25.2551,-0.00146103],270.055,true,true],
     ["Land_LampHalogen_F",[-30.0498,68.0146,-0.00146055],240.055,true,true],
     ["Land_Medevac_house_V1_F",[-25.7917,63.0088,-0.00146103],359.798,true,true],
     ["Land_Medevac_house_V1_F",[-25.821,54.4678,-0.00146103],179.534,true,true],
     ["Land_Tank_rust_F",[-26.2607,48.0527,-0.00146103],180.055,true,true],
     ["Land_HBarrier_Big_F",[-26.0667,70.3225,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[-0.915771,70.2883,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[-9.30811,70.2639,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[-17.6609,70.2668,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[-30.9465,42.1575,-0.00146103],90.6364,true,true],
     ["Land_HBarrier_Big_F",[-31.3367,67.2683,-0.00146103],90.6364,true,true],
     ["Land_HBarrier_Big_F",[-31.1025,50.5112,-0.00146103],90.6364,true,true],
     ["Land_HBarrier_Big_F",[-31.1938,58.9167,-0.00146103],90.6364,true,true],
     ["Land_LampHalogen_F",[12.158,-7.74023,-0.00146055],90.0552,true,true],
     ["Land_HBarrier_Big_F",[17.4336,-8.0415,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[25.7888,-8.03149,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[0.675049,-7.98291,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[9.08105,-8.03857,-0.00146103],181.637,true,true],
     ["Land_HelipadSquare_F",[31.1362,2.08008,-0.00146103],180.086,true,true],
     ["Land_BagFence_Long_F",[23.658,6.82251,-0.00146103],90.0552,true,true],
     ["Land_BagFence_Long_F",[14.4004,5.9585,-0.00146103],90.0552,true,true],
     ["Land_i_Shed_Ind_F",[0.762939,3.73413,-0.00146103],179.98,true,true],
     ["Land_PortableLight_double_F",[19.6589,24.5911,-0.00146103],240.055,true,true],
     ["Land_BagFence_Round_F",[13.7778,8.4668,-0.00146103],225.055,true,true],
     ["Land_BagFence_Round_F",[24.2874,9.32739,-0.00146103],135.055,true,true],
     ["Land_CncWall4_F",[19.353,37.1301,-0.00146103],269.856,true,true],
     ["Land_CncWall4_F",[19.3921,31.9155,-0.00146103],269.856,true,true],
     ["Land_BagFence_Long_F",[11.2759,9.09644,-0.00146103],180.055,true,true],
     ["Land_BagFence_Long_F",[26.7832,9.94385,-0.00146103],0.0551743,true,true],
     ["Land_LampHalogen_F",[19.0601,40.1711,-0.00146055],315.055,true,true],
     ["Land_HBarrier_Big_F",[15.8428,70.2297,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[7.49023,70.2327,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[24.198,70.2397,-0.00146103],181.637,true,true],
     ["Land_CncWall4_F",[22.377,40.0833,-0.00146103],0,true,true],
     ["Land_CncWall4_F",[27.5962,40.116,-0.00146103],0,true,true],
     ["Land_LampHalogen_F",[45.8774,-7.93433,-0.00146055],60.0552,true,true],
     ["Land_LampHalogen_F",[45.5952,6.93604,-0.00146055],180.055,true,true],
     ["Land_Tank_rust_F",[43.6697,0.581299,-0.00146103],90.0552,true,true],
     ["Land_HBarrier_Big_F",[42.5474,-8.09009,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[47.6099,-4.77002,-0.00146103],90.055,true,true],
     ["Land_HBarrier_Big_F",[34.1946,-8.08716,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[47.4333,3.63403,-0.00146103],90.055,true,true],
     ["Land_BagFence_Round_F",[53.0293,5.18921,-0.00146103],315.055,true,true],
     ["Land_BagFence_Long_F",[50.5286,4.56616,-0.00146103],180.055,true,true],
     ["Land_BagFence_Long_F",[39.7786,6.70166,-0.00146103],90.0552,true,true],
     ["Land_Wall_IndCnc_Pole_F",[46.9377,21.1001,-0.00146103],90.0552,true,true],
     ["Land_Shed_Big_F",[31.9468,31.2043,-0.00146151],89.7488,true,true],
     ["Land_HBarrier_Big_F",[46.9426,33.5571,-0.00146103],90.055,true,true],
     ["Land_HBarrier_Big_F",[47.1191,25.1531,-0.00146103],90.055,true,true],
     ["Land_BagFence_Round_F",[39.1563,9.17456,-0.00146103],225.055,true,true],
     ["Land_BagFence_Round_F",[53.0469,24.4275,-0.00146103],225.055,true,true],
     ["Land_BagFence_Long_F",[36.6648,9.80176,-0.00146103],180.055,true,true],
     ["Land_BagFence_Long_F",[53.6729,21.9277,-0.00146103],90.0552,true,true],
     ["Land_BagFence_Long_F",[50.5496,25.0559,-0.00146103],180.055,true,true],
     ["Land_BagFence_Long_F",[53.6707,7.68921,-0.00146103],270.055,true,true],
     ["Land_BarGate_F",[47.6548,14.5193,-0.00146103],90.0552,true,true],
     ["Land_LampHalogen_F",[44.5273,41.2136,-0.00146055],60.0552,true,true],
     ["Land_HBarrier_Big_F",[46.7148,41.9067,-0.00146103],90.055,true,true],
     ["Land_HBarrier_Big_F",[46.2976,58.6626,-0.00146103],90.055,true,true],
     ["Land_HBarrier_Big_F",[32.6038,70.1841,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[40.9565,70.1812,-0.00146103],181.637,true,true],
     ["Land_HBarrier_Big_F",[46.0698,67.0122,-0.00146103],90.055,true,true],
     ["Land_HBarrier_Big_F",[46.4741,50.2585,-0.00146103],90.055,true,true],
     ["Land_CncWall4_F",[37.9797,40.1345,-0.00146103],0,true,true],
     ["Land_CncWall4_F",[32.7908,40.125,-0.00146103],0,true,true],
     ["Land_CncWall4_F",[43.1743,40.1436,-0.00146103],0,true,true],
     ["Land_TTowerBig_1_F",[33.9404,56.3271,-0.00146103],0.0551743,true,true]
];

_missionLootBoxes = [
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["B_G_Offroad_01_armed_F",[-51.5793,28.9631,0.00801468],179.03],
     ["B_G_Offroad_01_armed_F",[9.30664,88.3091,0.00802708],89.9029],
     ["B_G_Offroad_01_armed_F",[72.2974,6.63599,0.00802183],0.00106337]
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
_paraSkill = "Orange";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.

_chanceLoot = 0.7; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [blck_contructionLoot,blck_contructionLoot,blck_highPoweredLoot,blck_supportLoot];
private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  
