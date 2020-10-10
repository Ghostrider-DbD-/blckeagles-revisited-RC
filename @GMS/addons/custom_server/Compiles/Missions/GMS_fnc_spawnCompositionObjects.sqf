/*
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_center","_objects"];
private ["_dam","_sim"];
if (count _center == 2) then {_center pushBack 0};
private _newObjs = [];
private _hiddenObjs = [];

{
	_x params["_className","_relPos","_dir","_booleans"];
	if (typeName (_booleans) isEqualTo "ARRAY") then // assum simulation and damage settings are defined in the old way as [bool,bool]
	{
		_dam = (_booleans) select 0;		
		_sim = (_booleans) select 1;
	};
	if ((typeName _booleans) isEqualTo "BOOL") then // assume simulation and damage settings are defined in the new way as , bool, bool, ...
	{
		_sim = _x select 4;
		_dam = _x select 3;
	};

	private _objPos = _center vectorAdd _relPos;

	if (_className isKindOf "House" && blck_hideRocksAndPlants) then 
	{
		private _shrubs = nearestTerrainObjects[_objPos,["TREE", "SMALL TREE", "BUSH","FENCE", "WALL","ROCK"], sizeOf _className];
		if !(_shrubs isEqualTo []) then 
		{
			_hiddenObjs append _shrubs;
			{_x hideObjectGlobal true} forEach _shrubs;
		};
	};
	_obj = createVehicle[_className,[0,0,0],[],0,"CAN_COLLIDE"];
	_obj setPosATL _objPos;
	_newObjs pushback (netID _obj);
	[_obj, _dir] call blck_fnc_setDirUp;
	_obj setVectorUp [0,0,1];	
	_obj enableDynamicSimulation _sim;
	_obj allowDamage _dam;	
	if ((typeOf _obj) isKindOf "LandVehicle" || (typeOf _obj) isKindOf "Air" || (typeOf _obj) isKindOf "Ship") then
	{
		[_obj] call blck_fnc_configureMissionVehicle;
	};	
} forEach _objects;

[_newObjs,_hiddenObjs];

