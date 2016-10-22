/*
Mission Compositions by Bill prepared for DBD Clan
*/
private ["_markerLabel","_endMsg","_startMsg","_lootCounts","_crateLoot","_markerMissionName","_missionLandscapeMode","_missionLandscape",
	"_missionLootBoxes","_missionLootVehicles","_missionEmplacedWeapons","_minNoAI","_maxNoAI","_noAIGroups","_noVehiclePatrols","_noEmplacedWeapons",
	"_uniforms","_headgear","_chanceReinforcements","_noPara","_helipatrol","_endCondition"];
	
diag_log "[blckeagls] Spawning Orange Mission with template = resupplyCamp";

_crateLoot = blck_BoxLoot_Orange;
_lootCounts = blck_lootCountsOrange;
_startMsg = "A Bandit resupply camp has been spotted. Check the Orange marker on your map for its location";
_endMsg = "The Bandit resupply camp at the Orange Marker is under player control";
_markerLabel = "";
_markerType = ["ELIPSE",[250,250],"GRID"];
_markerColor = "ColorOrange";
_markerMissionName = "Resupply Camp";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
		["Flag_AAF_F",[3,3,0],0,1,0,[],"","",true,false], 
		["Land_Cargo_Patrol_V1_F",[-29.41016,0.13477,-0.0224228],359.992,1,0,[],"","",true,false], 
		["Land_Cargo_House_V1_F",[29.2988,-0.1,0.150505],54.9965,0,0.848867,[],"","",true,false], 
		["CamoNet_INDP_big_F",[-20.4346,15.43164,-0.00395203],54.9965,1,0,[],"","",true,false], 
		["Land_BagBunker_Small_F",[-20.4346,15.43164,-0.0138168],119.996,1,0,[],"","",true,false], 
		["Land_BagBunker_Small_F",[-20.3604,-15.6035,-0.0130463],44.9901,1,0,[],"","",true,false], 
		["Land_BagBunker_Small_F",[18.4453,-15.791,0.00744629],305.003,1,0,[],"","",true,false], 
		["Land_BagBunker_Small_F",[18.3711,15.5703,0.0101624],254.999,1,0,[],"","",true,false],
		["CamoNet_INDP_big_F",[18.3711,15.5703,-0.00395203],54.9965,1,0,[],"","",true,false]
		]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
_minNoAI = blck_MinAI_Orange;
_maxNoAI = blck_MaxAI_Orange;
_noAIGroups = blck_AIGrps_Orange;
_noVehiclePatrols = blck_SpawnVeh_Orange;
_noEmplacedWeapons = blck_SpawnEmplaced_Orange;
_uniforms = blck_SkinList;
_headgear = blck_headgear;

_chanceReinforcements = 0; 
_noPara = 5;  
_chanceHeliPatrol = 0;
_chanceLoot = 0.33; 

private["_weap","_mags","_backpacks","_optics","_loadout"];
_weap = 4 + floor(random(4));	
_mags = 12 + floor(random(6));
_backpacks = 1 + floor(random(2));
_optics = 5 + floor(random(6));
_reinforcementLootCounts = [_weap,_mags,_optics,0,0,_backpacks];

_endCondition = "playerNear";  // Options are "allUnitsKilled", "playerNear", "playerNear"
_timeout = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
