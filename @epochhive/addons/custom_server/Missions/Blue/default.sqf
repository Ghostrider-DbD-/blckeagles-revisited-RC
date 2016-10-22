/*
Mission Compositions by Bill prepared for DBD Clan
*/
private ["_markerLabel","_endMsg","_startMsg","_lootCounts","_crateLoot","_markerMissionName","_missionLandscapeMode","_missionLandscape",
	"_missionLootBoxes","_missionLootVehicles","_missionEmplacedWeapons","_minNoAI","_maxNoAI","_noAIGroups","_noVehiclePatrols","_noEmplacedWeapons",
	"_uniforms","_headgear","_chanceReinforcements","_noPara","_chanceHeliPatrol","_endCondition","_chanceHeliLootDropped","_chanceLoot"];

diag_log "[blckeagls] Spawning Blue Mission with template = default";

private["_missionEnabled"];

_crateLoot = blck_BoxLoot_Blue;
_lootCounts = blck_lootCountsBlue;
_startMsg = "A group of Bandits was sighted in a nearby sector! Check the Blue marker on your map for the location!";
_endMsg = "The Sector at the Blue Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELIPSE",[175,175],"GRID"];
_markerColor = "ColorBlue";
_markerMissionName = "Bandit Patrol";
_missionLandscapeMode = "random"; // acceptable values are "none","random","precise"
_missionLandscape = ["Land_WoodPile_F","Land_BagFence_Short_F","Land_WoodPile_F","Land_BagFence_Short_F","Land_WoodPile_F","Land_BagFence_Short_F","Land_FieldToilet_F","Land_TentDome_F","Land_TentDome_F","Land_TentDome_F","Land_TentDome_F","Land_CargoBox_V1_F","Land_CargoBox_V1_F"]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
_minNoAI = blck_MinAI_Blue;
_maxNoAI = blck_MaxAI_Blue;
_noAIGroups = blck_AIGrps_Blue;
_noVehiclePatrols = blck_SpawnVeh_Blue;
_noEmplacedWeapons = blck_SpawnEmplaced_Blue;
_uniforms = blck_SkinList;
_headgear = blck_headgear;

_chanceReinforcements = 0; //blck_reinforcementsBlue select 0;
_noPara = 2;  //blck_reinforcementsBlue select 1;
_chanceHeliPatrol = 0;//blck_reinforcementsBlue select 2;
_chanceLoot = 0.992; //blck_reinforcementsBlue select 3;

private["_weap","_mags","_backpacks","_optics","_loadout","_reinforcementLootCounts"];
_weap = 3 + floor(random(4));	
_mags = 8 + floor(random(6));
_backpacks = 1 + floor(random(2));
_optics = 1 + floor(random(6));
_loadout = 1 + floor(random(3));
_reinforcementLootCounts = [_weap,_mags,_optics,0,0,_backpacks];
	
diag_log format["blueDefault::  _chanceReinforcements = %1 and _chanceLoot = %2", _chanceReinforcements, _chanceLoot];
//diag_log format["blueDefault:: default reinforcement settings are %1",blck_reinforcementsBlue];

_endCondition = "playerNear";  // Options are "allUnitsKilled", "playerNear", "playerNear"
_timeout = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
