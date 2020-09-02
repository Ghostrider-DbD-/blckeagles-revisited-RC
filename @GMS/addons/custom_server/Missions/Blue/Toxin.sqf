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

//diag_log "[blckeagls] Spawning Blue Mission with template = default";
_crateLoot = blck_BoxLoot_Blue;
_lootCounts = blck_lootCountsBlue;
_startMsg = "A Toxin Center was sighted in a nearby sector! Check the Blue marker on your map for the location!";
_endMsg = "The Toxin Center at the Blue Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[200,200],"Solid"];
_markerColor = "ColorBlue";
_markerMissionName = "Toxin Center";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Research_HQ_F",[-6.71143,10.6191,-0.00143909],179.046,true,true,[["B_GMG_01_high_F",[2.39746,3.8103,3.11371],360]],[]],
     ["Land_Research_HQ_F",[11.5024,-2.94189,-0.00143909],89.179,true,true,[["B_Mortar_01_F",[0.713867,-5.21362,3.1624],360],["B_HMG_01_high_F",[-7.5625,-20.228,-0.0121174],180.433]],[]]
];

_missionLandscape = [
     ["Land_Mil_WiredFence_F",[-9.75415,-20.865,-0.00143909],359.2,true,true],
     ["Land_Mil_WiredFence_F",[-21.4592,-9.60181,-0.00143909],89.3037,true,true],
     ["Land_Mil_WiredFence_F",[-17.6565,-20.9314,-0.00143909],359.2,true,true],
     ["Land_Mil_WiredFence_F",[-21.3225,-17.4338,-0.00143909],89.3037,true,true],
     ["Land_Mil_WiredFence_F",[-21.4573,-1.78149,-0.00143909],89.3037,true,true],
     ["Land_Device_assembled_F",[-12.4314,0.409668,-0.00143909],0,true,true],
     ["Land_Sign_WarningMilitaryArea_F",[-7.7229,-21.8035,-0.00143909],359.892,true,true],
     ["Land_Sign_WarningMilitaryArea_F",[4.04224,-21.6248,-0.00143909],359.892,true,true],
     ["Land_HBarrierBig_F",[-17.3535,-2.16992,-0.00143909],271.204,true,true],
     ["Land_HBarrierBig_F",[-17.0715,-10.7412,-0.00143909],269.27,true,true],
     ["Land_HBarrierBig_F",[-11.4836,-13.8401,-0.00143909],0.792412,true,true],
     ["Land_BagFence_Long_F",[-7.15112,-24.29,-0.00143909],0.556939,true,true],
     ["Land_BagFence_Long_F",[3.73877,-24.3738,-0.00143909],180.252,true,true],
     ["Land_PaperBox_closed_F",[-14.3025,-3.37964,-0.00143909],327.535,true,true],
     ["Land_BagFence_Corner_F",[-9.23682,-24.0522,-0.00143909],177.869,true,true],
     ["Land_BagFence_Corner_F",[5.64087,-23.9683,-0.00143909],90.5438,true,true],
     ["Land_BagFence_Short_F",[-9.64136,-22.7109,-0.00143909],268.498,true,true],
     ["Land_Mil_WiredFenceD_F",[-21.8179,13.9368,-0.00143909],89.5986,true,true],
     ["Land_Mil_WiredFence_F",[5.21021,25.5369,-0.00143909],179.508,true,true],
     ["Land_Mil_WiredFence_F",[-21.8245,21.7146,-0.00143909],89.3037,true,true],
     ["Land_Mil_WiredFence_F",[-18.2957,25.3298,-0.00143909],179.508,true,true],
     ["Land_Mil_WiredFence_F",[-2.63354,25.4646,-0.00143909],179.508,true,true],
     ["Land_Mil_WiredFence_F",[-10.4656,25.3845,-0.00143909],179.508,true,true],
     ["Land_Mil_WiredFence_F",[-21.5764,6.02905,-0.00143909],89.3037,true,true],
     ["Land_HBarrierBig_F",[-14.3523,19.9712,-0.00143909],181.375,true,true],
     ["Land_HBarrierBig_F",[-1.87573,20.2095,-0.00143909],181.375,true,true],
     ["Land_HBarrierBig_F",[-17.4297,6.23438,-0.00143909],271.204,true,true],
     ["Land_HBarrierBig_F",[2.31177,20.2192,-0.00143909],181.375,true,true],
     ["Land_HBarrierBig_F",[-17.4548,14.7544,-0.00143909],271.568,true,true],
     ["Land_Mil_WiredFence_F",[5.88647,-20.7947,-0.00143909],359.2,true,true],
     ["Land_Mil_WiredFence_F",[25.0657,-17.1169,-0.00143909],269.14,true,true],
     ["Land_Mil_WiredFence_F",[21.5857,-20.6306,-0.00143909],0.102386,true,true],
     ["Land_Mil_WiredFence_F",[24.927,-9.29077,-0.00143909],269.14,true,true],
     ["Land_Mil_WiredFence_F",[13.738,-20.6443,-0.00143909],0.102386,true,true],
     ["Land_Mil_WiredFence_F",[24.8528,-1.49976,-0.00143909],269.14,true,true],
     ["Land_HBarrierBig_F",[20.4888,-10.4697,-0.00143909],271.956,true,true],
     ["Land_HBarrierBig_F",[20.4954,-1.94287,-0.00143909],270.301,true,true],
     ["Land_HBarrierBig_F",[7.03003,-13.9827,-0.00143909],0.792412,true,true],
     ["Land_HBarrierBig_F",[15.5149,-13.8022,-0.00143909],359.697,true,true],
     ["Land_BagFence_Short_F",[5.89844,-22.4365,-0.00143909],268.498,true,true],
     ["Land_Mil_WiredFence_F",[13.0396,25.6086,-0.00143909],179.508,true,true],
     ["Land_Mil_WiredFence_F",[20.884,25.658,-0.00143909],179.508,true,true],
     ["Land_Mil_WiredFence_F",[24.5051,22.0549,-0.00143909],269.14,true,true],
     ["Land_Mil_WiredFence_F",[24.6458,14.1819,-0.00143909],269.14,true,true],
     ["Land_Mil_WiredFence_F",[24.7532,6.3479,-0.00143909],269.14,true,true],
     ["Land_HBarrierBig_F",[20.4177,4.55054,-0.00143909],271.054,true,true],
     ["Land_HBarrierBig_F",[10.9348,20.3228,-0.00143909],181.375,true,true],
     ["Land_HBarrierBig_F",[17.1685,20.2722,-0.00143909],181.89,true,true],
     ["Land_HBarrierBig_F",[20.3484,15.8003,-0.00143909],271.956,true,true],
     ["Land_Research_house_V1_F",[14.592,14.5435,-0.00143909],0,true,true],
	 //
	 ["CargoNet_01_barrels_F",[-13.5122,-10.8784,-0.00144005],0.00034241,true,true],
     ["CargoNet_01_barrels_F",[-13.6389,-8.33862,-0.00143957],326.531,true,true],
     ["CargoNet_01_barrels_F",[9.43994,17.6221,-0.00143957],326.531,true,true],
     ["B_Slingload_01_Fuel_F",[29.73,4.14917,-0.00143909],156.234,true,true]
];

_missionLootBoxes = [
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["B_T_LSV_01_armed_F",[-2.67554,-31.7471,-0.0237646],87.6435],
     ["B_T_LSV_01_armed_F",[-5.24243,34.4316,-0.023603],270.757]
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [
     //["B_HMG_01_high_F",[3.93994,-23.1699,-0.0135565],180.433],
     //["B_HMG_01_high_F",[-7.9519,-23.1421,-0.0135584],180.433]
];

_missionGroups = [
     //[[-1.2981,-19.1914,0],3,6,"Red",30,45],
     //[[6.48682,10.343,0],3,6,"Red",30,45]
];



//////////
//   The lines below define additional variables you may wish to configure.


//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Blue;
_maxNoAI = blck_MaxAI_Blue;
_noAIGroups = blck_AIGrps_Blue;
_noVehiclePatrols = blck_SpawnVeh_Blue;
_noEmplacedWeapons = blck_SpawnEmplaced_Blue;
//_uniforms = blck_SkinList;
//_headgear = blck_headgear;

_chancePara = 0.75; // Setting this in the mission file overrides the defaults 
_noPara = 5;  // Setting this in the mission file overrides the defaults 
_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
_paraSkill = "Blue";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.

_chanceLoot = 0.7; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [blck_contructionLoot,blck_contructionLoot,blck_highPoweredLoot,blck_supportLoot];
private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

_spawnCratesTiming = blck_spawnCratesTiming; // Choices: "atMissionSpawnGround","atMissionEndGround","atMissionEndAir". 
						 // Crates spawned in the air will be spawned at mission center or the position(s) defined in the mission file and dropped under a parachute.
						 //  This sets the default value but can be overridden by defining  _spawnCrateTiming in the file defining a particular mission.
_loadCratesTiming = blck_loadCratesTiming; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
						// Pertains only to crates spawned at mission spawn.
						// This sets the default but can be overridden for specific missions by defining _loadCratesTiming
						
						// Examples:
						// To spawn crates at mission start loaded with gear set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionSpawn"
						// To spawn crates at mission start but load gear only after the mission is completed set blck_spawnCratesTiming = "atMissionSpawnGround" && blck_loadCratesTiming = "atMissionCompletion"
						// To spawn crates on the ground at mission completion set blck_spawnCratesTiming = "atMissionEndGround" // Note that a loaded crate will be spawned.
						// To spawn crates in the air and drop them by chutes set blck_spawnCratesTiming = "atMissionEndAir" // Note that a loaded crate will be spawned.
_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
									// Setting this in the mission file overrides the defaults 

#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  
