/*
	Mission Template by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#include "\q\addons\custom_server\Missions\privateVars.sqf";

//diag_log "[blckeagls] Spawning Blue Mission with template = default2";

_crateLoot = blck_BoxLoot_Blue;  
			/*
			You can use a customized loot array if you like. The format is as follows. note that for each category you can give a number or a range.
		_crateLoot = [
			[// Weapons
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"]		
			],
			[//Magazines
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],	
			[  // Optics
				["optic_KHS_tan",1,3]
			],
			[// Materials and supplies				
				["Exile_Item_CamoTentKit",1,6]
			],
			[//Items
				["Exile_Item_MountainDupe",1,3]	
			],
			[ // Backpacks
				["B_OutdoorPack_tan",1,2]
			]
		];			
		*/
_lootCounts = blck_lootCountsBlue;
			/*
			You can use a customized array here if you like; note that you can give a value or a range.
				// values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
		blck_lootCountsOrange = [
			[6,8],  //  Weapons
			[24,32], // Magazines
			[5,10], // Optics
			[25,35], //  materials(cinder etc)
			16,  //  items (food etc)
			1  //  backpacks
		];   // Orange
		*/
_startMsg = "A group of Bandits was sighted in a nearby sector! Check the Blue marker on your map for the location!";
_endMsg = "The Sector at the Blue Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[175,175],"GRID"];
_markerColor = "ColorBlue";
_markerMissionName = "Bandit Patrol";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
		["Flag_AAF_F",[3,3,0],0,[false,false]],
		["Land_dp_transformer_F",[1.698242,-10.4668,-0.00763702],271.32,[true,false]], 
		["Land_Wreck_BRDM2_F",[1.37012,13.498,0.00109863],184.487,[true,false]], 
		["Land_BagBunker_Small_F",[18.4512,-3.66406,0.00780487],305.003,[true,false]], 
		["Land_Cargo_HQ_V1_F",[-20.1367,11.7539,0],90.8565,1,0,[],"","",true,false]], 
		["Land_BagBunker_Small_F",[-22.707,-3.75586,-0.0130234],44.9901,[true,false]], 
		["Land_Cargo_House_V1_F",[24.3584,7.45313,0.00111389],91.6329,[true,false]], 
		["StorageBladder_01_fuel_forest_F",[1.29492,29.3184,0.000999451],179.65,[true,false]], 
		["Land_GarbageBags_F",[-9.45996,31.252,0.02005],184.595,[true,false]], 
		["Land_GarbageBags_F",[-13.0459,32.668,-0.0283051],184.595,[true,false]], 
		["Land_GarbageBags_F",[-11.5957,33.125,-0.598007],184.595,[true,false]], 
		["Land_GarbageBags_F",[-8.98145,34.5801,-0.00514221],184.592,[true,false]], 
		["Land_Addon_02_V1_ruins_F",[24.8369,24.6582,-0.00820923],90.9637,[true,false]], 
		["Land_GarbageBags_F",[-10.9443,35.0449,0.577057],184.592,[true,false]], 
		["Land_Cargo20_military_green_F",[14.6533,32.9004,0.000480652],90.0989,[true,false]], 
		["Land_BagBunker_Small_F",[-23.0186,28.6738,-0.0271301],120.012,[true,false]], 
		["Land_BagBunker_Small_F",[37.1504,34.5742,0.0146866],255,[true,false]]
		]; // list of objects to spawn as landscape; // list of objects to spawn as landscape
	
_missionLootBoxes = [
		["Box_NATO_Wps_F",[3,-3,0],_crateLoot,[4,10,2,5,5,1]],  // Standard loot crate with standard loadout
		["Land_PaperBox_C_EPOCH",[-4,-3,0],_crateLoot,[0,0,0,10,10,3]],  	// No Weapons, Magazines, or optics; 10 each construction supplies and food/drink items, 3 backpacks
		["Land_CargoBox_V1_F",[3,4,0],_crateLoot,[0,10,2,5,5,1]]
		];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.

		// blck_lootCountsBlue= [4,12,3,6,6,1];
_missionLootVehicles = [
	["I_G_Offroad_01_armed_F",[-8,8,0],_crateLoot,[0,10,2,5,5,1]],
	["I_G_Offroad_01_armed_F",[8,17,0],_crateLoot,[0,10,2,5,5,1]]
	]; //  Parameters are "vehiclel type", offset relative to mission center, loot array, items to load from each category of the loot array.
	//  ["B_HMG_01_high_F"/*,"B_GMG_01_high_F","O_static_AT_F"*/];

_missionGroups = 
	[
	//_x params["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
	[[-10.9121,-10.9824,-1.20243],5,7,"Green",5,12],
	[[-10.2305,10.0215,-0.941586],5,7,"Green",5,12],
	[[10.5605,-10.4043,-0.00143886],5,7,"Green",5,12],
	[[10.61133,10.5918,-0.001438863],5,7,"Green",5,12]
	]; // Can be used to define spawn positions of AI patrols
	
_missionEmplacedWeapons = [
	["B_HMG_01_high_F",[-10,-15,0]],
	["B_GMG_01_high_F",[10,12,0]],
	["O_static_AT_F",[-10,10,0]]
	]; // can be used to define the type and precise placement of static weapons [["wep",[1,2,3]] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used

_missionPatrolVehicles = [
	["B_MRAP_01_hmg_F",[27.8945,100.275,0],0,[true,false]],
	["B_MRAP_01_hmg_F",[-84.7793,72.2617,9.53674e-007],0,[true,false]],
	["B_MRAP_01_gmg_F",[-87.8457,-109.947,7.15256e-007],0,[true,false]]
];	
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Blue;
_maxNoAI = blck_MaxAI_Blue;
_noAIGroups = blck_AIGrps_Blue;
_noVehiclePatrols = blck_SpawnVeh_Blue;
_noEmplacedWeapons = blck_SpawnEmplaced_Blue;
//_uniforms = blck_SkinList;

_uniforms = ["U_OrestesBody","U_NikosAgedBody","U_NikosBody"];

_headgear = ["H_StrawHat_dark","H_StrawHat","H_Hat_brown","H_Hat_grey"];
_weaponList = ["blue"] call blck_fnc_selectAILoadout;
/*
_weaponList = [
	"arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F",
	"LMG_Mk200_F","LMG_Zafir_F"
	];
*/
_sideArms = blck_Pistols;
_vests = blck_vests;
/*
_vests = [
	"V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierIAGL_oli"
  };
*/
_backpacks = blck_backpacks;
/*
_backpacks = 
{

};
*/
//_chancePara = blck_chanceParaBlue; // Setting this in the mission file overrides the defaults 
_noPara = blck_noParaBlue;  // Setting this in the mission file overrides the defaults 
//_chanceHeliPatrol = blck_chanceHeliPatrolBlue;  // Setting this in the mission file overrides the defaults 
_noChoppers = blck_noPatrolHelisBlue;
_missionHelis = blck_patrolHelisBlue;
_endCondition =   // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
