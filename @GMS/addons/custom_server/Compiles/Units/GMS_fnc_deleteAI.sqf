/*
  Delete a unit.
  by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_ai","_group"];
params["_unit"];

{
	_unit removeAllEventHandlers  _x;
}forEach ["reloaded"];
{
	_unit removeAllMPEventHandlers _x;
} forEach ["MPKilled","MPHit"];
_group = (group _unit);
deleteVehicle _unit;
if (count units _group isEqualTo 0) then
{
	deletegroup _group;
};

