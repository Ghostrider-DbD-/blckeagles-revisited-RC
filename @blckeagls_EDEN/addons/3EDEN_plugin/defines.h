// defines.h
/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	Parts of defines.h were derived from the Exile_3EDEN editor plugin 
	* and is licensed as follows:
	* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
	* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.	
*/

/*
	**************************************
	DO NOT CHANGE ANYTHING BELOW THIS LINE 
	**************************************
*/
class CfgPatches
{
	class blckeagls_3den
	{
		requiredVersion = 0.1;
		requiredAddons[] = {3DEN};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};

///////////////////////////////////////////////////////////////////////////////

class CfgFunctions
{

	class blck3DEN
	{
		class Export
		{
			file = "3EDEN_plugin\Export";
			class exportDynamic {};
			class exportStatic {};
		};

		class Core 
		{
			file = "3EDEN_plugin\Core";

			class about {};
			class buildingContainer {};
			class configureGarrisonATL {};
			class createLootMarker {};
			class createGarrisonMarker {};
			class display {};			
			class displayGarrisonMarkers {};
			class displayLootMarkers {};
			class getGarrisonInfo {};
			class getLootVehicleInfo {};
			class isInside {};
			class loadCratesTiming {};
			class onDrag {};
			class onRegistered {};
			class onUnregister {};
			class removeMarker {};
			class setDifficulty {};
			class setCompletionMode {}
			class setGarrison {};
			class setLootVehicle {};
			class setSpawnLocations {};
			class spawnCratesTiming {};
            class versionInfo {};
		};
	};
};

///////////////////////////////////////////////////////////////////////////////

class ctrlCombo;
class ctrlCheckbox;
class ctrlCheckboxes;
class ctrlEdit;

class cfg3DEN 
{
	class EventHandlers 
	{
		class blckeagls 
		{
			OnMissionLoad = "call blck3DEN_fnc_initializeAttributes";
			OnMissionNew  = "call blck3DEN_fnc_initializeAttributes";
			//onHistoryChange = "call blck3DEN_fnc_updateObjects";
		};
	};
	
	class Attributes 
	{
		class Default;

		class Title: Default 
		{
			class Controls 
			{
				class Title;
			};
		};
		
		class Combo: Title
		{
			class Controls: Controls 
			{
				class Title: Title {};
				class Value: ctrlCombo {};
			};
		};

	};


	class Mission 
	{

	};

	class Object 
	{
		class AttributeCategories 
		{

		};
	};
};	
	

class CfgVehicles
{

};

class ctrlMenuStrip;
class ctrlMenu; 

class display3DEN
{
	class Controls
	{
		class MenuStrip: ctrlMenuStrip
		{

			class Items
			{
				items[] += {"Blackeagls"};

				class Blackeagls
				{
					text = "Blackeagls";
					items[] = {
						"blckAbout3EDENPlugin",
						"blckSeparator",
						"blckMissionDifficulty",
						"blckMissionCompletionMode",
						"lootSpawnTiming",
						"loadCratesTiming",
						"blckSeparator",
						//"blckMissionMessages",
						"blckMissionLocation",
						"blckSeparator",
						"blck_setGarrison",
						//"blck_getGarrisonInfo",
						//"blck_getMissionGarrisonInfo",
						"blckSeparator",						
						"blck_markLootVehicle",		
						//"blck_getLootVehicleInfo",
						//"blck_getMissionLootVehicleInfo",
						"blckSeparator",						
						"blckSaveStaticMission", 
						"blckSaveDynamicMission",
						"blckSeparator",
						"blck3EDENPluginHelp"
					 };
				};

				class blckAbout3EDENPlugin 
				{
					text = "3EDEN Plugin Version 1.0 for BlckEagls by Ghostrider-GRG-";
					action = "call blck3EDEN_fnc_about";
				};

				class blckSeparator 
				{
					value = 0;
				};

				class blck_setDifficulty 
				{
					text = "Set Mission Difficulty";
					items[] = {
						"difficulty_blue"
					};
				};

				class difficulty_blue 
				{
					text = "Easy (Blue)";
					action = "['Blue'] call blck3DEN_fnc_setDifficulty";
				};

				class blck_setLootSpawnTime 
				{
					text = "Set Lootcrate Spawn Timing";
					action = "edit3DENMissionAttributes 'lootSpawnTime'";
				};
	
				class blckMissionDifficulty 
				{
					text = "Set Mission Difficulty";
					items[] = {
						"blckDifficultyBlue",
						"blckDifficultyRed",
						"blckDifficutlyGreen",
						"blckDifficultyOrange"
					};			
				};
				class blckDifficultyBlue 
				{
					text = "Set Mission Difficutly to EASY (Blue)";
					action = "['Blue'] call blck3DEN_fnc_setDifficulty;";
					value = "Blue";
				};
				class blckDifficultyRed 
				{
					text = "Set Mission Difficulty to MEDIUM (Red)";
					action = "['Red'] call blck3DEN_fnc_setDifficulty;";
					value = "Red";
				};
				class blckDifficutlyGreen 
				{
					text = "Set Mission Difficult To HARD (Green)";
					action =  "['Green'] call blck3DEN_fnc_setDifficulty;";
					value = "Green";
				};
				class blckDifficultyOrange 
				{
					text = "Set Mission Difficulty to Very HARD (Orange)";
					action =  "['Orange'] call blck3DEN_fnc_setDifficulty;";
					value = "Orange";
				};	

				
				class blckMissionCompletionMode 
				{
					text = "Set the Criterial for Mission Completion";
					items[] = {
						"playerNear",
						"allUnitsKilled",
						"allKilledOrPlayerNear"
					};
				};
				class allUnitsKilled 
				{
					text = "All AI Dead";
					toolTip = "Mission is complete only when All AI are Dead";
					action = "['allUnitsKilled'] call blck3DEN_fnc_setCompletionMode;";
					value = "allUnitsKilled";
				};
				class playerNear 
				{
					text = "Player near mission center";
					toolTip = "MIssion is Complete when a player reaches the mission center";
					action = "['playerNear'] call blck3DEN_fnc_setCompletionMode;";
					value = "playerNear";
				};
				class allKilledOrPlayerNear 
				{
					text = "Units Dead / Player @ Center";
					toolTip = "Mission is Complete when all units are dead or a player reaches mission center";
					action = "['allKilledOrPlayerNear'] call blck3DEN_fnc_setCompletionMode;";
					value = "allKilledOrPlayerNear";
				};

				class lootSpawnTiming 
				{
					text = "Set timing for spawning loot chests";
					items[] = {
						"atMissionSpawnGround",
						"atMissionSpawnAir",
						"atMissionEndGround",
						"atMissionEndAir"
					};
				};
				class atMissionSpawnGround 
				{
					text = "Crates are spawned on the ground at mission startup";
					action = "['atMissionSpawnGround'] call blck3DEN_fnc_spawnCratesTiming;";
				};
				class atMissionSpawnAir 
				{
					text = "Crates are spawned in the air at mission startup";
					action = "['atMissionSpawnAir'] call blck3DEN_fnc_spawnCratesTiming;";
				};				
				class atMissionEndGround 
				{
					text = "Crates are spawned on the ground at mission completion";
					action = "['atMissionEndGround'] call blck3DEN_fnc_spawnCratesTiming;";
				};	
				class atMissionEndAir 
				{
					text = "Crates are spawned in the air at mission completion";
					action = "['atMissionEndAir'] call blck3DEN_fnc_spawnCratesTiming;";
				};	

				class loadCratesTiming 
				{
					text = "Set timing for loading crates";
					items[] = {
						"atMissionSpawn",
						"atMissionCompletion"
					};
				};
				class atMissionSpawn 
				{
					text = "Load crates when the mission spawns";
					action = "['atMissionSpawn'] call blck3DEN_fnc_loadCratesTiming";
				};
				class atMissionCompletion 
				{
					text = "Load crates when the mission is complete";
					action = "['atMissionCompletion'] call blck3DEN_fnc_loadCratesTiming";
				};

				class blckMissionLocation 
				{
					text = "Toggle Random or Fixed Location";
					toolTip = "Set whether mission spawns at random or fixed locations";
					items[] = {
						"blck_randomLocation",
						"blck_fixedLocation"
					};
				};
				class blck_randomLocation 
				{
					text = "Spawn at Random Locations (Default)";
					action = "['randm'] call blck3DEN_fnc_setSpawnLocations";
				};
				class blck_fixedLocation 
				{
					text = "Always spawn at the same location";
					toolTip = "Use to have mission respawn at same location";
					action = "['fixed'] call blck3DEN_fnc_setSpawnLocations";
				};

				///////////////////////////////////////////////////////

				class blck_setGarrison 
				{
					text = "Garrisoned Building Settings";
					toolTip = "Set garrison status of selected buildings";
					items[] = {
						"blck_setGarrisonedState",
						"blck_getGarrisonInfo",
						"blck_garrisonMarkers"
					};
				};
				class blck_setGarrisonedState 
				{
					items[] = {
						"blck_isGarrisoned",
						"blck_clearGarrisoned"
					};
					text = "Garrison Settings";
				};
				class blck_isGarrisoned 
				{
					text = "Garrison Building";
					toolTip = "Flag selected buildings to be garrisoned";
					value = true;
					action = "[true] call blck3DEN_fnc_setGarrison";
				};
				class blck_clearGarrisoned 
				{
					text = "Remove Garrison";
					toolTip = "Selected Buildings will Not be Garrisoned";
					value = false;
					action = "[false] call blck3DEN_fnc_setGarrison";
				};			
				class blck_getGarrisonInfo 
				{
					text = "Get Building Garrisoned Setting";
					toolTip = "Get the selected buildings garrisoned flag";
					action = "call blck3DEN_fnc_getGarrisonInfo";
				};
				class blck_garrisonMarkers 
				{
					items[] = {
						"blck_GarrisonMarkersOn",
						"blck_GarrisonMarkersOff"
					};
					text = "Toggle markers over garrisoned buildings";
				};
				class blck_GarrisonMarkersOn
				{
					text = "Display Markers over Garrisoned Buildings";
					action = "[true] call blck3DEN_fnc_displayGarrisonMarkers";
				};
				class blck_GarrisonMarkersOff
				{
					text = "Hide Markers over Garrisoned Buildings";
					action = "[false] call blck3DEN_fnc_displayGarrisonMarkers";
				};		

				///////////////////////////////////////////////////////////////		

				class blck_markLootVehicle 
				{
					text = "Loot Vehicle Settings";
					items[] = {
						"blck_designateLootVehicleState",				
						"blck_getLootVehicleInfo",
						"blck_displayLootMarkers"
					};
				};
				class blck_designateLootVehicleState 
				{
					items[] = {
						"blck_setAsLootVehicle",
						"blck_clearLootVehicleFlag"
					};
					text = "Loot Vehicle Settings";
				};
				class blck_clearLootVehicleFlag 
				{
					text = "Clear Loot Vehicle Settings";
					action = "[false] call blck3DEN_fnc_setLootVehicle";
				};
				class blck_setAsLootVehicle 
				{
					text = "Desinate Loot Vehicle";
					action = "[true] call blck3DEN_fnc_setLootVehicle";
				};		
				class blck_getLootVehicleInfo 
				{
					text = "Get setting for selected vehicle";
					action = "call blck3DEN_fnc_getLootVehicleInfo";
				};	
				class blck_displayLootMarkers 
				{
					items[] = {
						"blck_lootMarkersOn",
						"blck_lootMarkersOff"
					};
					text = "Toggle Loot Vehicle Markers";
				};
				class blck_lootMarkersOn 
				{
					text = "Mark Loot Vehicles / Objects";
					action = "[true] call blck3DEN_fnc_displayLootMarkers";
				};
				class blck_lootMarkersOff 
				{
					text = "Hide Markers of Loot Vehicles / Objects";
					action = "[false] call blck3DEN_fnc_displayLootMarkers";
				};
				/////////////////////////////
				class blckSaveStaticMission
				{
					text = "Save StaticMission";
					action = "call blck3DEN_fnc_exportStatic";
					picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
				};

				class blckSaveDynamicMission
				{
					text = "Save Dynamic Mission";
					action = "call blck3DEN_fnc_exportDynamic";
					picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
				};

				class Blck3EDENPluginHelp
				{
					text = "Help";
					action = "call blck3DEN_fnc_Help";
					//picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
				};

			};
		};
	};
};


///////////////////////////////////////////////////////////////////////////////


