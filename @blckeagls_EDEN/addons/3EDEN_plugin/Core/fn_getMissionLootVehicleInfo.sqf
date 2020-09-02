

private _objects = get3DENSelected "object" select {(typeOf _x) isKindOf "Car"};
private _lines = [];
private _lineBreak = toString [10];
{
	_message pushBack format["Loot Vehicle Flag for Vehicle type %1 at %2 = %3",typeOf _x,getPosATL _x,_x getVariable["garrisoned",false]];
} forEach _objects;

uiNameSpace setVariable ["Display3DENCopy_data", ["lootVehicles.sqf", _lines joinString _lineBreak]];
(findDisplay 313) createdisplay "Display3DENCopy";