/*
 Spawn objects from an array using offsects from a central location.
 The code provided by M3Editor EDEN has been addapted to add checks for vehicles, should they be present.
 Returns an array of spawned objects. 
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_center","_objects"];
if (count _center == 2) then {_center pushBack 0};
private ["_newObjs","_sim","_dam","_obj","_spawnPos"];
_newObjs = [];
_obj = createVehicle ["RoadCone_L_F", _coords];  //  To designate the mission center
_obj allowDamage true;
_obj enableSimulation false;
_obj enableSimulationGlobal false;
_obj enableDynamicSimulation false;
_newObjs pushBack _obj;
{
	if (typeName (_x select 3) isEqualTo "ARRAY") then // assum simulation and damage settings are defined in the old way as [bool,bool]
	{
		_sim = (_x select 3) select 0;
		_dam = (_x select 3) select 1;
	};
	if (typeName (_x select 3) isEqualTo "BOOL") then // assume simulation and damage settings are defined in the new way as , bool, bool, ...
	{
		_sim = _x select 3;
		_dam = _x select 4;
	};

	_obj = createVehicle[(_x select 0),_center vectorAdd (_x select 1),[],0,"CAN_COLLIDE"];
	_newObjs pushback _obj;
	_obj setDir (_x select 2);
	_obj enableDynamicSimulation _sim;
	_obj allowDamage _dam;	
	if ((typeOf _obj) isKindOf "LandVehicle" || (typeOf _obj) isKindOf "Air" || (typeOf _obj) isKindOf "Sea") then
	{
		[_obj] call blck_fnc_configureMissionVehicle;
	};	
} forEach _objects;
_newObjs

