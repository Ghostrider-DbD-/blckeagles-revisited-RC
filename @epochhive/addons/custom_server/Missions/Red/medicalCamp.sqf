/*
Mission Compositions by Bill prepared for DBD Clan
*/
private ["_markerLabel","_endMsg","_startMsg","_lootCounts","_crateLoot","_markerMissionName","_missionLandscapeMode","_missionLandscape",
	"_missionLootBoxes","_missionLootVehicles","_missionEmplacedWeapons","_minNoAI","_maxNoAI","_noAIGroups","_noVehiclePatrols","_noEmplacedWeapons",
	"_uniforms","_headgear","_chanceReinforcements","_noPara","_helipatrol","_endCondition"];
	
diag_log "[blckeagls] Spawning Red Mission with template = medicalCamp";
_crateLoot = blck_BoxLoot_Red;
_lootCounts = blck_lootCountsRed;
_startMsg = "A Bandit Medical camp has been spotted. Check the Red marker on your map for its location";
_endMsg = "The Bandit Medical camp at the Red Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELIPSE",[200,200],"GRID"];
_markerColor = "ColorRed";
_markerMissionName = "Medical Camp";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
		["Land_dp_transformer_F",[1.698242,-10.4668,-0.00763702],271.32,1,0,[],"","",true,false], 
		["Land_Wreck_BRDM2_F",[1.37012,13.498,0.00109863],184.487,0.00819469,0.830999,[],"","",true,false], 
		["Land_BagBunker_Small_F",[18.4512,-3.66406,0.00780487],305.003,1,0,[],"","",true,false], 
		["Land_Cargo_HQ_V1_F",[-20.1367,11.7539,0],90.8565,1,0,[],"","",true,false], 
		["Land_BagBunker_Small_F",[-22.707,-3.75586,-0.0130234],44.9901,1,0,[],"","",true,false], 
		["Land_Cargo_House_V1_F",[24.3584,7.45313,0.00111389],91.6329,1,0,[],"","",true,false], 
		["StorageBladder_01_fuel_forest_F",[1.29492,29.3184,0.000999451],179.65,1,0,[],"","",true,false], 
		["Land_GarbageBags_F",[-9.45996,31.252,0.02005],184.595,1,0,[],"","",true,false], 
		["Land_GarbageBags_F",[-13.0459,32.668,-0.0283051],184.595,1,0,[],"","",true,false], 
		["Land_GarbageBags_F",[-11.5957,33.125,-0.598007],184.595,1,0,[],"","",true,false], 
		["Land_GarbageBags_F",[-8.98145,34.5801,-0.00514221],184.592,1,0,[],"","",true,false], 
		["Land_Addon_02_V1_ruins_F",[24.8369,24.6582,-0.00820923],90.9637,1,0,[],"","",true,false], 
		["Land_GarbageBags_F",[-10.9443,35.0449,0.577057],184.592,1,0,[],"","",true,false], 
		["Land_Cargo20_military_green_F",[14.6533,32.9004,0.000480652],90.0989,1,0,[],"","",true,false], 
		["Land_BagBunker_Small_F",[-23.0186,28.6738,-0.0271301],120.012,1,0,[],"","",true,false], 
		["Land_BagBunker_Small_F",[37.1504,34.5742,0.0146866],255,1,0,[],"","",true,false]
		]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
_minNoAI = blck_MinAI_Red;
_maxNoAI = blck_MaxAI_Red;
_noAIGroups = blck_AIGrps_Red;
_noVehiclePatrols = blck_SpawnVeh_Red;
_noEmplacedWeapons = blck_SpawnEmplaced_Red;
_uniforms = blck_SkinList;
_headgear = blck_headgear;
_chanceReinforcements = blck_reinforcementsRed select 0;
_noPara = blck_reinforcementsRed select 1;
_helipatrol = blck_reinforcementsRed select 2;
_endCondition = "playerNear";  // Options are "allUnitsKilled", "playerNear", "playerNear"
_timeout = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 

