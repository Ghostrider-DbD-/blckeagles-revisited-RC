/*
	Determine if an object is inside or ontop of another object base on line of sight.
	Returns true if this is the case, false otherwise. 
	By Ghostrider-GRG-
	Copyright 2020 
*/

// returns true if an object is inside, underneath or on top of a building otherwise returns false.
//////////////////////
//  Determin if a unit is inside a building using two separate checkVisibility
//////////////////////

params["_u",["_category","House"]];

private _pos = getPosASL _u;
private _above = lineIntersects [_pos, [_pos select 0, _pos select 1, (_pos select 2) + 100],_u];
private _below = lineintersects [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 2],_u];
//diag_log format["_fn_isInside: _u %1 | _category = %5 | typeOf _u %4 | _above %2 | _below %3 ",_u,_above,_below,typeOf _u, _category];

// If there is something above or below the object do a quick double-check to make sure there is a building there and not something else.
if (_above) then // test if any surfaces above are from buildingPos
{
	private  _surfacesAbove = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) + 100],_u,_u,true,100];
	_above = false;
	{
		//diag_log format["_fn_isInside: _x-2 = %2 | typeOf _x = %3",_x,_x select 2,typeOf (_x select 2)];
		if ((_x select 2) isKindOf _category) then {_above = true};
	}forEach _surfacesAbove;
};

if (_below) then 
{
	private _surfacesBelow = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 10],_u,_u,true,100];
	_above = false;
	{
		//diag_log format["_fn_isInside: _x-2 = %2 | typeOf _x = %3",_x,_x select 2,typeOf (_x select 2)];
		if ((_x select 2) isKindOf _category) then {_above = true};
	}forEach _surfacesBelow;
};	

private _isInside = if (_above || _below) then {true} else {false};
//diag_log format["_fn_isInside: _isInside = %1",_isInside];
_isInside