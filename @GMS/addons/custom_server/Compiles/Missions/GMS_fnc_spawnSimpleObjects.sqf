/*
	by Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_center","_objects","_relative"];
private _spawnedObjects = [];
{
	_x params["_className","_relPos","_dir","_booleans"];
	private _objPos = _center vectorAdd _relPos;		
	private _obj = createSimpleObject [_className,ATLToASL _objPos];
	_obj setDir _dir;
	_obj setVectorUp  [0,0,1];
	_spawnedObjects pushBack _obj;
} forEach _objects;
_spawnedObjects