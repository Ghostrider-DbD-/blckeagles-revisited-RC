// defines.h


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
			class spawnCratesTiming {};
			class loadCratesTiming {};
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
		
	};

	class Mission 
	{

	};
};	
	

class CfgVehicles
{
	
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
						//"blckSeparator",
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

				class Attributes 
				{
					items[] += {
						"blck_setDifficulty"
					};
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
					value = "allUnitsKilled";
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

				/////////////////////////////
				class blckMissionMessages 
				{
					text = "Set timing for loading crates";
					items[] = {
						"blckStartMessage",
						"blckEndMessage"
					};
				};
				class blckStartMessage 
				{
					text = "Misstion Start Message";
					//action = "edit3DENMissionAttributes 'MissionStartMsg';";
				};
				class blckEndMessage 
				{
					text = "Mission End Message";
					//action = "edit3DENMissionAttributes 'MissionEndMsg';";
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


