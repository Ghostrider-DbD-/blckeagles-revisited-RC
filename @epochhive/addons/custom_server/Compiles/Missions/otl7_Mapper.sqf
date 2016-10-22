scriptName "otl7_Mapper.sqf";
/*
	Author: Joris-Jan van 't Land, modified for ArmA3: Outlawz7

	Description:
	Takes an array of data about a dynamic object template and creates the objects.

	Parameter(s):
	_this select 0: position of the template - Array [X, Y, Z]
	_this select 1: azimuth of the template in degrees - Number 
	_this select 2: object template script name - script
	(optional) _this select 3: set vector up - boolean

	Example(s):
	_newComp = [(getPos this), (getDir this), "dyno_a3\doc\csat_guardpost01.sqf", false] call (compile (preprocessFileLineNumbers "dyno_a3\otl7_Mapper.sqf"));
	_newComp = [(getPos this), (getDir this), "dyno_a3\doc\csat_guardpost01.sqf", true] call (compile (preprocessFileLineNumbers "dyno_a3\otl7_Mapper.sqf"));
	
	Modified by Ghostrider-DBD- for blckeagls mission system
*/

private ["_rdm"];
params["_pos","_azi","_objs","_setVector"];
//_pos = _this select 0;
//_azi = _this select 1;
//_objs = _this select 2;
//_setVector = _this select 3;

private ["_newObjs"];

//If the object array is in a script, call it.
//_objs = call (compile (preprocessFileLineNumbers _script));

_newObjs = [];

private ["_posX", "_posY"];
_posX = _pos select 0;
_posY = _pos select 1;

//Function to multiply a [2, 2] matrix by a [2, 1] matrix.
private ["_multiplyMatrixFunc"];
_multiplyMatrixFunc =
{
	private ["_array1", "_array2", "_result"];
	_array1 = _this select 0;
	_array2 = _this select 1;

	_result =
	[
		(((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
		(((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
	];

	_result
};

for "_i" from 0 to ((count _objs) - 1) do
{

		private ["_obj", "_type", "_relPos", "_azimuth", "_fuel", "_damage", "_newObj"];
		_obj = _objs select _i;
		_type = _obj select 0;
		_relPos = _obj select 1;
		_azimuth = _obj select 2;
		
		//Optionally map fuel and damage for backwards compatibility.
		if ((count _obj) > 3) then {_fuel = _obj select 3};
		if ((count _obj) > 4) then {_damage = _obj select 4};
	
		//Rotate the relative position using a rotation matrix.
		private ["_rotMatrix", "_newRelPos", "_newPos"];
		_rotMatrix =
		[
			[cos _azi, sin _azi],
			[-(sin _azi), cos _azi]
		];
		_newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;
	
		//Backwards compatability causes for height to be optional.
		private ["_z"];
		if ((count _relPos) > 2) then {_z = _relPos select 2} else {_z = 0};
	
		_newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];
	
		//Create the object and make sure it's in the correct location.
		_newObj = _type createVehicle _newPos;
		_newObj setDir (_azi + _azimuth);
		_newObj setPos _newPos;
		if (_setVector) then {_newObj setVectorUp [0,0,1];};
		
		//If fuel and damage were grabbed, map them.
		if (!isNil "_fuel") then {_newObj setFuel _fuel};
		if (!isNil "_damage") then {_newObj setDamage _damage};
	
		_newObjs = _newObjs + [_newObj];

};

_newObjs