

#define oddsOfGarrison 0.67
#define maxGarrisonStatics 3
#define maxGarrisonUnits 4
#define typesGarrisonStatics []  //  When empty a static will be randomly chosen from the defaults for blckeagls
#define garrisonMarkerObject "Sign_Sphere100cm_F"  //  This can be anything you like. I find this large sphere easy to see and convenient.
#define unitMarkerObject "Sign_Arrow_Direction_Green_F"  //  This can be anything. I chose this arrow type because it allows you to easily indicate direction. 

_helpers = allMissionObjects garrisonMarkerObject; 
//diag_log format["_helpers = %1",_helpers];
{
	if ( (typeOf _x) isEqualTo garrisonMarkerObject) then
	{
		private _isInside = [_x] call _fn_isInside;
		if (_isInside) then
		{
			_building = [_x] call _fn_buildingContainer;
			blck_garrisonedBuildings pushbackunique _building;
			blck_garrisonedBuildings pushbackunique _x;			
			//  data structure ["building Classname",[/*building pos*/],/*building dir*/,/*odds of garrison*/, /*Max Statics*/,/*types statics*/,/*max units*/],
														// 1				2								3			4	  5			6			7					8						9
			_line = format['     ["%1",%2,%3,%4,%5,%6,%7,%8,%9]',typeOf _building,(getPosATL _building) vectorDiff CENTER,getDir _building, 'true','true',oddsOfGarrison,maxGarrisonStatics,typesGarrisonStatics,maxGarrisonUnits];
			systemChat _line;
			//diag_log _line;
			if (_forEachIndex == 0) then
			{
				_cb = _cb + format["%1%2",endl,_line];
			} else {
				_cb = _cb + format[",%1%2",endl,_line];
			};			
		};
	};
} forEach _helpers;