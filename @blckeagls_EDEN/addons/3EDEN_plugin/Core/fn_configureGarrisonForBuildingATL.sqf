


#define oddsOfGarrison 0.67
#define maxGarrisonStatics 3
#define maxGarrisonUnits 4
#define typesGarrisonStatics []  //  When empty a static will be randomly chosen from the defaults for blckeagls
#define garrisonMarkerObject "Sign_Sphere100cm_F"  //  This can be anything you like. I find this large sphere easy to see and convenient.
#define unitMarkerObject "Sign_Arrow_Direction_Green_F"  //  This can be anything. I chose this arrow type because it allows you to easily indicate direction. 

private["_b","_staticsInBuilding","_unitsInBuilding","_staticsText","_unitsText","_buildingGarrisonATL","_staticsInBuilding","_unitsInBuilding","_count"];
_b = _this select 0;
private _count = 0;
if (_b in blck_garrisonedBuildings) exitWith {""};
private _staticsText = "";
private _unitsText = "";
private _buildingGarrisonATL = "";
_staticsInBuilding = nearestObjects[getPosATL _building,["StaticWeapon"],sizeOf (typeOf _building)];
{
	if !(_x in _configuredStatics) then
	{
		_isInside = [_x] call _fn_isInside;
		if (_isInside) then {_building = [_x] call _fn_buildingContainer};
		if (_b isEqualTo _building) then
		{
			_configuredStatics pushBackUnique _x;
			//_configuredStaticsPositions pushBack  (getPosATL _x) vectorDiff CENTER;
			if (_staticsText isEqualTo "") then
			{
				_staticsText = format['["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff (getPosATL _b),getDir _x];
			} else {
				_staticsText = _staticsText + format[',["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff (getPosATL _b),getDir _x];
			};
		};
	};
} forEach _staticsInBuilding;
// Since this is run from the editor we do not have to worry about units running off from their original locations
_unitsInBuilding = nearestObjects[getPosATL _building,["Man"],sizeOf (typeOf _building)] select {(vehicle _x) isEqualTo _x};

{
	if !(_x in _configuredUnits) then
	{
		_isInside = [_x] call _fn_isInside;
		if (_isInside) then {_building = [_x] call _fn_buildingContainer};
		if (_b isEqualTo _building) then
		{
			_configuredUnits pushBackUnique _x;
			
			if (_unitsText isEqualTo "") then
			{
				_unitsText = format["[%1,%2]",(getPosATL _x) vectorDiff (getPosATL _b),getDir _x];
			} else {
				_unitsText = _unitsText + format[",[%1,%2]",(getPosATL _x) vectorDiff (getPosATL _b),getDir _x];
			};
			_count = _count + 1;
		};
	};
} forEach _unitsInBuilding;	

if ( !(_staticsText isEqualTo "") || !(_unitsText isEqualTo "")) then
{
	_buildingGarrisonATL = format['     ["%1",%2,%3,%4,%5,[%6],[%7]]',typeOf _b,(getPosATL _b) vectorDiff CENTER,getDir _b,'true','true',_staticsText,_unitsText];
	blck_garrisonedBuildings pushBackUnique _b;
};
_buildingGarrisonATL
