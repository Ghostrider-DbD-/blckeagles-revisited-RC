//////////////////////////////////////////////////////
// Test whether one object (e.g., a player) is within a certain range of any of an array of other objects
/*
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
*/
/////////////////////////////////////////////////////

	private ["_result"];
	params["_obj1","_objList","_minDist"];
	//_obj1 : player or other object
	// _objList : array of objects
	//_minDist : distance below which the function would return true;
	
	_result = false;
	//diag_log format["playerInRange.sqf: _obj1 = %1, _objList = %2 _minDist = %3",_obj1,_objList,_minDist];
	{
		if ((_x distance _obj1) < _minDist) exitWith {_result = true;};
	} forEach _objList;
	
	_result