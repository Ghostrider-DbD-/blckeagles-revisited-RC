/*
	_fnc_alertNearbyUnits
	by Ghostrider
	Allerts all units within a certain radius of the location of a killer.
	**  Not in use at this time; reserved for the future  **
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params["_unit","_killer"];

private "_units";
if (toLower(blck_modType) isEqualTo "epoch") then {_units = _unit nearEntities ["I_Soldier_EPOCH", (_unit getVariable ["alertDist",300])]};
if !(toLower(blck_modType) isEqualTo "epoch") then {_units = _unit nearEntities ["i_g_soldier_unarmed_f", (_unit getVariable ["alertDist",300])]};
{
	_x reveal[_killer, (_x knowsAbout _killer) + random(_unit getVariable ["intelligence",1])]
}forEach _units;
