/*
	_fnc_alertNearbyVehicles
	by Ghostrider
	 
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params[["_target",objNull]];

if !(isnull _target) then 
{
	private _nearestVehicles = (nearestObjects [getPos _target,["Car","Tank","Ship","Air"],300]);
	if !(_nearestVehicles isEqualTo []) then 
	{
		if (random(1) < 0.33) then {[(crew (_nearestVehicles select 0)) select 0,_target] call blck_fnc_alertGroupUnits};
	};
};




