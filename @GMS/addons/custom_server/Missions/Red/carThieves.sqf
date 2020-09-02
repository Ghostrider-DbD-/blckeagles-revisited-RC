/*
Mission Compositions by Ghostrider [GRG] for ghostridergaming
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#include "\q\addons\custom_server\Missions\privateVars.sqf";

//diag_log "[blckeagls] Spawning Red Mission with template = default";
_crateLoot = blck_BoxLoot_Red;
_lootCounts = blck_lootCountsRed;
_startMsg = "Car thieves were sighted in a nearby sector! Check the Red marker on your map for the location!";
_endMsg = "The Sector at the Red Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[300,300],"Solid"];
_markerColor = "ColorRed";
_markerMissionName = "Thieves";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	["Flag_AAF_F",[4,4,0],0,[false,false]],
	["Land_i_Garage_V2_F",[3.875,-30.1152,0],252.899,[true,true]],
	["Land_i_Garage_V2_F",[-17.2246,28.0176,-0.00298452],65.4825,[true,true]],
	["Land_i_House_Big_02_V2_F",[30.9844,14.6074,-2.38419e-007],77.0403,[true,true]],
	["Land_i_House_Big_01_V3_F",[-42.3359,-7.80469,2.38419e-007],343.548,[true,true]],
	["Land_Wreck_Truck_F",[48.3457,-1.48242,0],0,[false,false]],
	["Land_Wreck_Car2_F",[34.3457,-12.3398,2.38419e-007],0,[false,false]],
	["Land_Wreck_Car3_F",[23.7402,-24.3887,0],0,[false,false]],
	["Land_Wreck_Hunter_F",[21.4395,-35.9492,2.38419e-007],0,[false,false]],
	["Land_Wreck_Van_F",[14.5645,21.1934,-0.000167847],0,[false,false]],
	["Land_Wreck_Offroad_F",[12.6328,29.0918,0.000607967],0,[false,false]],
	["Land_Wreck_Offroad2_F",[-0.875,27.1035,0.00187802],0,[false,false]],
	["Land_Wreck_UAZ_F",[-24.3984,22.4688,-0.000131845],0,[false,false]],
	["Land_Wreck_Ural_F",[-31.2441,18.7832,-1.90735e-006],0,[false,false]],
	["Land_Wreck_Truck_dropside_F",[-35.7227,7.54883,2.38419e-007],0,[false,false]],
	["Land_Wreck_Heli_Attack_01_F",[-34.1113,27.1094,0.00630307],0,[false,false]],
	["Land_Wreck_Heli_Attack_01_F",[-5.27734,-35.4395,2.38419e-007],0,[false,false]],
	["Land_Wreck_Heli_Attack_02_F",[-15.1113,-41.4531,0],0,[false,false]],
	["Land_UWreck_Heli_Attack_02_F",[-24.7617,-27.7559,0],0,[false,false]],
	["Land_HistoricalPlaneDebris_04_F",[-15.4902,-27.8711,0],0,[false,false]],
	["Land_HistoricalPlaneDebris_03_F",[-42.4453,13.793,0],0,[false,false]],
	["Land_HistoricalPlaneDebris_02_F",[35.041,-24.9219,0],0,[false,false]],
	["Land_HistoricalPlaneDebris_01_F",[42.6582,-17.5762,0],0,[false,false]],
	["Land_Wreck_Slammer_hull_F",[25.1035,30.7656,0.00311899],0,[false,false]],
	["Land_Wreck_Slammer_F",[-5.16797,38.9414,0.0154414],0,[false,false]],
	["Land_CargoBox_V1_F",[-9.66406,-16.6582,0],0,[false,false]],
	["Land_Cargo40_blue_F",[6.50195,-19.627,0],154.788,[false,false]],
	["Land_Cargo40_blue_F",[-7.36914,-23.0078,0],0,[false,false]],
	["Land_Cargo40_blue_F",[-19.6152,-18.0742,0],41.2042,[false,false]],
	["Land_CncBarrier_F",[-6.70508,9.58203,0],141.162,[false,false]],
	["Land_CncBarrierMedium4_F",[4.69141,12.666,0],0,[false,false]],
	//["Land_CncBarrierMedium4_F",[-11.3613,5.03516,0],136.997,[false,false]],
	["Land_CncBarrierMedium4_F",[-17.4824,-0.664063,0],136.997,[false,false]],
	["Land_CncBarrierMedium4_F",[-22.625,-7.21289,0],301.167,[false,false]]

]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
_minNoAI = blck_MinAI_Red;
_maxNoAI = blck_MaxAI_Red;
_noAIGroups = blck_AIGrps_Red;
_noVehiclePatrols = blck_SpawnVeh_Red;
_noEmplacedWeapons = blck_SpawnEmplaced_Red;
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
#ifdef blck_useCUP
_uniforms = blck_CUPUniforms;
_weaponList = blck_CUPWeapons;
_vests = blck_CUPVests;
_backpacs = blck_CUPBackpacks;
_headgear = blck_CUPHeadgear;
#endif

_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
