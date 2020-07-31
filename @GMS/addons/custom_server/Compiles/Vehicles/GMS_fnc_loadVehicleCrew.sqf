/*
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

if (isNil "blck_blacklisted_vehicle_weapons") then {blck_blacklisted_vehicle_weapons = []};
params["_veh","_group",["_crewCount",4]];
private _units = units _group;

for "_i" from 1 to _crewCount do 
{
	if (_units isEqualTo []) exitWith {};
	_crew = _units deleteAt 0;
	_crew moveInAny _veh;
};
{deleteVehicle _x} forEach _units;

