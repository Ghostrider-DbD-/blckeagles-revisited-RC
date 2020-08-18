



private _building = _this select 0;
private _CENTER = _this select 1;
private _pos = getPosATL _building;
private _garrisonedBuildings = missionNamespace getVariable["blck_garrisonedBuildings",[]];
private _count = 0;
private _staticsText = [];
private _unitsText = [];
private _buildingGarrisonATL = [];
private _configuredStatics = [];
private _configuredUnits = [];
private _statics = nearestObjects[getPosATL _building,["StaticWeapon"],sizeOf (typeOf _building)];
private _lineBreak = toString [10];

{
	if !(_x in _configuredStatics) then
	{
		private _isInside = [_x] call blck3DEN_fnc_isInside;
		private _container = [_x] call blck3DEN_fnc_buildingContainer;
		//diag_log format["evaluating building %1 static %2 isInside = %3 container = %4",_building,_x,_isInside,_container];
		if (_isInside && (_container isEqualTo _building)) then
		{
			_configuredStatics pushBackUnique _x;
			//diag_log format["Building %1 | buildingPos %2 | _pos %3",typeOf _x, getPosATL _x,_pos];
			_staticsText pushBack [format['%1',typeOf _x],(getPosATL _x) vectorDiff (_pos),getDir _x];
		};
	};
} forEach _statics;
_staticsText joinString _lineBreak;

// Since this is run from the editor we do not have to worry about units running off from their original locations
private _units = nearestObjects[getPosATL _building,["Man"],sizeOf (typeOf _building)] select {(vehicle _x) isEqualTo _x};
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

//diag_log format["_staticsText for building %1 = %2",_building,_staticsText];
//diag_log format["_unitsText for building %1 = %2",_building,_unitsText];
if !((_staticsText isEqualTo []) && (_unitsText isEqualTo [])) then
{
	_buildingGarrisonATL = [
		format["%1", 
		typeOf _building], 
		(getPosATL _building) vectorDiff _pos, 
		getDir _building,
		true,
		true,
		_staticsText,
		_unitsText
	];
};
//diag_log format["_buildingGarrisonATL = %1",_buildingGarrisonATL];
[_buildingGarrisonATL,_configuredStatics,_configuredUnits]
