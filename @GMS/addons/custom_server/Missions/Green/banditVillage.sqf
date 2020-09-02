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
_startMsg = "An enemy village was sighted in a nearby sector! Check the Green marker on your map for the location!";
_endMsg = "The Sector at the Green Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[225,225],"GRID"];
_markerColor = "ColorGreen";
_markerMissionName = "Village";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"


_garrisonedBuildings_BuildingPosnSystem = [
     ["Land_Unfinished_Building_02_F",[-28.137,-48.6494,0],0,true,true,0.67,3,[],4],
     ["Land_i_Shop_02_V2_F",[22.688,35.2515,0],0,true,true,0.67,3,[],4]
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Unfinished_Building_02_F",[-28.3966,34.8145,0],0,true,true,[["B_HMG_01_high_F",[-5.76953,1.16504,7.2248],0]],[]],
     ["Land_Unfinished_Building_02_F",[20.1816,-44.2554,0],0,true,true,[],[[[4.68567,3.59082,0.257384],0],[[-5.20032,5.66797,3.96986],0]]]
];

_missionLandscape = [
     ["Land_i_House_Big_02_V3_F",[-64.5577,-100.259,0],0,true,true],
     ["Land_u_House_Big_01_V1_F",[-65.2944,63.9878,0],0,true,true],
    // ["Sign_Sphere100cm_F",[-25.4528,-44.6294,0.617091],0,true,true],
    // ["Sign_Arrow_Direction_Green_F",[24.8673,-40.6646,0.257384],0,true,true],
    // ["Sign_Arrow_Direction_Green_F",[14.9813,-38.5874,3.96986],0,true,true],
     //["Sign_Arrow_F",[10.937,-14.8413,1.03653],0,true,true],
    // ["Sign_Sphere100cm_F",[18.4126,35.3154,0.501973],0,true,true],
     ["Land_i_House_Big_02_V1_F",[53.7161,-101.875,0],0,true,true],
     ["Land_i_House_Big_02_V2_F",[52.6943,66.0278,0],0,true,true]
];

_missionLootBoxes = [
    selectRandom[
     ["Box_IND_AmmoOrd_F",[-25.7473,-46.3496,3.73],_crateLoot,_lootCounts,0],
     ["Box_NATO_Ammo_F",[-31.2815,14.4961,0],_crateLoot,_lootCounts,0],
     ["Box_AAF_Equip_F",[-2.56213,-16.4194,0],_crateLoot,_lootCounts,0],
     ["Box_IND_AmmoOrd_F",[3.29309,-24.7749,0],_crateLoot,_lootCounts,0],
     ["Box_NATO_Wps_F",[18.3497,-0.543945,0],_crateLoot,_lootCounts,0]
    ]
];

_missionLootVehicles = [
    // ["",[10.937,-14.8413,1.03653],_crateLoot,_lootCounts,0]
];

_missionPatrolVehicles = [
     //["B_LSV_01_armed_F",[-1.72583,-70.4502,0],0],
     //["B_MRAP_01_gmg_F",[-3.95642,50.4224,-9.53674e-007],0],
    // ["B_G_Van_01_transport_F",[11.2654,-13.9736,-0.000131607],0]
];

_submarinePatrolParameters = [
];

_airPatrols = [
     ["B_Heli_Light_01_dynamicLoadout_F",[-52.1934,-2.21387,0],0]
];

_missionEmplacedWeapons = [
     ["B_HMG_01_high_F",[-34.1661,35.9795,7.2248],0],
     ["B_GMG_01_high_F",[43.4441,-24.4961,0],0]
];

_missionGroups = [
     [[-31.2625,5.21875,0.00143909],3,6,"Green",30,45],
     [[-3.32458,-42.5176,0.00143909],3,6,"Green",30,45],
     [[-7.85986,-2.72217,0.00143909],3,6,"Green",30,45],
     [[-2.06714,36.3027,0.00143909],3,6,"Green",30,45],
     [[29.3705,-18.0239,0.00143909],3,6,"Green",30,45]
];

_scubaGroupParameters = [
];


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
//_endCondition =   // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
