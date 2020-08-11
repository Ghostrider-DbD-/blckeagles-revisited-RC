/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-

	Parts of config.cpp were derived from the Exile_3EDEN editor plugin 
	* and is licensed as follows:
	* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
	* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
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

	class blck3EDEN
	{
		class Export
		{
			file = "3EDEN_plugin\Export";
			class exportDynamic {};
			class exportStatic {};
			//class buildingContainer {};			
			//class isInfantry {};
			//class isInside {};

		};

		class Core 
		{
			file = "3EDEN_plugin\Core";
			class help {};
			class about {};
		};

	};
	
};

///////////////////////////////////////////////////////////////////////////////

class ctrlCombo;

class cfg3EDEN 
{
	class EventHandlers 
	{
		class blck 
		{

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

		class missionDifficulty: Combo 
		{
			class Controls: Controls 
			{
				class Title: Title {};
				class Value: Value 
				{
					onLoad = "\
					{\
						_index = _control lbAdd _x;\
						_control lbsetdata [_index,_x];\
					}\
					forEach['','Blue (Easy)','Red (Medium)','Green (Hard)','Orange (Very Hard)'];";
				};
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
						"blckSaveStaticMission", 
						"blckSaveDynamicMission",
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

				class blckSaveStaticMission
				{
					text = "Save StaticMission";
					action = "call blck3EDEN_fnc_exportStatic";
					picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
				};

				class blckSaveDynamicMission
				{
					text = "Save Dynamic Mission";
					action = "call blck3EDEN_fnc_exportDynamic";
					picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
				};

				class Blck3EDENPluginHelp
				{
					text = "Help";
					action = "call blck3EDEN_fnc_Help";
					//picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
				};

			};
		};
	};
};

///////////////////////////////////////////////////////////////////////////////

class CfgVehicles
{
	class B_Soldier_base_F;
	//

};