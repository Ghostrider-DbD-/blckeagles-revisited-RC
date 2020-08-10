/*

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

			//class saveInitPlayerLocal {};
			//class saveWeather {};
			//class saveMarkers {};
			//class exportCheck {};
		};

		class Core 
		{
			file = "3EDEN_plugin\Core";
			class help {};
			class about {};
			class init {
				postInit = 1;
			};
		};

	};
	
};

///////////////////////////////////////////////////////////////////////////////

class ctrlCombo;

///////////////////////////////////////////////////////////////////////////////

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