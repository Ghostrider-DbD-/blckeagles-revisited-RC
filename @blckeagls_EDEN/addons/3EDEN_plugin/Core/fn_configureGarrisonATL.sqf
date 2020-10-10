
/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_building","_center"];
private _pos = getPosATL _building;
private _garrisonedBuildings = missionNamespace getVariable["blck_garrisonedBuildings",[]];
private _count = 0;
private _staticsText = [];
private _unitsText = [];
private _buildingGarrisonATL = [];
private _configuredStatics = [];
private _configuredUnits = [];
private _statics = nearestObjects[getPosATL _building,["StaticWeapon"],sizeOf (typeOf _building)];
private _units = nearestObjects[getPosATL _building,["Man"],sizeOf (typeOf _building)] select {(vehicle _x) isEqualTo _x};
private _lineBreak = toString [10];

{
	if !(_x in _configuredStatics) then
	{
		private _isInside = [_x] call blck3DEN_fnc_isInside;
		private _container = [_x] call blck3DEN_fnc_buildingContainer;
		if (_isInside && (_container isEqualTo _building)) then
		{
			_configuredStatics pushBackUnique _x;
			_staticsText pushBack [format['%1',typeOf _x],(getPosATL _x) vectorDiff (_pos),getDir _x];
		};
	};
} forEach _statics;
_staticsText joinString _lineBreak;

// Since this is run from the editor we do not have to worry about units running off from their original locations
{
	if !(_x in _configuredUnits) then
	{
		private _isInside = [_x] call blck3DEN_fnc_isInside;
		private _container =  [_x] call blck3DEN_fnc_buildingContainer;
		if (_isInside && (_container isEqualTo _building)) then 
		{
			_configuredUnits pushBackUnique _x;
			_unitsText pushBack [(getPosATL _x) vectorDiff (_pos),getDir _x];
		};
	};
} forEach _units;	
_unitsText joinString _lineBreak;

if !((_staticsText isEqualTo []) && (_unitsText isEqualTo [])) then
{
	private _allowDamage = (_building get3DENAttribute "allowDamage") select 0;
	private _enableSimulation = (_building get3DENAttribute "enableSimulation") select 0;	
	diag_log format["_configureGarrisonATL: _building %1 | damage %2 | simulation %3",_allowDamage,_enableSimulation];
	_buildingGarrisonATL = [
		format["%1", 
		typeOf _building], 
		(getPosATL _building) vectorDiff _center, 
		getDir _building,
		_allowDamage,
		_enableSimulation,
		_staticsText,
		_unitsText
	];
};

private "_return";
if (_buildingGarrisonATL isEqualTo []) then 
{
	_return = [];
} else {
	_return = [_buildingGarrisonATL,_configuredStatics,_configuredUnits];
};
_return
