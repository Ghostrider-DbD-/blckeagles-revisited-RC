

params["_object"];

private _marker = create3DENEntity ["object","Sign_Arrow_Large_Yellow_F",getPos _object];
private _markerPos = getPos _object;
private _bbr = boundingBoxReal _object;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_height = abs ((_p2 select 2) - (_p1 select 2));
_marker setPosATL [_markerPos select 0, _markerPos select 1, (_markerPos select 2) + _height];
_object setVariable ["marker",_marker];
diag_log format["_createGarrisonMarker: _object = %1 | _marker = %2 | _height = %3",_object,_marker,_height];
true