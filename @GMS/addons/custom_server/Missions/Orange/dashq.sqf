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
_startMsg = "An enemy HQ center was sighted in a nearby sector! Check the Orange marker on your map for the location!";
_endMsg = "The HQ at the Orange Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[300,300],"Solid"];
_markerColor = "ColorOrange";
_markerMissionName = "Operations Base";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_HQ_V1_F",[-0.358154,-18.6514,-0.00143862],179.905,true,true,[["B_HMG_01_high_F",[-6.5437,1.09253,3.11855],145.121],["B_HMG_01_high_F",[-13.9094,-10.7791,-0.0121183],206.716]],[]]
];

_missionLandscape = [
     ["Land_PortableLight_double_F",[-42.614,-26.0178,-0.00143909],225.577,true,true],
     ["Land_CncWall4_F",[-45.3523,-21.509,-0.00143909],89.9051,true,true],
     ["Land_CncWall4_F",[-33.5913,-28.1145,-0.00143909],359.905,true,true],
     ["Land_CncWall4_F",[-38.842,-28.124,-0.00143909],359.905,true,true],
     ["Land_CncWall1_F",[-44.093,-26.7578,-0.00143909],44.9051,true,true],
     ["Land_CncWall1_F",[-43.0923,-27.5063,-0.00143909],29.9051,true,true],
     ["Land_CncWall1_F",[-45.2207,-24.6689,-0.00143909],74.9051,true,true],
     ["Land_CncWall1_F",[-44.845,-25.7581,-0.00143909],59.9051,true,true],
     ["Land_CncWall1_F",[-41.9668,-28.0046,-0.00143909],14.9051,true,true],
     ["Land_BagBunker_01_large_green_F",[-49.7271,-16.9226,-0.00143909],90.2555,true,true],
     ["Land_Cargo_Tower_V1_F",[-36.3582,-19.3394,-0.00143909],89.905,true,true],
     ["Land_CncWall4_F",[-33.4968,-9.73975,-0.00143909],179.905,true,true],
     ["Land_CncWall4_F",[-45.3792,-5.75879,-0.00143909],89.9051,true,true],
     ["Land_CncWall4_F",[-45.3867,-0.508789,-0.00143909],89.9051,true,true],
     ["Land_CncWall4_F",[-45.3694,-11.0095,-0.00143909],89.9051,true,true],
     ["Land_CncWall4_F",[-45.3955,4.74121,-0.00143909],89.9051,true,true],
     ["Land_CncWall4_F",[-45.4041,9.99072,-0.00143909],89.9051,true,true],
     ["Land_CncWall1_F",[-32.0076,1.70923,-0.00143909],74.9051,true,true],
     ["Land_CncWall1_F",[-31.6313,0.61792,-0.00143909],59.9051,true,true],
     ["Land_BagBunker_01_large_green_F",[-49.7959,14.4089,-0.00143909],90.2555,true,true],
     ["Land_Cargo_HQ_V1_F",[-34.4014,20.1455,-0.00143862],269.491,true,true],
     ["Land_CncWall4_F",[-45.4214,20.4915,-0.00143909],89.9051,true,true],
     ["Land_CncWall4_F",[-45.4302,25.7415,-0.00143909],89.9051,true,true],
     ["Land_CncWall4_F",[-38.8159,32.2512,-0.00143909],179.905,true,true],
     ["Land_CncWall4_F",[-33.5662,32.2607,-0.00143909],179.905,true,true],
     ["Land_CncWall1_F",[-43.0654,31.7451,-0.00143909],149.905,true,true],
     ["Land_CncWall1_F",[-41.9753,32.1199,-0.00143909],164.905,true,true],
     ["Land_CncWall1_F",[-44.0635,30.9924,-0.00143909],134.905,true,true],
     ["Land_CncWall1_F",[-44.8127,29.991,-0.00143909],119.905,true,true],
     ["Land_CncWall1_F",[-45.3108,28.8672,-0.00143909],104.905,true,true],
     ["Land_BagFence_Round_F",[-15.3367,-30.4338,-0.00143909],44.9051,true,true],
     ["Land_BagFence_Round_F",[-25.8376,-30.2017,-0.00143909],314.905,true,true],
     ["Land_PortableLight_double_F",[-2.30811,-29.9211,-0.00143909],44.7366,true,true],
     ["Land_CncWall4_F",[-2.09229,-28.0632,-0.00143909],359.905,true,true],
     ["Land_CncWall4_F",[-26.9856,-16.3538,-0.00143909],269.905,true,true],
     ["Land_CncWall4_F",[-13.8528,-21.4565,-0.00143909],89.9051,true,true],
     ["Land_CncWall4_F",[-26.9783,-21.6038,-0.00143909],269.905,true,true],
     ["Land_CncWall4_F",[-7.34155,-28.0718,-0.00143909],359.905,true,true],
     ["Land_CncWall4_F",[-13.8606,-16.2065,-0.00143909],89.9051,true,true],
     ["Land_CncWall1_F",[-13.3455,-25.7068,-0.00143909],59.9051,true,true],
     ["Land_CncWall1_F",[-12.593,-26.7058,-0.00143909],44.9051,true,true],
     ["Land_CncWall1_F",[-27.5952,-25.8552,-0.00143909],299.905,true,true],
     ["Land_CncWall1_F",[-27.0967,-24.7288,-0.00143909],284.905,true,true],
     ["Land_CncWall1_F",[-13.7209,-24.6165,-0.00143909],74.9051,true,true],
     ["Land_CncWall1_F",[-10.4666,-27.9514,-0.00143909],14.9051,true,true],
     ["Land_CncWall1_F",[-29.3428,-27.6084,-0.00143909],329.905,true,true],
     ["Land_CncWall1_F",[-30.4331,-27.9832,-0.00143909],344.905,true,true],
     ["Land_CncWall1_F",[-11.592,-27.4541,-0.00143909],29.9051,true,true],
     ["Land_CncWall1_F",[-28.3438,-26.855,-0.00143909],314.905,true,true],
     ["Land_BagFence_Long_F",[-25.2168,-27.7002,-0.00143909],269.905,true,true],
     ["Land_BagFence_Long_F",[-15.9658,-27.9348,-0.00143909],269.905,true,true],
     ["Land_BagFence_Long_F",[-12.8359,-31.0559,-0.00143909],359.905,true,true],
     ["Land_BagFence_Long_F",[-28.3364,-30.8318,-0.00143909],179.905,true,true],
     ["Land_BagFence_Round_F",[-7.19092,10.5073,-0.00143909],44.9051,true,true],
     ["Land_PortableLight_double_F",[-11.7207,0.158936,-0.00143909],135.598,true,true],
     ["Land_PortableLight_double_F",[-29.4041,0.418701,-0.00143909],218.658,true,true],
     ["Land_CncWall4_F",[-7.24731,-9.69678,-0.00143909],179.905,true,true],
     ["Land_CncWall4_F",[-20.376,-1.73682,-0.00143909],359.905,true,true],
     ["Land_CncWall4_F",[-25.6274,-1.74609,-0.00143909],359.905,true,true],
     ["Land_CncWall4_F",[-15.1272,-1.72925,-0.00143909],359.905,true,true],
     ["Land_CncWall1_F",[-10.4058,-9.82935,-0.00143909],164.905,true,true],
     ["Land_CncWall1_F",[-10.8779,-1.22144,-0.00143909],329.905,true,true],
     ["Land_CncWall1_F",[-9.13086,0.531982,-0.00143909],299.905,true,true],
     ["Land_CncWall1_F",[-11.4956,-10.2031,-0.00143909],149.905,true,true],
     ["Land_CncWall1_F",[-8.63257,1.65747,-0.00143909],284.905,true,true],
     ["Land_CncWall1_F",[-11.9688,-1.59668,-0.00143909],344.905,true,true],
     ["Land_CncWall1_F",[-27.4932,-12.1047,-0.00143909],239.905,true,true],
     ["Land_CncWall1_F",[-12.4951,-10.9553,-0.00143909],134.905,true,true],
     ["Land_CncWall1_F",[-13.2424,-11.9563,-0.00143909],119.905,true,true],
     ["Land_CncWall1_F",[-29.8777,-1.12744,-0.00143909],29.9051,true,true],
     ["Land_CncWall1_F",[-9.87939,-0.470703,-0.00143909],314.905,true,true],
     ["Land_CncWall1_F",[-30.3708,-9.86011,-0.00143909],194.905,true,true],
     ["Land_CncWall1_F",[-30.8787,-0.378906,-0.00143909],44.9051,true,true],
     ["Land_CncWall1_F",[-29.2468,-10.3582,-0.00143909],209.905,true,true],
     ["Land_CncWall1_F",[-13.7417,-13.0818,-0.00143909],104.905,true,true],
     ["Land_CncWall1_F",[-28.2449,-11.1069,-0.00143909],224.905,true,true],
     ["Land_CncWall1_F",[-27.1179,-13.1948,-0.00143909],254.905,true,true],
     ["Land_CncWall1_F",[-28.7524,-1.62573,-0.00143909],14.9051,true,true],
     ["Land_BagFence_Long_F",[-7.8208,13.0066,-0.00143909],269.905,true,true],
     ["Land_BagFence_Long_F",[-4.69067,9.88257,-0.00143909],359.905,true,true],
     ["Land_Cargo_Patrol_V1_F",[-19.8857,1.92358,-0.00143862],359.905,true,true],
     ["Land_Cargo_HQ_V1_F",[-17.6404,20.1672,-0.00143862],269.491,true,true],
     ["Land_HelipadSquare_F",[0.169189,17.6489,-0.00143909],359.936,true,true],
     ["Land_BagFence_Round_F",[-7.21484,25.1335,-0.00143909],134.905,true,true],
     ["Land_BagFence_Round_F",[-8.354,36.8232,-0.00143909],134.905,true,true],
     ["Land_CncWall4_F",[-23.0659,32.2773,-0.00143909],179.905,true,true],
     ["Land_CncWall4_F",[-12.615,32.3005,-0.00143909],179.905,true,true],
     ["Land_CncWall4_F",[-17.8164,32.2856,-0.00143909],179.905,true,true],
     ["Land_CncWall4_F",[-7.396,32.3115,-0.00143909],179.905,true,true],
     ["Land_CncWall4_F",[-2.25146,35.2305,-0.00143909],179.977,true,true],
     ["Land_CncWall4_F",[-28.3167,32.269,-0.00143909],179.905,true,true],
     ["Land_CncWall1_F",[-4.03638,32.6663,-0.00143909],149.461,true,true],
     ["Land_BagFence_Long_F",[-4.71533,25.7625,-0.00143909],359.905,true,true],
     ["Land_BagFence_Long_F",[-5.85449,37.4521,-0.00143909],359.905,true,true],
     ["Land_BagFence_Long_F",[-7.83618,22.6321,-0.00143909],89.9051,true,true],
     ["Land_BagFence_Long_F",[-8.97534,34.3218,-0.00143909],89.9051,true,true],
     ["Land_PortableLight_double_F",[12.1106,-26.1833,-0.00143909],149.905,true,true],
     ["Land_CncWall4_F",[15.0215,-21.5349,-0.00143909],269.905,true,true],
     ["Land_CncWall4_F",[8.38428,-28.1101,-0.00143909],359.905,true,true],
     ["Land_CncWall4_F",[15.0137,-16.2847,-0.00143909],269.905,true,true],
     ["Land_CncWall1_F",[14.9031,-24.6597,-0.00143909],284.905,true,true],
     ["Land_CncWall1_F",[12.6567,-27.5383,-0.00143909],329.905,true,true],
     ["Land_CncWall1_F",[11.5676,-27.9133,-0.00143909],344.905,true,true],
     ["Land_CncWall1_F",[14.4038,-25.7854,-0.00143909],299.905,true,true],
     ["Land_CncWall1_F",[13.656,-26.7861,-0.00143909],314.905,true,true],
     ["Land_BagFence_Long_F",[12.5037,-23.1807,-0.00143909],89.3707,true,true],
     ["Land_BagFence_Long_F",[11.072,-24.5706,-0.00143909],359.905,true,true],
     ["Land_BagFence_Long_F",[10.9707,-21.8315,-0.00143909],179.371,true,true],
     ["Land_BagFence_Long_F",[9.56812,-23.1921,-0.00143909],269.905,true,true],
     ["Land_BagBunker_01_large_green_F",[3.83936,-32.5405,-0.00143909],0,true,true],
     ["Land_TTowerSmall_2_F",[11.5024,-23.7861,-0.00143909],179.905,true,true],
     ["Land_Cargo_House_V1_F",[9.00171,-10.2603,-0.00143909],89.905,true,true],
     ["Land_Cargo_House_V1_F",[8.98071,2.86475,-0.00143909],89.905,true,true],
     ["Land_Medevac_house_V1_F",[8.99219,-3.76099,-0.00143909],90.3921,true,true],
     ["Land_BagFence_Round_F",[8.05933,10.2788,-0.00143909],314.905,true,true],
     ["Land_PortableLight_double_F",[12.8176,7.44629,-0.00143909],134.905,true,true],
     ["Land_CncWall4_F",[14.9788,4.71558,-0.00143909],269.905,true,true],
     ["Land_CncWall4_F",[15.0054,-11.0347,-0.00143909],269.905,true,true],
     ["Land_CncWall4_F",[14.9961,-5.78418,-0.00143909],269.905,true,true],
     ["Land_CncWall4_F",[14.9878,-0.533936,-0.00143909],269.905,true,true],
     ["Land_CncWall4_F",[14.9705,9.96558,-0.00143909],269.905,true,true],
     ["Land_BagFence_Long_F",[8.68018,12.7852,-0.00143909],269.905,true,true],
     ["Land_BagFence_Long_F",[5.55933,9.6499,-0.00143909],179.905,true,true],
     ["Land_BagBunker_01_large_green_F",[19.272,16.1316,-0.00143909],269.832,true,true],
     ["Land_BagFence_Round_F",[7.91089,24.9097,-0.00143909],224.905,true,true],
     ["Land_BagFence_Round_F",[9.05054,36.9314,-0.00143909],224.905,true,true],
     ["Land_PortableLight_double_F",[11.8816,29.2671,-0.00143909],44.7366,true,true],
     ["Land_CncWall4_F",[14.9529,20.4653,-0.00143909],269.905,true,true],
     ["Land_CncWall4_F",[8.43433,32.3303,-0.00143909],179.905,true,true],
     ["Land_CncWall4_F",[2.95288,35.22,-0.00143909],179.977,true,true],
     ["Land_CncWall4_F",[14.9443,25.7156,-0.00143909],269.905,true,true],
     ["Land_CncWall1_F",[14.4373,29.9646,-0.00143909],239.905,true,true],
     ["Land_CncWall1_F",[14.813,28.8745,-0.00143909],254.905,true,true],
     ["Land_CncWall1_F",[13.6853,30.9644,-0.00143909],224.905,true,true],
     ["Land_CncWall1_F",[12.6843,31.7119,-0.00143909],209.905,true,true],
     ["Land_CncWall1_F",[11.5593,32.2114,-0.00143909],194.905,true,true],
     ["Land_CncWall1_F",[5.11841,32.7061,-0.00143909],209.905,true,true],
     ["Land_BagFence_Long_F",[8.54004,22.4104,-0.00143909],89.9051,true,true],
     ["Land_BagFence_Long_F",[9.67969,34.4321,-0.00143909],89.9051,true,true],
     ["Land_BagFence_Long_F",[5.40894,25.5288,-0.00143909],179.905,true,true],
     ["Land_BagFence_Long_F",[6.54858,37.5505,-0.00143909],179.905,true,true]
];

_missionLootBoxes = [
     [selectRandom blck_crateTypes,[0.0717773,16.9431,-0.00143814],_crateLoot,_lootCounts,0.000320471]
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["O_T_LSV_02_armed_F",[-62.7971,0.422119,-0.0236669],0.00164848],
     ["O_T_LSV_02_armed_F",[31.9084,-7.18774,-0.0238085],0.00168349]
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
_paraSkill = "orange";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.

_chanceLoot = 0.7; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [blck_contructionLoot,blck_contructionLoot,blck_highPoweredLoot,blck_supportLoot];
private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  