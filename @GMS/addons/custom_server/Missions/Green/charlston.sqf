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

_crateLoot = blck_BoxLoot_Green;
_lootCounts = blck_lootCountsGreen;
_startMsg = "Camp Charlston is being built by the enemy in a nearby sector.";
_endMsg = "Camp Charleston is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[200,200],"Solid"];
_markerColor = "ColorGreen";
_markerMissionName = "Camp Charleston";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Patrol_V1_F",[4.47693,-36.1753,-0.00143862],0,true,true,[["B_HMG_01_high_F",[1.09753,-0.78125,4.33092],182.337],["B_HMG_01_high_F",[-8.18188,3.96289,-0.0121179],270.389],["B_HMG_01_high_F",[11.7308,-7.875,-0.0121193],181.165]],[]],
     ["Land_Cargo_Tower_V1_F",[6.56189,-19.98,-0.00143909],180,true,true,[["B_HMG_01_high_F",[12.7545,4.6084,-0.0121183],225.183],["B_HMG_01_high_F",[-4.78821,0.935547,17.8764],270.571],["B_HMG_01_high_F",[3.17285,4.91357,17.7788],0.00164279]],[]],
     ["Land_Cargo_HQ_V1_F",[2.97693,0.074707,-0.00143862],180,true,true,[["B_HMG_01_high_F",[-5.3407,0.772461,3.1134],181.165]],[]],
     ["Land_Cargo_Patrol_V1_F",[41.4769,-36.1753,-0.00143862],0,true,true,[["B_HMG_01_high_F",[1.27466,-0.849121,4.33092],181.165],["B_HMG_01_high_F",[-7.82532,-8.49463,-0.0121193],181.165]],[]]
];

_missionLandscape = [
     ["Land_CncWall4_F",[-8.77258,1.07471,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[-8.77258,-4.17529,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[-8.77258,6.32471,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[-6.52258,8.57471,-0.00143909],180,true,true],
     ["Land_CncWall1_F",[-8.77258,-7.42529,-0.00143909],90,true,true],
     ["Land_CncWall1_F",[-8.52258,-8.67529,-0.00143909],60,true,true],
     ["Land_New_WiredFence_10m_F",[-9.77258,-4.92529,-0.00143909],90,true,true],
     ["Land_New_WiredFence_10m_F",[-9.77258,5.07471,-0.00143909],90,true,true],
     ["Land_LampShabby_F",[19.8737,-40.29,-0.00143909],149.832,true,true],
     ["Land_BagFence_Round_F",[-4.80505,-33.3926,-0.00143909],45.9826,true,true],
     ["Land_BagFence_Round_F",[14.8495,-44.9292,-0.00143909],45,true,true],
     ["Land_BagFence_Round_F",[-4.76855,-31.2666,-0.00143909],135.983,true,true],
     ["Land_BagFence_Round_F",[14.599,-41.1792,-0.00143909],120,true,true],
     ["Land_BagFence_Long_F",[11.2294,-22.6245,-0.00143909],180,true,true],
     ["Land_BagFence_Long_F",[12.6,-24.3042,-0.00143909],270,true,true],
     ["Land_BagFence_Long_F",[11.224,-25.6792,-0.00143909],180,true,true],
     ["Land_BagFence_Long_F",[-2.69324,-34.1782,-0.00143909],180.983,true,true],
     ["Land_BagFence_Long_F",[17.1,-45.6792,-0.00143909],180,true,true],
     ["Land_BagFence_Long_F",[18.4745,-44.1792,-0.00143909],90,true,true],
     ["Land_CncBarrier_F",[19.975,-35.6792,-0.00143909],270,true,true],
     ["Land_PortableLight_double_F",[7.0155,-26.8413,-0.00143909],270,true,true],
     ["Land_CncWall4_F",[4.47742,-22.6753,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[1.22742,-35.1753,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[3.47742,-37.4253,-0.00143909],0,true,true],
     ["Land_CncWall1_F",[1.47742,-31.9253,-0.00143909],105,true,true],
     ["Land_CncWall1_F",[7.97742,-36.6753,-0.00143909],330,true,true],
     ["Land_CncWall1_F",[6.72742,-37.1753,-0.00143909],345,true,true],
     ["Land_CncWall1_F",[5.31714,-26.9092,-0.00143909],75,true,true],
     ["Land_CncWall1_F",[4.80066,-25.6685,-0.00143909],60,true,true],
     ["Land_BagFence_End_F",[15.9755,-40.3042,-0.00143909],0,true,true],
     ["Land_BagFence_End_F",[-1.75403,-30.4434,-0.00143909],330.983,true,true],
     ["Land_BagFence_End_F",[18.8319,-42.6753,-0.00143909],330,true,true],
     ["Land_BagFence_End_F",[-0.797119,-32.9614,-0.00143909],300.983,true,true],
     ["Land_New_WiredFence_10m_F",[4.97937,-39.5308,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[14.7274,-39.4253,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[0.272339,-34.5835,-0.00143909],90,true,true],
     ["Land_BagFence_Corner_F",[-1.31201,-33.8271,-0.00143909],90.9826,true,true],
     ["Land_BarGate_F",[24.7274,-41.9253,-0.00143909],0,true,true],
     ["Land_Mil_WiredFence_Gate_F",[24.7274,-39.6675,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_Dam_F",[0.227417,-24.6753,-0.00143909],90,true,true],
     ["Land_BagFence_Short_F",[-2.88318,-30.6743,-0.00143909],180.983,true,true],
     ["Land_BagFence_Short_F",[14.224,-43.0542,-0.00143909],270,true,true],
     ["Land_Mil_WallBig_4m_F",[25.6038,-18.8174,-0.00143909],270,true,true],
     ["Land_BagFence_Round_F",[18.3368,-16.3926,-0.00143909],45,true,true],
     ["Land_BagFence_Long_F",[11.349,-18.1792,-0.00143909],180,true,true],
     ["Land_BagFence_Long_F",[12.7245,-16.8042,-0.00143909],90,true,true],
     ["Land_BagFence_Long_F",[11.349,-15.4312,-0.00143909],180,true,true],
     ["Land_BagFence_Long_F",[20.8373,-17.0176,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[-0.272583,-9.17529,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[-5.64758,-9.17529,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[5.10242,-9.17529,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[3.97742,8.57471,-0.00143909],180,true,true],
     ["Land_CncWall4_F",[4.47742,-17.4253,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[8.72742,7.19971,-0.00143909],210,true,true],
     ["Land_CncWall4_F",[-1.27258,8.57471,-0.00143909],180,true,true],
     ["Land_CncWall4_F",[4.48242,-12.2109,-0.00143909],90,true,true],
     ["Land_CncWall4_F",[12.7274,-3.80029,-0.00143909],270,true,true],
     ["Land_CncWall4_F",[12.7274,1.44971,-0.00143909],270,true,true],
     ["Land_CncWall1_F",[11.6024,-7.92529,-0.00143909],315,true,true],
     ["Land_CncWall1_F",[11.6024,5.44971,-0.00143909],210,true,true],
     ["Land_CncWall1_F",[12.4774,4.57471,-0.00143909],240,true,true],
     ["Land_CncWall1_F",[10.6024,-8.55029,-0.00143909],345,true,true],
     ["Land_CncWall1_F",[12.3524,-6.92529,-0.00143909],300,true,true],
     ["Land_New_WiredFence_10m_F",[14.9774,9.57471,-0.00143909],180,true,true],
     ["Land_New_WiredFence_10m_F",[4.97742,9.57471,-0.00143909],180,true,true],
     ["Land_New_WiredFence_10m_F",[-5.27258,-9.42529,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[-5.02258,9.57471,-0.00143909],180,true,true],
     ["Land_New_WiredFence_10m_F",[0.227417,-14.6753,-0.00143909],90,true,true],
     ["Land_CncShelter_F",[8.84314,-9.19678,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_Dam_F",[24.9774,-0.050293,-0.00143909],180,true,true],
     ["Land_New_WiredFence_10m_Dam_F",[19.7274,5.07471,-0.00143909],270,true,true],
     ["Land_BagFence_Short_F",[17.7123,-14.3945,-0.00143909],90,true,true],
     ["Land_Mil_WallBig_4m_F",[23.4019,-2.35938,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[17.7269,-11.4253,-0.00143909],270,true,true],
     ["Land_Mil_WallBig_4m_F",[19.2269,-6.17529,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[20.0457,-13.5703,-0.00143909],180,true,true],
     ["Land_Mil_WallBig_4m_F",[21.1479,-4.53125,-0.00143909],270,true,true],
     ["Land_LampShabby_F",[29.5619,-40.2676,-0.00143909],210,true,true],
     ["Land_LampShabby_F",[40.4146,-21.3286,-0.00143909],326.67,true,true],
     ["Land_BagFence_Round_F",[34.9688,-45.8774,-0.00143909],315,true,true],
     ["Land_BagFence_Round_F",[32.8423,-45.8774,-0.00143909],45,true,true],
     ["Land_BagFence_Long_F",[35.7183,-43.7524,-0.00143909],90,true,true],
     ["Land_CncBarrier_F",[29.725,-35.5542,-0.00143909],270,true,true],
     ["Land_CncWall4_F",[41.7274,-38.6753,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[43.9774,-36.4253,-0.00143909],270,true,true],
     ["Land_CncWall1_F",[38.4774,-38.4253,-0.00143909],15,true,true],
     ["Land_CncWall1_F",[37.2401,-37.894,-0.00143909],30,true,true],
     ["Land_CncWall1_F",[43.7274,-33.1753,-0.00143909],255,true,true],
     ["Land_BagFence_End_F",[34.4688,-41.8774,-0.00143909],210,true,true],
     ["Land_BagFence_End_F",[31.9678,-42.8774,-0.00143909],240,true,true],
     ["Land_New_WiredFence_10m_F",[44.515,-24.8999,-0.00143909],270,true,true],
     ["Land_New_WiredFence_10m_F",[34.7274,-39.1753,-0.00143909],0,true,true],
     ["Land_New_WiredFence_10m_F",[44.515,-34.6499,-0.00143909],270,true,true],
     ["Land_BagFence_Corner_F",[35.3433,-42.3774,-0.00143909],0,true,true],
     ["Land_New_WiredFence_5m_F",[42.2655,-39.1499,-0.00143909],0,true,true],
     ["Land_BagFence_Short_F",[32.2178,-44.0024,-0.00143909],90,true,true],
     ["Land_Mil_WallBig_4m_F",[39.1169,-22.2583,-0.00143909],180,true,true],
     ["Land_Mil_WallBig_4m_F",[31.9081,-20.9619,-0.00143909],180,true,true],
     ["Land_Mil_WallBig_4m_F",[41.4412,-20.3794,-0.00143909],90,true,true],
     ["Land_Mil_WallBig_4m_F",[27.9435,-20.9658,-0.00143909],180,true,true],
     ["Land_Cargo_HQ_V1_F",[33.7463,-12.4639,-0.00143862],271.492,true,true],
     ["Land_New_WiredFence_10m_F",[44.4774,-4.92529,-0.00143909],270,true,true],
     ["Land_New_WiredFence_10m_F",[44.4774,-14.9253,-0.00143909],270,true,true],
     ["Land_New_WiredFence_10m_F",[34.9774,-0.175293,-0.00143909],180,true,true],
     ["Land_New_WiredFence_5m_F",[42.4774,-0.175293,-0.00143909],180,true,true],
     ["Land_Mil_WallBig_4m_F",[31.3369,-2.34375,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[41.4467,-8.47168,-0.00143909],90,true,true],
     ["Land_Mil_WallBig_4m_F",[41.4458,-12.4146,-0.00143909],90,true,true],
     ["Land_Mil_WallBig_4m_F",[41.4386,-16.4019,-0.00143909],90,true,true],
     ["Land_Mil_WallBig_4m_F",[35.2737,-2.33789,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[41.4539,-4.48438,-0.00143909],90,true,true],
     ["Land_Mil_WallBig_4m_F",[39.1295,-2.32617,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[27.3386,-2.35352,-0.00143909],0,true,true]
];

_missionLootBoxes = [];

_missionLootVehicles = [];

_missionPatrolVehicles = [
     ["B_G_Offroad_01_armed_F",[21.4174,19.0781,0.00804281],90.3115],
     ["B_G_Offroad_01_armed_F",[27.5131,-53.1431,0.00819397],268.528]
];

_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = [];
_missionGroups = [];

//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Green;
_maxNoAI = blck_MaxAI_Green;
_noAIGroups = blck_AIGrps_Green;
_noVehiclePatrols = blck_SpawnVeh_Green;
_noEmplacedWeapons = blck_SpawnEmplaced_Green;
_uniforms = blck_SkinList;
_headgear = blck_headgear;
_chanceLoot = 0.6; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [blck_contructionLoot,blck_contructionLoot,blck_highPoweredLoot,blck_supportLoot];
private _paralootCountsChoices = [[0,0,0,8,8,0],[0,0,0,8,8,0],[8,8,0,0,0,0],[0,0,0,0,12,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.
_endCondition =  blck_missionEndCondition; // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
