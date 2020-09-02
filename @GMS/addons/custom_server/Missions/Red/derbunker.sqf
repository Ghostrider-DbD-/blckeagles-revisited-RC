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
_startMsg = "An enemy Bunker was sighted in a nearby sector! Check the Red marker on your map for the location!";
_endMsg = "The Bunker at the Red Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[300,300],"Solid"];
_markerColor = "ColorRed";
_markerMissionName = "DerBunker";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Bunker_01_big_F",[-15.925,9.02295,0.760561],90.071,true,true,[["O_HMG_01_high_F",[-5.45947,-3.38574,0.109706],359.994]],[]],
     ["Land_Bunker_01_tall_F",[-15.377,-8.8042,-0.00143909],90.071,true,true,[["O_HMG_01_high_F",[5.50562,-2.54395,-0.0121193],0.00145215],["O_HMG_01_high_F",[-1.72095,-0.109375,4.96893],0.00948966]],[]],
     ["Land_Bunker_01_tall_F",[-15.76,28.606,-0.00143909],90.071,true,true,[["O_HMG_01_high_F",[5.47437,2.47559,-0.0121179],0.000581241],["O_HMG_01_high_F",[-1.38867,-0.0722656,4.967],359.999],["O_HMG_01_high_F",[11.8271,5.87988,-0.0121188],0.00143633]],[]],
     ["Land_Bunker_01_big_F",[20.199,10.729,0.760561],270.416,true,true,[["O_HMG_01_high_F",[5.86328,3.25586,0.109697],0.0117801]],[]],
     ["Land_Bunker_01_tall_F",[19.8899,-8.86914,-0.00143909],270.416,true,true,[["O_HMG_01_high_F",[-5.13818,-2.33496,-0.0121174],0.0002874],["O_HMG_01_high_F",[1.45801,0.0512695,4.96698],360]],[]],
     ["Land_Bunker_01_tall_F",[19.731,28.542,-0.00143909],270.416,true,true,[["O_HMG_01_high_F",[-5.00977,2.1792,-0.0121188],0.00143735],["O_HMG_01_high_F",[1.80957,0.26709,4.96756],360],["O_HMG_01_high_F",[-12.0127,6.1333,-0.0121193],0.00145178]],[]]
];

_missionLandscape = [
     //["Sign_Arrow_F",[-3163.22,-5166.85,-0.00143909],0,true,true],
     //["Sign_Arrow_Green_F",[-3163.22,-5166.85,-0.00143909],0,true,true],
     //["Sign_Arrow_Yellow_F",[-3163.22,-5166.85,-0.00143909],0,true,true],
     //["babe_helper",[-3165.72,-5166.35,-0.00143909],90.8645,true,true],
     ["Land_Bunker_01_blocks_3_F",[-13.762,17.5518,-0.00143909],270.35,true,true],
     ["Land_Bunker_01_blocks_3_F",[-0.0979004,-12.9033,-0.00143909],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[-5.18799,-12.9092,-0.00143909],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[-10.175,-12.9253,-0.502439],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[-13.814,-4.44141,-0.00143909],270.35,true,true],
     ["Land_Bunker_01_blocks_3_F",[-13.7959,0.544922,-0.00143909],270.35,true,true],
     ["CamoNet_INDP_big_F",[2.23804,-2.70508,-0.00143909],182.545,true,true],
     ["Land_Bunker_01_blocks_3_F",[-13.7451,22.5391,-0.00143909],270.35,true,true],
     ["Land_Bunker_01_blocks_3_F",[-2.51611,30.105,-0.00143909],90.192,true,true],
     ["Land_Bunker_01_blocks_3_F",[-10.6179,32.6689,-0.432439],0.106,true,true],
     ["Land_Bunker_01_blocks_3_F",[-5.63013,32.6719,-0.00143909],0.106,true,true],
     ["Land_Bunker_01_blocks_3_F",[17.958,2.1958,-0.00143909],90.695,true,true],
     ["Land_Bunker_01_blocks_3_F",[14.9771,-12.854,-0.529439],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[4.88892,-12.8853,-0.00143909],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[17.9109,-2.78906,-0.00143909],90.695,true,true],
     ["Land_Bunker_01_blocks_3_F",[9.98999,-12.8711,-0.00143909],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[6.58691,30.1689,-0.00143909],269.774,true,true],
     ["Land_Bunker_01_blocks_3_F",[18.095,19.2026,-0.00143909],90.695,true,true],
     ["Land_Bunker_01_blocks_3_F",[18.1409,24.189,-0.00143909],90.695,true,true],
     ["Land_Bunker_01_blocks_3_F",[9.54907,32.6689,-0.00143909],0.106,true,true],
     ["Land_Bunker_01_blocks_3_F",[14.5359,32.6729,-0.363439],0.106,true,true]
];

_missionLootBoxes = [
     [selectRandom blck_crateTypes,[0.0446777,-1.31494,-0.001441],_crateLoot,_lootCounts,0.00167282]
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["O_LSV_02_armed_F",[-37.46,8.55273,-0.0378561],359.999],
     ["O_LSV_02_unarmed_F",[38.3699,8.21484,-0.0378113],359.999]
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
