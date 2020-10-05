/*
	Spawn a vehicle and protect it against cleanup by Epoch
	Returns the object (vehicle) created.
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_vehType",["_pos",[]],["_special","NONE"],["_radius",30]];

private _veh = createVehicle[_vehType, _pos, [], _radius, _special];
if (count _pos == 2) then {
	_pos pushBack 0;
	[format["_fnc_spawnVehicle(20): _pos had only 2 parameters, new value = %1",_pos],'warning'] call blck_fnc_log;
};
if (_pos isEqualTo []) then 
{
	[format["_fnc_spawnVehicle(20): _pos undefined, now set to [0,0,0]"],'warning'] call blck_fnc_log;
};
_veh setVectorUp surfaceNormal position _veh;
_veh allowDamage true;
_veh enableRopeAttach true;
_veh setVariable["blck_vehicle",true];
[_veh] call blck_fnc_protectVehicle;
[_veh] call blck_fnc_emptyObject;
if (_vehType isKindOf "Plane") then {
	private _pos = [_pos select 0, _pos select 1, ((getPos _veh) select 2) + 400];
	_veh setPosATL _pos;
	// adapted from: https://community.bistudio.com/wiki/setVelocity
	private _vel = velocity _veh;
	private _dir = direction _veh;
	#define speedIncr 150
	_veh setVelocity [
		(_vel select 0) + (sin _dir * speedIncr), 
		(_vel select 1) + (cos _dir * speedIncr), 
		(_vel select 2)
	];
	_veh flyInHeightASL [200,100,400];
};
if (_vehType isKindOf "Helicopter") then 
{
	private _pos = [_pos select 0, _pos select 1, ((getPos _veh) select 2) + 100];
	_veh setPosATL _pos;
	private _vel = velocity _veh;
	private _dir = direction _veh;
	#define speedIncr 25
	_veh setVelocity [
		(_vel select 0) + (sin _dir * speedIncr), 
		(_vel select 1) + (cos _dir * speedIncr), 
		(_vel select 2)
	];
	_veh flyInHeightASL [200,100,400];
};
_veh
	
