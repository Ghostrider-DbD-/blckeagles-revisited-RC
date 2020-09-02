
private _objects = get3DENSelected "object" select {((typeOf _x) isKindOf "House") && [_x] call BIS_fnc_isBuildingEnterable};
private _lines = [];
private _lineBreak = toString [10];
{
	_message pushBack format["Garrison Flag for Building type %1 at %2 = %3",typeOf _x,getPosATL _x,_x getVariable["garrisoned",false]];
} forEach _objects;

uiNameSpace setVariable ["Display3DENCopy_data", ["garrisonedBuildings.sqf", _lines joinString _lineBreak]];
(findDisplay 313) createdisplay "Display3DENCopy";

