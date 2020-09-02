/*
	Spawn a vehicle and protect it against cleanup by Epoch
	Returns the object (vehicle) created.
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_vehType","_pos",["_maxCrew",3]];

private _veh = [_vehType,_pos] call blck_fnc_spawnVehicle;
_veh setVariable["blck_vehicleSearchRadius",blck_playerDetectionRangeSubs];
_veh setVariable["blck_vehiclePlayerDetectionOdds",blck_vehiclePlayerDetectionOdds];
[_veh,2] call blck_fnc_configureMissionVehicle;

_veh
	
