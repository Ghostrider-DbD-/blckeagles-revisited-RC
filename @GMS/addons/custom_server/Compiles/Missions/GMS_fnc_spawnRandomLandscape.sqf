/*
	spawn a group of objects in random locations aligned with the radial from the center of the region to the object.
	By Ghostrider [GRG]
	copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params["_coords","_missionLandscape",["_min",3],["_max",15],["_nearest",1]];

private["_objects","_wreck","_dir","_dirOffset"];
#define maxObjectSpawnRadius 25
#define minObjectSpawnRadius 15
private _objectSpawnRange = maxObjectSpawnRadius - minObjectSpawnRadius;

_objects = [];
_wreck = createVehicle ["RoadCone_L_F", _coords];  //  To designate the mission center
_wreck allowDamage true;
_wreck enableSimulation false;
_wreck enableSimulationGlobal false;
_wreck enableDynamicSimulation false;
_objects pushBack _wreck;
{

	private _dir = random(360);
	private _radius = minObjectSpawnRadius + random(maxObjectSpawnRadius);
	_wreck = createVehicle[_x, _coords getPos[_radius,_dir], [], 2];	
	_wreck allowDamage true;
	_wreck enableSimulation false;
	_wreck enableSimulationGlobal false;
	_wreck enableDynamicSimulation false;
	_wreck setDir (_wreck getRelDir _coords);
	_objects pushback _wreck;
	sleep 0.1;
} forEach _missionLandscape;

_objects
