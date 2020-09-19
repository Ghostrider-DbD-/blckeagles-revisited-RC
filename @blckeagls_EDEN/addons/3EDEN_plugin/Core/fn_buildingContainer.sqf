/*
	Returns the builing containing an object or objNull
	By Ghostrider-GRG-
	Copyright 2020 
*/

params["_u",["_category","House"]];
private _pos = getPosASL _u;
private _building = objNull;
private _surfacesAbove = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) + 100],_u,_u,true,10];

{
	if ((_x select 2) isKindOf _category && !(_x isEqualTo _u)) exitWith {_building = (_x select 2)};
} forEach _surfacesAbove;
if (_building isEqualTo objNull) then
{
	private _surfacesBelow = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 10],_u,_u,true,100];
	{
		if ((_x select 2) isKindOf _category && !(_x isEqualTo _u)) exitWith {_building = (_x select 2)};
	} forEach _surfacesBelow;
};

_building