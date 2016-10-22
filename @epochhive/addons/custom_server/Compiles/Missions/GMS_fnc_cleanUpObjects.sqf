	// Delete objects in a list after a certain time.
	// code to delete any smoking or on fire objects adapted from kalania 
	//http://forums.bistudio.com/showthread.php?165184-Delete-Fire-Effect/page1
	// http://forums.bistudio.com/showthread.php?165184-Delete-Fire-Effect/page2
/*
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last Modified 8-13-16
*/
	private ["_buildings","_startTime","_waitTime"];
	
	_buildings = _this select 0;  //  array of objects to be deleted
	_waitTime = _this select 1;  // time delay before deleting
	
	_startTime = diag_tickTime;
	//diag_log format["<<-- cleanUpObjects: -- >> _buildings = %1",_buildings];
	//diag_log format["<<-- cleanUpObjects: -- >> wait time = %1",_waitTime];	
	waitUntil {sleep 10; (diag_tickTime - _startTime) > _waitTime;};

	
	///////////////////////////////////////////////////
	//  Main body of the function
	//////////////////////////////////////////////////
	{
			//diag_log format["cleanupObjects.sqf: -- >> object %1 is typeOf %2",_x, typeOf _x];		
			deleteVehicle _x;
	} forEach _buildings;
	////////////////////////////////////////////////
	


 



