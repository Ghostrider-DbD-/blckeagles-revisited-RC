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
		requiredAddons[] = {"3den"};
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
			class help {};
			class about {};
			class initializeAttributes {};
			class isInfantry {};
			class isInside {};
			class buildingContainer {};
			class display {};
			class setDifficulty {};
			class setCompletionMode {}
			class setSpawnLocations {};
			class spawnCratesTiming {};
			class loadCratesTiming {};
			class endMessage {};
			class startMessage {};
			class configureGarrisonATL {};
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

		class blck_garison: Combo 
		{
			class Value
			{
				text = "Set Garison State";
				items[] = {"No_Garison","Has_garison"};
			};
			class no_garison 
			{
				text = "No Garison";
				//action = "_this setVariable['garison',0];";
			};
			class has_garison 
			{
				text = "Has Garison";
				//action = "_this setVariable['garison',1];";
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
	class Static;

	class blck_static: Static
	{
		class Attributes 
		{
			class garison 
			{
				displayName = "Garrison";
				toolTip = "Define Garisoned Buildings";
				control = "blck_garison";
			};
		};
	};
};

class ctrlMenuStrip;

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

				/*
				/////////////////////////////
				class blckMissionMessages 
				{
					text = "Set timing for loading crates";
					items[] = {
						"blckStartMessage",
						"blckEndMessage"
					};
				};
				//  ["Title","Default","ctrlControlsGroupNoScrollbars","ctrlControlsGroup","ctrlDefault"]
				class Edit;
				class blckEdit: Edit
				{
					control = "Edit";
					value = "";
				};
				class blckStartMessage: blckEdit
				{
					text = "Misstion Start Message";
					action = "[_value] call blck3DEN_startMessage";
				};
				class blckEndMessage: blckEdit
				{
					text = "Mission End Message";
					action = "[_value] call blck3DEN_endMessage";
				};
				*/

				class blckMissionLocation 
				{
					text = "Toggle Random or Fixed Location"
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

			class Attributes 
			{
				//items[] += {"blck_messages"};
				text = "blckeagls: Mission Messages"
			};
			class blck_messages 
			{
				text = "Mission Messages";
				items[] = {"blck_startMessage","blck_endMessage"};
			};
			class Edit;
			class blck_editMessages 
			{
				control = Edit;
				value = "";
			};
			class blck_startMessage: blck_editMessages 
			{
				text = "Set start Message";
				action = "['_value'] call blck3DEN_fnc_startMessage";
			};
			class blck_endMessage: blck_editMessages 
			{
				text = "Set end message";
				action = "['_value'] call blck3DEN_fnc_endMessage";
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////////////


