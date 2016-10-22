/*
Mission Compositions by Bill prepared for DBD Clan
*/

_crateLoot = 
		[  
			[// Weapons	
			],
			[//Magazines
			],			
			[  // Optics
			],
			[// Materials and supplies				
			],
			[//Items
			],
			[ // Backpacks
			]
	];

private ["_markerLabel","_endMsg","_startMsg","_lootCounts","_crateLoot","_markerMissionName","_missionLandscapeMode","_missionLandscape",
	"_missionLootBoxes","_missionLootVehicles","_missionEmplacedWeapons","_minNoAI","_maxNoAI","_noAIGroups","_noVehiclePatrols","_noEmplacedWeapons",
	"_uniforms","_headgear","_chanceReinforcements","_noPara","_helipatrol","_endCondition"];
diag_log "[blckeagls] Spawning Orange Mission with template = default2";
_crateLoot = blck_BoxLoot_Orange;
_lootCounts = blck_lootCountsOrange;
_startMsg = "A group of Bandits was sighted in a nearby sector! Check the Orange marker on your map for the location!";
_endMsg = "The Sector at the Orange Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELIPSE",[250,250],"GRID"];
_markerColor = "ColorOrange";
_markerMissionName = "Bandit Patrol";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = []; // list of objects to spawn as landscape
_missionLootBoxes = [
		["Box_NATO_Wps_F",_crateLoot,[0,0,0]],  // Standard loot crate with standard loadout
		["Land_PaperBox_C_EPOCH",_crateLoot,[-5,-5,0]],  	// No Weapons, Magazines, or optics; 10 each construction supplies and food/drink items, 3 backpacks
		["Land_CargoBox_V1_F",_crateLoot,[7, 5.4,0]]];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = [["I_G_Offroad_01_armed_F","I_G_Offroad_01_armed_F"]]; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
_minNoAI = blck_MinAI_Orange;
_maxNoAI = blck_MaxAI_Orange;
_noAIGroups = blck_AIGrps_Orange;
_noVehiclePatrols = blck_SpawnVeh_Orange;
_noEmplacedWeapons = blck_SpawnEmplaced_Orange;
_uniforms = blck_SkinList;
_headgear = blck_headgear;
_chanceReinforcements = blck_reinforcementsOrange select 0;
_noPara = blck_reinforcementsOrange select 1;
_helipatrol = blck_reinforcementsOrange select 2;
_endCondition = "playerNear";  // Options are "allUnitsKilled", "playerNear", "playerNear"
_timeout = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
