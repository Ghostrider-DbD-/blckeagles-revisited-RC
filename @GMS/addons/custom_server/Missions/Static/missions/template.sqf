

/*
	This is a simple mission using precisely placed loot crates and infantry, static weapons and vehicle patrols.
	See the accompanying example mission in the exampleMission folder to get an idea how I laid this out.
	Note that I exported the mission using the exportAll function of M3EDEN editor.
*/

#include "privateVars.sqf";

_mission = "static mission template";  //  Included for additional documentation. Not intended to be spawned as a mission per se.

_difficulty = "red";  // Skill level of AI (blue, red, green etc)

_crateLoot = blck_BoxLoot_Orange;  // You can use a customized _crateLoot configuration by defining an array here. It must follow the following format shown for a hypothetical loot array called _customLootArray
	/*
	_customLootArray = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
		[  
			[// Weapons	

				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]				
			],
			[//Magazines
				["10Rnd_93x64_DMR_05_Mag" ,1,5]				
			],			
			[  // Optics
				["optic_KHS_tan",1,3]
			],
			[// Materials and supplies				
				["Exile_Item_MetalScrews",3,10]
				//
			],
			[//Items
				["Exile_Item_MountainDupe",1,3]				
			],
			[ // Backpacks
				["B_OutdoorPack_tan",1,2]
			]
	];	
	*/

_lootCounts = blck_lootCountsRed; // You can use a customized set of loot counts or one that is predefined but it must follow the following format:
								  // values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
								  //  blck_lootCountsOrange = [[6,8],[24,32],[5,10],[25,35],16,1];   // Orange

/****************************************************

	PLACE MARKER DEFINITIONS PULLED FROM YOUR MISSION BELOW
	
*****************************************************/

_missionCenter = [2634.41,22127.7,0];
_markerType = ["mil_box",[0,0]];
_markerColor = "Default";
_markerMissionName = "Bad News Bears";
_markerLabel = "";

/****************************************************

	PLACE THE DATA DEFININING THE BUILDINGS, VEHICLES ETC. PULLED FROM YOUR MISSION BELOW
	
*****************************************************/
								  
_garrisonedBuildings_BuildingPosnSystem = [
     ["Land_Cargo_Tower_V1_No5_F",[2631.25,22161.8,2.63358],[[0,1,0],[0,0,1]],[true,true],"Red",0.67,3,10,4,600,-1]
];

_garrisonedBuilding_ASLsystem = [
     ["Land_Cargo_Tower_V1_No7_F",[2596.24,22093.9,11.1251],[[-0.994659,0.103214,0],[0,0,1]],[true,true],"Red",[["B_HMG_01_high_F",[3.66943,-4.49414,13.1028],98.8724],["B_HMG_01_high_F",[3.71802,-3.34766,18.3248],103.27],["B_HMG_01_high_F",[-1.64502,-0.0644531,20.9188],301.323]],[[[-1.80713,-3.39844,8.5904],0],[[-1.89453,1.23047,4.64288],0],[[-0.999268,-0.117188,17.9661],0],[[0.122314,-2.62891,17.8909],0]],600,-1]
];

_missionLandscape = [
     ["Land_Razorwire_F",[2598.06,22077.2,6.61092],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[2593.09,22069.8,5.63825],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2603.93,22074.2,3.31451],[[-0.808148,0.353358,0.471206],[0.188556,-0.602713,0.77536]],[true,true]],
     ["Land_Razorwire_F",[2608.05,22092.6,8.92718],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[2603.25,22085.6,9.1608],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2608.26,22080.8,5.0178],[[-0.697721,0.426652,0.575459],[0.530202,-0.232641,0.815331]],[true,true]],
     ["Land_HBarrier_01_big_tower_green_F",[2592.15,22140.3,12.675],[[-0.929912,0.317024,0.186437],[0.194858,-0.0052352,0.980817]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2623.27,22105.6,6.0089],[[-0.787623,0.527981,0.317625],[0.289688,-0.137655,0.94717]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2612.98,22088,6.26459],[[-0.756164,0.472755,0.452459],[0.39451,-0.222304,0.891595]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2616.91,22095.1,6.58389],[[-0.768901,0.525395,0.364351],[0.356306,-0.121062,0.926493]],[true,true]],
     ["Land_Razorwire_F",[2638.69,22136.7,3.22351],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[2633.59,22130.4,4.14247],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[2622.16,22119,7.20263],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[2628.34,22125.8,5.64734],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_HBarrier_01_wall_corridor_green_F",[2638,22122.4,3.50001],[[-0.562069,0.827048,0.00837636],[0.0598924,0.0305983,0.997736]],[true,true]],
     ["Land_HBarrier_01_big_tower_green_F",[2631.69,22115.2,4.81262],[[-0.816498,0.552055,0.169019],[0.211131,0.0130311,0.977371]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2627.84,22112.4,5.65952],[[-0.815257,0.559665,0.148765],[0.136056,-0.0645887,0.988593]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2633.06,22120.1,4.36103],[[-0.81511,0.577092,0.0506065],[0.137352,0.107655,0.984655]],[true,true]],
     ["Sign_Sphere100cm_F",[2633.58,22161.5,20.3391],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2642.79,22128,2.86908],[[-0.818151,0.573521,0.0412504],[0.107375,0.0819095,0.990839]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2647.64,22134.9,2.09253],[[-0.822645,0.568343,0.0155369],[0.0253224,0.00932551,0.999636]],[true,true]],
     ["Land_Razorwire_F",[2652.06,22150.5,1.93652],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[2642.87,22141.5,2.79323],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[2647.34,22145.8,2.48597],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[2656.23,22155.4,1.36567],[[-0.825716,0.564085,0],[0,0,1]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2651.93,22142,1.89926],[[-0.822376,0.56825,0.0280985],[0.0359766,0.00265033,0.999349]],[true,true]],
     ["Land_HBarrier_01_wall_6_green_F",[2656.98,22149,1.16155],[[-0.818034,0.570454,0.0735002],[0.108685,0.0278236,0.993687]],[true,true]]
];

_aiGroupParameters = [
     [[2558.96,22127.2,20.5699],"Red",[3,6],45,600,-1],
     [[2590.38,22150.9,12.6152],"Red",[3,6],45,600,-1],
     [[2581.74,22146.4,30.8829],"Red",[3,6],45,600,-1],
     [[2644.55,22157.2,1.88187],"Red",[3,6],45,600,-1]
];

_aiScubaGroupParameters = [
];

_vehiclePatrolParameters = [
     ["B_CTRG_LSV_01_light_F",[2609.08,22134.8,9.4568],"Red",75,600,-1],
     ["B_G_Offroad_01_armed_F",[2665.47,22098.3,3.79465],"Red",75,600,-1],
     ["B_Boat_Armed_01_minigun_F",[2638.39,22009,0],"Red",75,600,-1],
     ["B_Boat_Armed_01_minigun_F",[2720.73,22177.5,0],"Red",75,600,-1]
];

_airPatrols = [
];

_missionEmplacedWeapons = [
     ["B_HMG_01_high_F",[2593.12,22140.1,14.7976],"Red",0,600,-1],
     ["B_HMG_01_high_F",[2632.61,22114.4,6.81314],"Red",0,600,-1],
     ["B_HMG_01_high_F",[2656.01,22126.7,2.09379],"Red",0,600,-1]
];

_submarinePatrolParameters = [
];

_missionLootBoxes = [
     ["O_CargoNet_01_ammo_F",[2589.45,22117.3,11.7155],[[0,0.999353,-0.0359766],[0.245575,0.0348749,0.96875]],[true,false],_crateLoot,_lootCounts],
     ["O_CargoNet_01_ammo_F",[2596.74,22152.1,11.5449],[[0,0.998974,-0.0452868],[0.203641,0.0443379,0.978041]],[true,false],_crateLoot,_lootCounts]
];

	  
								  
/****************************************************

	ENABLE ANY SETTINGS YOU LIKE FROM THE LIST BELOW. 
	iF THESE ARE NOT ENABLED THEN THE DEFAULTS DEFINED IN BLCK_CONFIG.SQF 
	AND THE MOD-SPECIFIC CONFIGURATIONS WILL BE USED.
	
*****************************************************/								  
			
/*			
_missionLandscapeMode = "precise"; // acceptable values are "random","precise"
									// In precise mode objects will be spawned at the relative positions specified.
									// In the random mode, objects will be randomly spawned within the mission area.

_aircraftTypes = blck_patrolHelisRed;  //  You can use one of the pre-defined lists in blck_configs or your own custom array.
_noAirPatrols =	blck_noPatrolHelisRed; // You can use one of the pre-defined values or a custom one. acceptable values are integers (1,2,3) or a range such as [2,4]; 
										//  Note: this value is ignored if you specify air patrols in the array below.
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines  = blck_useMines;  // Set to false if you have vehicles patrolling nearby.
_uniforms  = blck_SkinList;  // You can replace this list with a custom list of uniforms if you like.
_headgear  = blck_headgear;  // You can replace this list with a custom list of headgear.
_vests     = blck_vests;     // You can replace this list with a custom list of vests.
_backpacks = blck_backpacks; // You can replace this list with a custom list of backpacks.
_weapons   = blck_WeaponList_Orange; // You can replace this list with a customized list of weapons, or another predifined list from blck_configs_epoch or blck_configs_exile as appropriate.
_sideArms  = blck_pistols;    // You can replace this list with a custom list of sidearms.
*/


//********************************************************
// Do not modify anything below this line.
//********************************************************

#include "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_initializeMission.sqf"; 

diag_log format["[blckeagls static missions] COMPLETED initializing middions %1 position at %2 difficulty %3",_mission,_missionCenter,_difficulty];