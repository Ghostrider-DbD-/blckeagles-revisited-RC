/*
	Managages simulation using blckeagls logic 	
	By Ghostrider-GRG-

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

if (blck_simulationManager isEqualTo blck_simulationManagementOff) exitWith {};

if (blck_simulationManager isEqualTo blck_useDynamicSimulationManagement) exitWith 
{
	// wake groups up if needed.
	{
		private _group = _x;
		private _nearplayer = [position (leader _group),blck_simulationEnabledDistance] call blck_fnc_nearestPlayers;	
		if !(_nearPlayer isEqualTo []) then 
		{
			_group reveal [(_nearplayer select 0),(_group knowsAbout (_nearPlayer select 0)) + 0.001];  //  Force simulation on
		};
	} forEach blck_monitoredMissionAIGroups;
};

if (blck_simulationManager isEqualTo blck_useBlckeaglsSimulationManager) then
{

	{
		private _group = _x;
		private _nearplayer = [position (leader _group),blck_simulationEnabledDistance] call blck_fnc_nearestPlayers;	
		if !(_nearplayer isEqualTo []) then
		{
			if !(simulationEnabled (leader _group)) then
			{	
				{
					_x enableSimulationGlobal  true;
					_x reveal [(_nearplayer select 0),(_group knowsAbout (_nearPlayer select 0)) + 0.001];   //  Force simulation on
				}forEach units _group;
			};
		}else{
			if (simulationEnabled (leader _group)) then
			{	
				{_x enableSimulationGlobal false} forEach units _group;				
			};
		};
	} forEach blck_monitoredMissionAIGroups;

	{
		// disable simulation once players have left the area.
		private _nearPlayers = [position (_x),blck_simulationEnabledDistance] call blck_fnc_nearestPlayers;		
		if (simulationEnabled _x) then 
		{		
			if (_nearPlayers isEqualTo []) then 
			{
				_x enableSimulationGlobal false;
			};
		} else {
			if !(_nearPlayers isEqualTo []) then 
			{
				_x enableSimulationGlobal true;			
			};
		};
	} forEach units blck_graveyardGroup;		
};


