/*
  by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_character","_center","_characterBuildingConfigs"];

private ["_obj"];
if !(_characterBuildingConfigs isEqualTo []) then
{
	_obj = createVehicle[(_characterBuildingConfigs select 0),_center vectorAdd (_characterBuildingConfigs select 1),[],0,"CAN_COLLIDE"];
	_obj setDir (_characterBuildingConfigs select 2);
	_obj allowDamage true;
	_obj enableDynamicSimulation true;		
	_character setPosATL (_obj buildingPos (round(random((count ([_obj] call BIS_fnc_buildingPositions)) -1))));
};
_obj