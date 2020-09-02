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

//diag_log "[blckeagls] Spawning Red Mission with template = default";
_crateLoot = blck_BoxLoot_Red;
_lootCounts = blck_lootCountsRed;
_startMsg = "An enemy Camp was sighted in a nearby sector! Check the Red marker on your map for the location!";
_endMsg = "The Camp at the Red Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[300,300],"Solid"];
_markerColor = "ColorRed";
_markerMissionName = "Nachschublager";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Tower_V1_F",[-8.1167,-39.0396,-0.00143862],180.738,true,true,[["O_HMG_01_high_F",[-4.98901,13.312,-0.0121193],359.999],["O_HMG_01_high_F",[-4.88916,0.893799,17.8798],359.999],["O_GMG_01_high_F",[2.86377,5.15186,17.7791],0.00110346],["O_GMG_01_high_F",[3.12354,-4.59814,17.8788],0.00619121],["O_HMG_01_high_F",[8.82837,21.6572,-0.0121193],359.999],["O_GMG_01_high_F",[-3.55591,26.4539,-0.0118098],360]],[]],
     ["Land_Cargo_Tower_V1_F",[-8.7854,37.2058,-0.00143862],180.738,true,true,[["O_HMG_01_high_F",[-4.1167,-15.228,-0.0121188],359.999],["O_GMG_01_high_F",[-5.05029,0.812012,17.8801],359.999],["O_HMG_01_high_F",[2.97925,4.90308,17.7791],359.995],["O_HMG_01_high_F",[3.02808,-5.19946,17.8776],359.987],["O_HMG_01_high_F",[9.59595,-22.2854,-0.0121188],359.999],["O_GMG_01_high_F",[-1.95337,-25.9678,-0.0118098],360]],[]],
     ["Land_Cargo_HQ_V1_F",[41.5171,-35.4209,-0.00143814],88.7297,true,true,[["O_HMG_01_high_F",[-4.19043,0.419922,3.1134],360],["O_GMG_01_high_F",[1.2395,-6.33594,3.11891],359.998]],[]],
     ["Land_Cargo_HQ_V1_F",[41.6394,35.6191,-0.00143814],271.277,true,true,[["O_HMG_01_high_F",[1.75781,6.54565,3.11813],359.998]],[]],
     ["Land_Cargo_Patrol_V1_F",[58.7402,-14.1282,-0.00143814],179.058,true,true,[["O_HMG_01_high_F",[0.936523,-0.546631,4.55561],186.318],["O_HMG_01_high_F",[-8.49658,3.90869,-0.0121207],0.00101132]],[]],
     ["Land_Cargo_Patrol_V1_F",[58.6057,14.2329,-0.00143814],359.375,true,true,[["O_GMG_01_high_F",[1.16113,-1.15356,4.33123],360],["O_HMG_01_high_F",[-8.44897,-1.0686,-0.0121198],359.999]],[]]
];

_missionLandscape = [
     //["babe_helper",[-3950.48,-2427.52,-0.00143862],0,true,true],
     //["Sign_Arrow_Green_F",[-3947.98,-2428.02,-0.00143862],0,true,true],
     //["Sign_Arrow_F",[-3947.98,-2428.02,-0.00143862],0,true,true],
     //["Sign_Arrow_Yellow_F",[-3947.98,-2428.02,-0.00143862],0,true,true],
     ["Land_LampHalogen_F",[-16.9238,-29.4194,-0.00143814],175.993,true,true],
     ["Land_HBarrierBig_F",[-16.6211,-36.4802,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-16.6907,-44.7676,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-16.8193,-28.7813,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-17.0107,-4.99146,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-16.8831,-20.9722,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-16.813,-12.6887,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-16.9338,3.10571,-0.00143862],271.533,true,true],
     ["Land_LampHalogen_F",[-17.1384,26.0154,-0.00143814],175.993,true,true],
     ["Land_HBarrierBig_F",[-17.126,26.9011,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-17.0623,19.092,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-16.8643,11.3931,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-17.0559,35.1846,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[-17.2517,42.8821,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[10.6238,-49.76,-0.00143862],1.58276,true,true],
     ["Land_HBarrierBig_F",[4.90186,-29.2209,-0.00143862],181.755,true,true],
     ["Land_HBarrierBig_F",[2.92627,-49.9541,-0.00143862],1.58276,true,true],
     ["Land_HBarrierBig_F",[-3.42188,-29.1743,-0.00143862],181.755,true,true],
     ["Land_HBarrierBig_F",[-5.36133,-49.8767,-0.00143862],1.58276,true,true],
     ["Land_HBarrierBig_F",[-13.5088,-49.9219,-0.00143862],1.58276,true,true],
     ["Land_HBarrierBig_F",[13.3582,-29.1738,-0.00143862],181.755,true,true],
     ["Land_HBarrierBig_F",[-11.5808,-29.1753,-0.00143862],181.755,true,true],
     ["Land_LampHalogen_F",[6.08081,-17.4399,-0.00143814],183.353,true,true],
     ["Land_Cargo_House_V1_F",[5.85425,-11.7749,-0.00143862],178.957,true,true],
     ["Land_Cargo_House_V1_F",[12.7263,-11.8384,-0.00143862],180.484,true,true],
     ["Land_Cargo_House_V1_F",[6.03076,-23.2114,-0.00143862],0.530105,true,true],
     ["Land_Cargo_House_V1_F",[-9.97656,-7.45703,-0.00143862],270.031,true,true],
     ["Land_Cargo_House_V1_F",[-9.95679,-0.756836,-0.00143862],270.244,true,true],
     ["Land_Cargo_House_V1_F",[12.6707,-23.292,-0.00143862],0.742551,true,true],
     ["Land_LampHalogen_F",[4.89917,14.9739,-0.00143814],183.353,true,true],
     ["Land_HBarrierBig_F",[3.46533,26.0403,-0.00143862],181.755,true,true],
     ["Land_HBarrierBig_F",[-4.86035,26.0867,-0.00143862],181.755,true,true],
     ["Land_HBarrierBig_F",[11.9197,26.0874,-0.00143862],181.755,true,true],
     ["Land_HBarrierBig_F",[-13.1709,26.1252,-0.00143862],181.755,true,true],
     ["Land_Cargo_House_V1_F",[-9.93091,6.11108,-0.00143862],268.716,true,true],
     ["Land_Cargo_House_V1_F",[11.5469,20.5737,-0.00143862],180.484,true,true],
     ["Land_Cargo_House_V1_F",[11.4912,9.12012,-0.00143862],0.742551,true,true],
     ["Land_Cargo_House_V1_F",[4.6748,20.6372,-0.00143862],178.957,true,true],
     ["Land_Cargo_House_V1_F",[4.79419,9.20044,-0.00143862],0.530105,true,true],
     ["Land_HBarrierBig_F",[-13.959,47.9253,-0.00143862],1.51588,true,true],
     ["Land_HBarrierBig_F",[10.1702,48.1106,-0.00143862],1.51588,true,true],
     ["Land_HBarrierBig_F",[1.88428,48.1787,-0.00143862],1.51588,true,true],
     ["Land_HBarrierBig_F",[-6.26294,48.124,-0.00143862],1.51588,true,true],
     ["Land_LampHalogen_F",[37.4138,-49.6885,-0.00143814],86.6613,true,true],
     ["Land_HBarrierBig_F",[18.4333,-49.7061,-0.00143862],1.58276,true,true],
     ["Land_HBarrierBig_F",[21.7261,-29.1707,-0.00143862],181.755,true,true],
     ["Land_HBarrierBig_F",[34.4153,-49.5938,-0.00143862],1.58276,true,true],
     ["Land_HBarrierBig_F",[42.5332,-49.4375,-0.00143862],1.58276,true,true],
     ["Land_HBarrierBig_F",[26.7168,-49.782,-0.00143862],1.58276,true,true],
     ["Land_LampHalogen_F",[24.2969,-4.63354,-0.00143814],175.763,true,true],
     ["Land_LampHalogen_F",[24.0779,2.92041,-0.00143814],175.763,true,true],
     ["Land_HBarrierBig_F",[24.7175,-16.5247,-0.00143862],270.156,true,true],
     ["Land_HBarrierBig_F",[24.5884,-8.51978,-0.00143862],270.156,true,true],
     ["Land_HBarrierBig_F",[20.874,3.03345,-0.00143862],181.755,true,true],
     ["Land_HBarrierBig_F",[24.8879,-24.3479,-0.00143862],270.156,true,true],
     ["Land_HBarrierBig_F",[21.095,-4.52222,-0.00143862],181.755,true,true],
     ["Land_Cargo_House_V1_F",[19.4255,-11.8789,-0.00143862],180.272,true,true],
     ["Land_Cargo_House_V1_F",[19.5381,-23.3779,-0.00143862],359.215,true,true],
     ["Land_HBarrierBig_F",[24.0823,6.26489,-0.00143862],270.156,true,true],
     ["Land_HBarrierBig_F",[23.7832,22.0911,-0.00143862],270.156,true,true],
     ["Land_HBarrierBig_F",[23.9121,14.0862,-0.00143862],270.156,true,true],
     ["Land_HBarrierBig_F",[20.2896,26.0906,-0.00143862],181.755,true,true],
     ["Land_Cargo_House_V1_F",[18.3564,9.03589,-0.00143862],359.215,true,true],
     ["Land_Cargo_House_V1_F",[18.2441,20.533,-0.00143862],180.272,true,true],
     ["Land_LampHalogen_F",[37.1499,49.4319,-0.00143814],270.972,true,true],
     ["Land_HBarrierBig_F",[17.8696,48.312,-0.00143862],1.51588,true,true],
     ["Land_HBarrierBig_F",[33.9624,48.3108,-0.00143862],1.51588,true,true],
     ["Land_HBarrierBig_F",[25.6785,48.3774,-0.00143862],1.51588,true,true],
     ["Land_HBarrierBig_F",[41.6587,48.5078,-0.00143862],1.51588,true,true],
     ["Land_HBarrierBig_F",[53.832,-28.3086,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[53.8938,-44.4204,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[53.9326,-36.322,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[50.8213,-49.5146,-0.00143862],1.58276,true,true],
     ["Land_LampHalogen_F",[61.6257,-8.93774,-0.00143814],183.353,true,true],
     ["Land_HBarrierBig_F",[53.5598,-12.5808,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[58.1006,-9.04248,-0.00143862],180.639,true,true],
     ["Land_HBarrierBig_F",[53.6702,-20.0735,-0.00143862],271.533,true,true],
     ["Land_LampHalogen_F",[61.2739,9.27808,-0.00143814],183.353,true,true],
     ["Land_HBarrierBig_F",[57.9741,9.22607,-0.00143862],180.457,true,true],
     ["Land_HBarrierBig_F",[53.0159,20.7566,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[53.2136,13.0596,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[53.0928,28.8538,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[53.1624,37.1411,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[52.9644,44.8403,-0.00143862],271.533,true,true],
     ["Land_HBarrierBig_F",[49.8362,48.4373,-0.00143862],1.51588,true,true]
];

_missionLootBoxes = [
     [selectRandom blck_crateTypes,[-2.28174,0.128662,-0.00143862],_crateLoot,_lootCounts,0.000181514]
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["Exile_Car_Hunter",[24.8054,-67.8333,0.00875282],89.6558],
     ["Exile_Car_HEMMT",[24.8997,69.1799,-0.00138235],91.5468],
     ["O_LSV_02_armed_F",[74.0911,1.21655,-0.0377212],359.999]
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
_minNoAI = blck_MinAI_Red;
_maxNoAI = blck_MaxAI_Red;
_noAIGroups = blck_AIGrps_Red;
_noVehiclePatrols = blck_SpawnVeh_Red;
_noEmplacedWeapons = blck_SpawnEmplaced_Red;
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

_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
