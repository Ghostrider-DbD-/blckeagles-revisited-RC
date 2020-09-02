
/*
	By Ghostrider-GRG-
	And Ignatz-HeMan
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_veh"];
[_veh] call blck_fnc_unlockVehicle;
{
	_veh removealleventhandlers _x;
} forEach ["Local","GetIn","GetOut","fired","hit","hitpart","reloaded","dammaged","HandleDamage"];
{
	_veh removeAllMPEventHandlers _x;
} forEach ["MPHit","MPKilled"];
if ((damage _veh) > 0.6) then {_veh setDamage 0.6};  //  So they don't blow up when a player tries to get in.
