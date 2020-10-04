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

#define maxObjectSpawnRadius 25
#define minObjectSpawnRadius 15
private _objectSpawnRange = maxObjectSpawnRadius - minObjectSpawnRadius;

private _newObjs = [];
private _hiddenObjs = [];

{
	private _spawnPos = _coords getPos[minObjectSpawnRadius + random(maxObjectSpawnRadius), random(359)];
	private _objClassName = _x;
	if (_objClassName isKindOf "House" && blck_hideRocksAndPlants) then 
	{
		private _shrubs = nearestTerrainObjects[_spawnPos,["TREE", "SMALL TREE", "BUSH","FENCE", "WALL","ROCK"], sizeOf _objClassName];
		if !(_shrubs isEqualTo []) then 
		{
			_hiddenObjs append _shrubs;
			{_x hideObjectGlobal true} forEach _shrubs;
		};
	};
	private _obj = createVehicle[_x, _spawnPos, [], 2];	
	_obj allowDamage true;
	_obj enableSimulation false;
	_obj enableSimulationGlobal false;
	_obj enableDynamicSimulation false;
	_obj setDir (_obj getRelDir _coords);
	_newObjs pushback (netID _obj);
	sleep 0.1;
} forEach _missionLandscape;

[_newObjs,_hiddenObjs]
