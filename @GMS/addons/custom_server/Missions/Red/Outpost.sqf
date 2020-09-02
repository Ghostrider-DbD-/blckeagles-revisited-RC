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
_startMsg = "An Anemy Outpost was sighted in a nearby sector! Check the Red marker on your map for the location!";
_endMsg = "The Outpost at the Red Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[200,200],"Solid"];
_markerColor = "ColorRed";
_markerMissionName = "Outpost";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Patrol_V3_F",[-25.0786,-7.48535,-0.00143814],91.041,true,true,[["B_HMG_01_high_F",[-1.1084,-1.16431,4.33092],0.000110027]],[]],
     ["Land_Cargo_Patrol_V3_F",[-12.2451,10.7849,-0.00143814],181.041,true,true,[["B_HMG_01_high_F",[-1.25928,1.22339,4.33092],0.00719478],["B_HMG_01_high_F",[3.44727,7.05835,-0.0121179],0.0015095],["B_HMG_01_high_F",[12.4185,7.21094,-0.0121183],0.00126386]],[]],
     ["Land_Cargo_Patrol_V3_F",[24.0273,-12.3459,-0.00143814],269.838,true,true,[["B_HMG_01_high_F",[1.03076,-1.20874,4.33092],359.999],["B_HMG_01_high_F",[-11.6992,1.96533,-0.0121193],0.00189448]],[]],
     ["Land_Cargo_HQ_V3_F",[6.30029,-0.909424,-0.00143814],270.038,true,true,[["B_HMG_01_high_F",[4.31299,-1.39307,3.70484],47.4694],["B_HMG_01_high_F",[-9.66064,-15.759,-0.0121193],0.00274103]],[]]
];



_missionLandscape = [
     //["Sign_Arrow_F",[-5049.41,-2726.72,-0.00143862],0,true,true],
     //["Sign_Arrow_Green_F",[-5049.41,-2726.72,-0.00143862],0,true,true],
     //["Sign_Arrow_Yellow_F",[-5049.41,-2726.72,-0.00143862],0,true,true],
     //["babe_helper",[-5051.91,-2726.22,-0.00143862],78.6345,true,true],
     ["Land_HBarrier_Big_F",[-28.8394,-8.42627,-0.00143862],91.041,true,true],
     ["Land_CncShelter_F",[-10.0513,-26.2283,-0.00143862],0.0913576,true,true],
     ["Land_HBarrierWall6_F",[0.581543,-12.7048,-0.00143862],91.041,true,true],
     ["Land_HBarrierWall6_F",[-19.6943,-14.0881,-0.00143862],271.041,true,true],
     ["Land_HBarrierWall6_F",[-5.04932,-19.8594,-0.00143862],181.041,true,true],
     ["Land_HBarrier_Big_F",[-25.6514,-11.7356,-0.00143862],181.041,true,true],
     ["Land_BagFence_Round_F",[-3.4668,-15.3809,-0.00143862],166.041,true,true],
     ["Land_BagFence_Round_F",[-14.3892,-29.0183,-0.00143862],31.041,true,true],
     ["Land_BagFence_Round_F",[-7.70801,-28.5588,-0.00143862],46.041,true,true],
     ["Land_BagFence_Round_F",[-14.9326,-26.8369,-0.00143862],121.041,true,true],
     ["Land_BagFence_Round_F",[-12.2075,-28.4763,-0.00143862],301.041,true,true],
     ["Land_BagFence_Round_F",[-4.56348,-17.2019,-0.00143862],76.041,true,true],
     ["Land_BagFence_Round_F",[-5.41797,-26.3496,-0.00143862],226.041,true,true],
     ["Land_BagFence_Round_F",[-5.45801,-28.5986,-0.00143862],316.041,true,true],
     ["Land_HBarrierWall_corridor_F",[-10.1372,-24.7649,-0.00143862],271.041,true,true],
     ["Land_HBarrierWall4_F",[-13.7993,-19.9495,-0.00143862],181.041,true,true],
     ["Land_HBarrierWall_corner_F",[-19.2007,-20,-0.00143862],181.041,true,true],
     ["Land_HBarrierWall_corner_F",[0.711426,-19.4619,-0.00143862],91.041,true,true],
     ["Land_LampShabby_F",[-19.8394,5.67236,-0.00143862],136.041,true,true],
     ["Land_CncShelter_F",[-5.49072,10.4077,-0.00143862],181.041,true,true],
     ["Land_HBarrierWall6_F",[-19.7158,-1.58594,-0.00143862],271.041,true,true],
     ["Land_HBarrier_Big_F",[-25.4941,-3.23608,-0.00143862],1.04101,true,true],
     ["Land_HBarrier_Big_F",[-12.9121,14.7922,-0.00143862],181.041,true,true],
     ["Land_HBarrier_Big_F",[-16.2207,11.6028,-0.00143862],271.041,true,true],
     ["Land_HBarrier_Big_F",[-7.72217,11.448,-0.00143862],91.041,true,true],
     ["Land_HelipadSquare_F",[-9.93359,-5.85596,-0.00143862],0.362537,true,true],
     ["Land_BagFence_Round_F",[-9.72363,18.6138,-0.00143862],136.041,true,true],
     ["Land_BagFence_Round_F",[0.90918,18.9221,-0.00143862],226.041,true,true],
     ["Land_BagFence_Round_F",[-7.59863,18.5762,-0.00143862],226.041,true,true],
     ["Land_BagFence_Round_F",[-1.21631,18.9595,-0.00143862],136.041,true,true],
     ["Land_BagFence_Long_F",[-7.02197,15.9382,-0.00143862],91.041,true,true],
     ["Land_BagFence_Long_F",[1.48633,16.2864,-0.00143862],91.041,true,true],
     ["Land_BagFence_Long_F",[-1.88379,16.5967,-0.00143862],91.041,true,true],
     ["Land_BagFence_Long_F",[-10.3921,16.2498,-0.00143862],91.041,true,true],
     ["Land_HBarrierWall_corridor_F",[-1.52295,8.83716,-0.00143862],181.041,true,true],
     ["Land_HBarrierWall4_F",[3.81348,13.4924,-0.00143862],1.04101,true,true],
     ["Land_HBarrierWall4_F",[-6.83154,5.68286,-0.00143862],1.04101,true,true],
     ["Land_HBarrierWall4_F",[-16.5835,5.60962,-0.00143862],1.04101,true,true],
     ["Land_HBarrierWall_corner_F",[-19.8418,5.16846,-0.00143862],271.041,true,true],
     ["Land_HBarrierWall_corner_F",[-0.694824,13.0745,-0.00143862],271.041,true,true],
     ["Land_LampShabby_F",[9.37598,-10.3596,-0.00143862],1.04101,true,true],
     ["Land_HBarrierWall6_F",[7.20605,-19.8293,-0.00143862],181.041,true,true],
     ["Land_HBarrierWall6_F",[6.87402,-10.5664,-0.00143862],181.041,true,true],
     ["Land_HBarrier_Big_F",[24.5322,-16.5854,-0.00143862],179.838,true,true],
     ["Land_HBarrier_Big_F",[24.5107,-8.08472,-0.00143862],359.838,true,true],
     ["Land_HBarrier_Big_F",[27.7676,-11.3262,-0.00143862],269.838,true,true],
     ["Land_BagFence_Round_F",[13.2651,-9.68359,-0.00143862],226.041,true,true],
     ["Land_BagFence_Round_F",[11.1396,-9.64404,-0.00143862],136.041,true,true],
     ["Land_HBarrierWall4_F",[13.9541,-19.9521,-0.00143862],181.041,true,true],
     ["Land_Cargo_House_V3_F",[7.46289,-15.906,-0.00143862],271.041,true,true],
     ["Land_HBarrierWall_corner_F",[18.2109,-19.53,-0.00143862],91.041,true,true],
     ["Land_LampShabby_F",[18.0684,13.9841,-0.00143862],226.041,true,true],
     ["Land_HBarrierWall6_F",[17.8833,3.73438,-0.00143862],91.041,true,true],
     ["Land_HBarrierWall6_F",[17.9854,-4.51611,-0.00143862],91.041,true,true],
     ["Land_HBarrierWall6_F",[10.5679,13.6208,-0.00143862],1.04101,true,true],
     ["Land_HBarrierWall4_F",[17.7358,9.23999,-0.00143862],91.041,true,true],
     ["Land_HBarrierWall_corner_F",[17.3179,13.7493,-0.00143862],1.04101,true,true]
];

_missionLootBoxes = [
     [selectRandom blck_crateTypes,[-9.93359,-5.85596,0],_crateLoot,_lootCounts,0.000320471]       
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["B_G_Offroad_01_armed_F",[35.8379,4.96387,0.00813246],0.00104452]
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
