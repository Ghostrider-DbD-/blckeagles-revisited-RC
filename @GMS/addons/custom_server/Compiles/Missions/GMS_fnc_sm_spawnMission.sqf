/*
	by Ghostrider [GRG]
	for ghostridergaming
	12/5/17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params["_mission"];
// Spawn landscape
// params["_objects"];
[_missionLandscape] call blck_fnc_sm_spawnObjects;
uiSleep 10; // Let the objects 'settle' before placing anything on or around them.


// Spawn Air Patrols
[_airPatrols,_noAirPatrols,_aircraftTypes,_missionCenter,_difficulty,_uniforms,_headgear,_weapons] call blck_fnc_sm_spawnAirPatrols;

// Spawn Vehicle Patrols
[_missionCenter,_noVehiclePatrols,_vehiclePatrolParameters,_difficulty,_uniforms,_headGear] call blck_fnc_sm_spawnVehiclePatrols;

// spawn infantry
[_aiGroupParameters, _missionCenter,_minNoAI,_maxNoAI,_difficulty,_weapons,_uniforms,_headGear] call blck_fnc_sm_spawnInfantryPatrols;

// spawn loot vehicles
[_missionLootVehicles,_missionCenter,_crateLoot,_lootCounts] call blck_fnc_sm_spawnLootContainers;

// Spawn static weapons
[_missionEmplacedWeapons,_noEmplacedWeapons,_difficulty,_missionCenter,_uniforms,_headGear] call blck_fnc_sm_spawnEmplaceds;

// spawn loot chests
[_missionLootBoxes,_missionCenter,_crateLoot,_lootCounts] call blck_fnc_sm_spawnLootContainers;

_blck_localMissionMarker = ["",_missionCenter,"","",_markerColor,_markerType];
[_blck_localMissionMarker] call blck_fnc_spawnMarker;


