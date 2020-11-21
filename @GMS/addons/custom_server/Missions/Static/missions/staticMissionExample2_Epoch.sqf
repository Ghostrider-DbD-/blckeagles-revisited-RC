/*
	This is a simple mission using precisely placed loot crates and infantry, static weapons and vehicle patrols.
	See the accompanying example mission in the exampleMission folder to get an idea how I laid this out.
	Note that I exported the mission using the exportAll function of M3EDEN editor.
*/

#include "privateVars.sqf";

_mission = "static mission example #2";  //  Included for additional documentation. Not intended to be spawned as a mission per se.
_missionCenter = [22907,16789,0];  // I pulled this from the position of the marker.
_difficulty = "red";  // Skill level of AI (blue, red, green etc)
diag_log format["[blckeagls static missions] STARTED initializing middions %1 position at %2 difficulty %3",_mission,_missionCenter,_difficulty];
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

_markerLabel = "";
//_markerType = ["ellipse",[200,200],"GRID"];
// An alternative would be:
_markerType = ["mil_triangle",[0,0]];  // You can replace mil_triangle with any other valid Arma 3 marker type https://community.bistudio.com/wiki/cfgMarkers
_markerColor = "ColorRed";  //  This can be any valid Arma Marker Color  
_markerMissionName = "Bad People Live Here";
_missionLandscapeMode = "precise"; // acceptable values are "random","precise"
									// In precise mode objects will be spawned at the relative positions specified.
									// In the random mode, objects will be randomly spawned within the mission area.
_missionLandscape = [  //  Paste appropriate lines from M3EDEN output here.
	["Land_Cargo_HQ_V2_F",[22885.4,16756.8,3.19],[[0,1,0],[0,0,1]],[true,false]],
	["Land_Cargo_HQ_V1_F",[22918.1,16761.9,3.18151],[[0,1,0],[0,0,1]],[true,false]],
	["Land_Cargo_HQ_V3_F",[22907.6,16740.3,3.17544],[[0,1,0],[0,0,1]],[true,false]],
	["Land_Dome_Small_F",[22908.2,16808.8,3.19],[[0,1,0],[0,0,1]],[true,false]]
]; // list of objects to spawn as landscape using output from M3EDEN editor.

_missionLootBoxes = [  //  Paste appropriate lines from M3EDEN editor output here, then add the appropriate lootArray
	// [["box_classname1",_customLootArray1,[px,py,pz],...,_customLootArray1],["box_classname2",,[px2,py2,pz2],...,_customLootArray2]
	//  where _customLootArray follows the same format as blck_BoxLoot_Red and the other pre-defined arrays and
	//  where _customlootcountsarray1 also follows the same format as the predefined arrays like blck_lootCountsRed
	[selectRandom blck_crateTypes,[22917.4,16763,6.30803],[[0,1,0],[0,0,1]],[true,false], _crateLoot, [[1,2],[4,6],[2,6],[5,8],6,1] ],
	[selectRandom blck_crateTypes,[22893,16766.8,6.31652],[[0,1,0],[0,0,1]],[true,false], _crateLoot, _lootCounts],
	//  0               1                        2                  3             4           5 
	[selectRandom blck_crateTypes,[22904.8,16742.5,6.30195],[[0,1,0],[0,0,1]],[true,false], _crateLoot, _lootCounts]
];  // If this array is empty a single loot chest will be added at the center. If you add items loot chest(s) will be spawned in specific positions.



_missionLootVehicles = [  // Paste appropriate lines from the output of M3EDEN Editor here and add the loot crate type and loot counts at the end of each entry as shown in the example below.
						  // Many vehicles have less inventory capacity than crates so you may have to modify _lootcounts to avoid having stuff spawned all over the ground.
	["C_Van_01_box_EPOCH",[22896.8,16790.1,3.18987],[[0,1,0],[0,0,1]],[true,false], _crateLoot, [[1,2],[4,6],[2,6],[5,8],6,1]],
	["C_Van_01_transport_EPOCH",[22919,16782.7,3.18132],[[0,1,0],[0.00129187,0,0.999999]],[true,false],_crateLoot, _lootCounts]
]; //  [ ["vehicleClassName", [px, py, pz] /* possition at which to spawn*/, _loot /* pointer to array of loot (see below)]; 
// When blank nothing is spawned.
// You can use the same format used for _missionLootBoxes to add vehicles with/without loot.

_noEmplacedWeapons = blck_SpawnEmplaced_Red; // Modified as needed; can be a numberic value (e.g. 3) or range presented as [2,4]
//format: _noEmplacedWeapons  = [2,3]; // a range of values
// or _noEmplacedWeapons = 3; // a constant number of emplaced weps per misison
// Note that this value is ignored if you define static weapon positions and types in the array below.
_missionEmplacedWeapons = [
	["B_G_Mortar_01_F",[22867.3,16809.1,3.17968],"red",0,0],
	["B_HMG_01_high_F",[22944.3,16820.5,3.14243],"green",0,0]
]; 								// example [ ["emplacedClassName",[px, py, pz] /* position to spawn weapon */, difficulty /* difficulty of AI manning weapon (blue, red etc)] ];
								// can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
								// If the number of possible locations exceeds the number of emplaced weapons specified above then only some of the locations in the array will have emplaced weapons spawned.
								// If you leave this array blank then emplaced weapons will be spawned at random locations around the mission using the default list of emplace weapons.
								
_minNoAI = blck_MinAI_Red;  //  Modify as needed
_maxNoAI = blck_MaxAI_Red;	// Modify as needed.
_noAIGroups = blck_AIGrps_Red;  // Modify as needed; note that these values are ignored of you specify AI patrols in the array below.
_aiGroupParameters = [
	// [ [px, py, pz] /* position*/, "difficulty", 4 /*Number to Spawn*/, 150 /*radius of patrol*/]
	//[[22920.4,16887.3,3.19144],"red",[1,2], 75,120],
	//[[22993.3,16830.8,5.6292],"red",4, 75,9000],
	//[[22947.8,16717,6.80305],"red",4, 75,900],
//	[[22849,16720.4,7.33123],"red",4, 75,9000],
	//[[22832.9,16805.6,4.59315],"red",4, 75,900],
	[[22909.8,16778.6,3.19144],"red",4, 75,900],
	[[22809.4,16929.5,5.33892],"blue",1, 75,0],
	[[22819.4,16929.5,0],"red",1, 75, 10, 1]
];

_noVehiclePatrols = blck_SpawnVeh_Red; // Modified as needed; can be a numberic value (e.g. 3) or range presented as [2,4]; 
										//  Note that this value is ignored if you define vehicle patrols in the array below.
_vehiclePatrolParameters = [
	//["B_G_Offroad_01_armed_F",[22819.4,16929.5,3.17413],"green",600,0],
	[selectRandom blck_AIPatrolVehicles,[22809.5,16699.2,0],"blue",600,10,1]	
]; 							//[ ["vehicleClassName",[px,py,pz] /* center of patrol area */, difficulty /* blue, red etc*/, patrol radius] ]
							// When this array is empty, vehicle patrols will be scattered randomely around the mission.
							// Allows you to define the location of the center of the patrol, vehicle type spawned, radius to patrol, and AI difficulty (blue, red, green etc).

_aircraftTypes = blck_patrolHelisRed;  //  You can use one of the pre-defined lists in blck_configs or your own custom array.
_noAirPatrols =	blck_noPatrolHelisRed; // You can use one of the pre-defined values or a custom one. acceptable values are integers (1,2,3) or a range such as [2,4]; 
										//  Note: this value is ignored if you specify air patrols in the array below.
_airPatrols = [
	["C_Heli_Light_01_armed_EPOCH",[22923.4,16953,3.19],"red",1000,900]//,
	//[selectRandom _aircraftTypes,[22830.2,16618.1,11.4549],"blue",1000,60]
];
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines  = blck_useMines;  // Set to false if you have vehicles patrolling nearby.
_uniforms  = blck_SkinList;  // You can replace this list with a custom list of uniforms if you like.
_headgear  = blck_headgear;  // You can replace this list with a custom list of headgear.
_vests     = blck_vests;     // You can replace this list with a custom list of vests.
_backpacks = blck_backpacks; // You can replace this list with a custom list of backpacks.
_weapons   = blck_WeaponList_Orange; // You can replace this list with a customized list of weapons, or another predifined list from blck_configs_epoch or blck_configs_exile as appropriate.
_sideArms  = blck_pistols;    // You can replace this list with a custom list of sidearms.

#include "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_initializeMission.sqf"; 

diag_log format["[blckeagls static missions] COMPLETED initializing middions %1 position at %2 difficulty %3",_mission,_missionCenter,_difficulty];
