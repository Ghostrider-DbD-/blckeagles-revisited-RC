/*
	By Ghostrider [GRG]
    _fnc_handleVehicleGetOut
    Processes an event that fires when a unit gets out of a vehicle
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#define veh _this select 0
if ((isServer) || local (veh)) then {[veh] call blck_fnc_checkForEmptyVehicle};