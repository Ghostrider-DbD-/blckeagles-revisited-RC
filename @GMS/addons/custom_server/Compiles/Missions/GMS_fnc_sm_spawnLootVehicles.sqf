/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_vehicleDescriptors","_coords"];

//  Spawn loot crates where specified in _objects using the information for loot parameters provided for each location.
{
	// data within the descriptor for each loot vehicle is organized as follows (not that the _allowDamageSim is included just for backward compatibilty but is not used)
	_x params["_vehcleClassName","_posATL","_vectorDirUp","_allowDamageSim","_loot","_lootCounts"];	
	private _veh = [_vehcleClassName,_posATL,"NONE",30] call blck_fnc_spawnVehicle;
	[_veh, _loot,_lootCounts] call blck_fnc_fillBoxes;
} forEach _vehicleDescriptors;




