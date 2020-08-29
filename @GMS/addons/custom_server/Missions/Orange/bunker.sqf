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
_markerType = ["ellipse",[300,300],"Solid"];
_markerColor = "ColorBlack";
_markerMissionName = " Bunker";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Bunker_01_big_F",[-19.0896,9.22754,0.760561],90.071,true,true,[["O_HMG_01_high_F",[-1.09302,-0.0102539,3.2837],0.00152979],["O_HMG_01_high_F",[-5.45947,-3.38574,0.109706],359.994],["O_HMG_01_high_F",[-0.41333,-10.5659,-0.774119],360],["O_HMG_01_high_F",[-0.826416,11.6274,-0.774119],0.00143682],["O_HMG_01_high_F",[11.355,-8.68066,-0.774117],0.000274398]],[]],
     ["Land_Bunker_01_tall_F",[-18.5415,-8.59961,-0.00143909],90.071,true,true,[["O_HMG_01_high_F",[5.50562,-2.54395,-0.0121188],359.999],["O_HMG_01_high_F",[-1.72095,-0.109375,4.96893],359.998],["O_HMG_01_high_F",[11.7644,-6.72168,-0.0121179],0.000580947]],[]],
     ["Land_Bunker_01_tall_F",[-18.9246,28.8105,-0.00143909],90.071,true,true,[["O_HMG_01_high_F",[5.47437,2.47559,-0.0121174],0.000287307],["O_HMG_01_high_F",[-1.38867,-0.0722656,4.967],359.999],["O_HMG_01_high_F",[10.5693,2.00635,-0.0121202],0.00145235],["O_HMG_01_high_F",[11.8271,5.87988,-0.0121174],0.000287344]],[]],
     ["Land_Bunker_01_big_F",[17.0344,10.9336,0.760561],270.416,true,true,[["O_HMG_01_high_F",[0.966064,0.202148,3.2837],0.000261147],["O_HMG_01_high_F",[5.86353,3.25586,0.109696],0.000366296],["O_HMG_01_high_F",[-0.366211,10.3037,-0.774117],0.000287276],["O_HMG_01_high_F",[0.436768,-11.6377,-0.774117],0.000287533],["O_HMG_01_high_F",[-11.8674,-9.59229,-0.774119],359.999]],[]],
     ["Land_Bunker_01_tall_F",[16.7253,-8.66455,-0.00143909],270.416,true,true,[["O_HMG_01_high_F",[-5.13818,-2.33496,-0.0121202],0.00145227],["O_HMG_01_high_F",[1.45801,0.0512695,4.96698],360],["O_HMG_01_high_F",[-10.4924,-6.61719,-0.0121179],0.000581377]],[]],
     ["Land_Bunker_01_tall_F",[16.5664,28.7466,-0.00143909],270.416,true,true,[["O_HMG_01_high_F",[-5.00977,2.1792,-0.0121174],0.000287538],["O_HMG_01_high_F",[1.80957,0.26709,4.96756],0.000969946],["O_HMG_01_high_F",[-10.7739,2.07715,-0.0121174],0.000287469],["O_HMG_01_high_F",[-12.0127,6.1333,-0.0121188],360]],[]]
];



_missionLandscape = [
     //["Sign_Arrow_F",[-3166.38,-5166.64,-0.00143909],0,true,true],
     //["Sign_Arrow_Green_F",[-3166.38,-5166.64,-0.00143909],0,true,true],
     //["Sign_Arrow_Yellow_F",[-3166.38,-5166.64,-0.00143909],0,true,true],
     ["babe_helper",[-3168.88,-5166.14,-0.00143909],87.9418,true,true],
     ["Land_Bunker_01_blocks_3_F",[-16.9785,-4.23682,-0.00143909],270.35,true,true],
     ["Land_Bunker_01_blocks_3_F",[-8.35254,-12.7046,-0.00143909],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[-3.26245,-12.6987,-0.00143909],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[-13.3396,-12.7207,-0.502439],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[-16.9604,0.749512,-0.00143909],270.35,true,true],
     ["Land_Bunker_01_blocks_3_F",[-16.9265,17.7563,-0.00143909],270.35,true,true],
     ["CamoNet_INDP_big_F",[-0.926514,-2.50049,-0.00143909],182.545,true,true],
     ["Land_Bunker_01_blocks_3_F",[-8.79468,32.8765,-0.00143909],0.106,true,true],
     ["Land_Bunker_01_blocks_3_F",[-13.7825,32.8735,-0.432439],0.106,true,true],
     ["Land_Bunker_01_blocks_3_F",[-5.68066,30.3096,-0.00143909],90.192,true,true],
     ["Land_Bunker_01_blocks_3_F",[-16.9097,22.7437,-0.00143909],270.35,true,true],
     ["Land_Bunker_01_blocks_3_F",[1.72437,-12.6807,-0.00143909],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[14.7463,-2.58447,-0.00143909],90.695,true,true],
     ["Land_Bunker_01_blocks_3_F",[6.82544,-12.6665,-0.00143909],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[14.7935,2.40039,-0.00143909],90.695,true,true],
     ["Land_Bunker_01_blocks_3_F",[11.8125,-12.6494,-0.529439],179.955,true,true],
     ["Land_Bunker_01_blocks_3_F",[3.42236,30.3735,-0.00143909],269.774,true,true],
     ["Land_Bunker_01_blocks_3_F",[14.9304,19.4072,-0.00143909],90.695,true,true],
     ["Land_Bunker_01_blocks_3_F",[6.38452,32.8735,-0.00143909],0.106,true,true],
     ["Land_Bunker_01_blocks_3_F",[14.9763,24.3936,-0.00143909],90.695,true,true],
     ["Land_Bunker_01_blocks_3_F",[11.3713,32.8774,-0.363439],0.106,true,true]
];

_missionLootBoxes = [
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["O_LSV_02_armed_F",[-40.6245,8.75732,-0.0378561],359.999],
     ["O_LSV_02_unarmed_F",[35.2053,8.41943,-0.0378113],359.999]
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

_endCondition = "allKilledOrPlayerNear";  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  