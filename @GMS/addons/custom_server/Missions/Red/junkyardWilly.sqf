/*
Mission Compositions by Ghostrider [GRG] for ghostridergaming
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#include "\q\addons\custom_server\Missions\privateVars.sqf";

//diag_log "[blckeagls] Spawning Red Mission with template = default";
_crateLoot = blck_BoxLoot_Red;
_lootCounts = blck_lootCountsRed;
_startMsg = "An enemy junkyard was sighted in a nearby sector! Check the Red marker on your map for the location!";
_endMsg = "The Sector at the Red Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[300,300],"Solid"];
_markerColor = "ColorRed";
_markerMissionName = "Junkyard";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	["Land_Wreck_Van_F",[-9.02148,-1.02734,0],0,[false,false]],
	["Land_Wreck_Truck_dropside_F",[-3.02148,-7.02734,2.38419e-007],0,[false,false]],
	["Land_Wreck_T72_hull_F",[4.97852,8.97266,0],0,[false,false]],
	["Land_Wreck_Slammer_turret_F",[-5.02148,4.97266,0],0,[false,false]],
	["Land_Wreck_Ural_F",[9.97852,2.97266,-2.38419e-007],0,[false,false]],
	["Land_Wreck_UAZ_F",[9.97852,-5.02734,-2.38419e-007],0,[false,false]],
	["Land_Wreck_Offroad2_F",[6.97852,-11.0273,0],0,[false,false]],
	["Land_Wreck_Offroad_F",[-9.02148,-10.0273,2.38419e-007],0,[false,false]],
	["Land_Wreck_Heli_Attack_02_F",[17.9785,12.9727,0],0,[false,false]],
	["Land_Wreck_Hunter_F",[-10.0215,14.9727,2.38419e-007],0,[false,false]],
	["Land_Wreck_Car3_F",[-16.0215,5.97266,0],0,[false,false]],
	["Land_Wreck_Car_F",[-15.0215,-6.02734,0],0,[false,false]],
	["Land_Wreck_Car2_F",[17.9785,-6.02734,2.38419e-007],0,[false,false]],
	["Land_Wreck_Truck_F",[3.97852,23.9727,0],0,[false,false]],
	["Land_Wreck_CarDismantled_F",[-1.02148,-16.0273,0],0,[false,false]],
	["Land_Wreck_BRDM2_F",[-21.0215,0.972656,0],0,[false,false]],
	["Land_Wreck_BMP2_F",[14.9785,-18.0273,0],0,[false,false]],
	["Flag_AAF_F",[4,4,0],0,[false,false]]
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
#ifdef blck_useCUP
_uniforms = blck_CUPUniforms;
_weaponList = blck_CUPWeapons;
_vests = blck_CUPVests;
_backpacks = blck_CUPBackpacks;
_headgear = blck_CUPHeadgear;
#endif
#ifdef blck_useNIA
_weaponList = _weaponList +  + blck_NIA_WeaponsSniper;
#endif

_endCondition = blck_missionEndCondition;  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
