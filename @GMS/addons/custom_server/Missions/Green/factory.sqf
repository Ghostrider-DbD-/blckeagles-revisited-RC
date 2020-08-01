/*
	Mission Template by Ghostrider [GRG]
	Mission Compositions by Bill prepaGreen for ghostridergaming
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
_startMsg = "An Ammunition Factory was sighted in a nearby sector! Check the Green marker on your map for the location!";
_endMsg = "The Factory at the Green Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[300,300],"Solid"];
_markerColor = "ColorGreen";
_markerMissionName = "Factory";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Tower_V3_F",[-18.6987,-51.7905,-0.0014348],91.6296,true,true,[["B_HMG_01_high_F",[3.31396,2.89209,8.57585],359.999],["B_HMG_01_high_F",[13.0347,0.8479,-0.0121226],360],["B_HMG_01_high_F",[-9.4834,13.5967,-0.0121226],0.00158913],["B_HMG_01_high_F",[-0.601074,3.90967,17.8764],359.999],["B_HMG_01_high_F",[-0.877441,-4.83179,17.8764],359.999],["B_HMG_01_high_F",[-9.77783,29.3799,-0.0121226],360]],[]],
     ["Land_Cargo_Patrol_V3_F",[-27.1675,-15.407,-0.00143814],91.6296,true,true,[["B_HMG_01_high_F",[-1.15381,1.24658,4.33092],275.276]],[]],
     ["Land_Cargo_Patrol_V3_F",[-10.7632,4.77441,-0.00143814],181.63,true,true,[["B_HMG_01_high_F",[-1.32959,1.03662,4.33092],359.999]],[]],
     ["Land_Cargo_Patrol_V3_F",[12.9375,3.5835,-0.00143814],181.63,true,true,[["B_HMG_01_high_F",[1.57861,1.04736,4.33093],357.402],["B_HMG_01_high_F",[8.41357,-9.20557,-0.0121202],0.0033673]],[]]
];

_missionLandscape = [
     //["babe_helper",[-4335.99,-3525.64,-0.00143862],0,true,true],
     //["Sign_Arrow_Green_F",[-4333.49,-3526.14,-0.00143862],0,true,true],
     //["Sign_Arrow_F",[-4333.49,-3526.14,-0.00143862],0,true,true],
     //["Sign_Arrow_Yellow_F",[-4333.49,-3526.14,-0.00143862],0,true,true],
     ["Land_BagFence_Long_F",[-29.7012,-38.5171,-0.00143862],91.6296,true,true],
     ["Land_BagFence_Long_F",[-27.5103,-40.5801,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[-22.1475,-58.7117,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[-25.2705,-45.3574,-0.00143862],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-25.3784,-53.6096,-0.00143862],91.6296,true,true],
     ["Land_BagFence_Corner_F",[-29.377,-40.2764,-0.00143862],181.63,true,true],
     ["Land_BagFence_Corner_F",[-25.5186,-40.8857,-0.00143862],1.62962,true,true],
     ["Land_BagFence_Long_F",[-27.6362,-36.2009,-0.00143862],1.62962,true,true],
     ["Land_HBarrier_Big_F",[-31.3271,-12.1621,-0.00143862],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-26.2822,-19.4336,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[-31.4404,-20.5371,-0.00143862],91.6296,true,true],
     ["Land_BagFence_Corner_F",[-29.3945,-36.5234,-0.00143862],271.63,true,true],
     ["CamoNet_OPFOR_F",[-25.6099,-22.126,-0.00143862],1.62962,true,true],
     ["CamoNet_OPFOR_big_F",[-23.2964,2.06958,-0.00143862],1.62962,true,true],
     ["Land_HBarrier_Big_F",[-31.3423,-3.90796,-0.00143862],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-27.8384,9.37231,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[-31.2295,4.46704,-0.00143862],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-19.4634,9.25928,-0.00143862],181.63,true,true],
     ["Land_BagFence_Round_F",[-3.56348,-51.6428,-0.00143862],316.63,true,true],
     ["Land_BagFence_Long_F",[-6.08105,-52.1965,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[11.7363,-54.9075,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[3.36133,-54.7944,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[-8.54834,-55.4766,-0.00143862],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-13.6416,-58.7065,-0.00143862],181.63,true,true],
     ["Land_dp_mainFactory_F",[7.44922,-29.397,-0.00143862],1.62962,true,true],
     ["Land_HBarrier_Big_F",[-6.04248,6.25171,-0.00143862],271.63,true,true],
     ["Land_HBarrier_Big_F",[11.5215,8.25244,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[-11.2095,9.27417,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[8.12988,3.34741,-0.00143862],91.6296,true,true],
     ["Land_HBarrier_Big_F",[19.9902,-54.8926,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[32.8569,-43.4072,-0.00143862],271.63,true,true],
     ["Land_HBarrier_Big_F",[28.146,-54.7991,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[32.873,-51.5361,-0.00143862],271.63,true,true],
     ["Land_BagFence_Round_F",[37.7549,-30.4514,-0.00143862],316.63,true,true],
     ["Land_BagFence_Round_F",[37.8594,-28.2903,-0.00143862],226.63,true,true],
     ["Land_BagFence_Long_F",[35.2378,-31.0051,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[33.3535,-19.7563,-0.00143862],271.63,true,true],
     ["Land_HBarrier_Big_F",[30.1147,-14.9102,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[32.8462,-34.9041,-0.00143862],271.63,true,true],
     ["Land_HBarrier_Big_F",[24.9575,-11.6372,-0.00143862],271.63,true,true],
     ["CamoNet_OPFOR_F",[21.7773,-9.21729,-0.00143862],91.6296,true,true],
     ["Land_HBarrier_Big_F",[19.8965,8.1394,-0.00143862],181.63,true,true],
     ["Land_HBarrier_Big_F",[24.9307,4.99487,-0.00143862],271.63,true,true],
     ["Land_HBarrier_Big_F",[24.9414,-3.5083,-0.00143862],271.63,true,true]
];

_missionLootBoxes = [];

_missionLootVehicles = [];

_missionPatrolVehicles = [
   //  ["B_G_Offroad_01_armed_F",[-53.8027,-29.7834,0.00867844],0.00103655],
	// ["B_G_Offroad_01_armed_F",[51.0596,-25.7876,0.00815535],0.00104356]
];

_submarinePatrolParameters = [];

_airPatrols = [];

_missionEmplacedWeapons = []; //

_missionGroups = [];

//////////
//   The lines below define additional variables you may wish to configure.


//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Green;
_maxNoAI = blck_MaxAI_Green;
_noAIGroups = blck_AIGrps_Green;
_noVehiclePatrols = blck_SpawnVeh_Green;
_noEmplacedWeapons = blck_SpawnEmplaced_Green;
_uniforms = blck_SkinList;
_headgear = blck_headgear;

_chancePara = 0.75; // Setting this in the mission file overrides the defaults 
_noPara = 5;  // Setting this in the mission file overrides the defaults 
_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
_paraSkill = "Green";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.

_chanceLoot = 0.7; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [blck_contructionLoot,blck_contructionLoot,blck_highPoweredLoot,blck_supportLoot];
private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

//_endCondition = "playerNear";  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  
