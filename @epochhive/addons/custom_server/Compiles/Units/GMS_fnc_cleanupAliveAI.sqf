/*
  Delete alive AI after an appropriate period.
  by Ghostrider
  Last updated 2/21/16   
*/

private["_ai","_veh"];
params["_aiList","_waitTime"];
/*
_aiList = _this select 0;
_waitTime = _this select 1;
*/

//diag_log format["_fnc_cleanupAliveAI:: called with blck_AICleanUpTimer = %1 and count of alive AI = %2",_waitTime, count _aiList];
uiSleep _waitTime;
diag_log format["_fnc_cleanupAliveAI:: Starting AI Cleanup with _waitTime = %1",_waitTime];
{
	//diag_log format["cleanupAliveAI:: for unit _x, alive = %1, GMS_DiedAt = %2",(alive _x), _x getVariable["GMS_DiedAt", -1]];
	if ( alive _x && (_x getVariable["GMS_DiedAt", -1] < 0)) then {  // The unit has not been processed by a kill handler.  This double test is probably not needed.
		_ai = _x;
		 
		 if ( vehicle _ai != _ai) then // the AI is in a vehicle of some sort so lets be sure to delete it
		{
			_veh = vehicle _ai;
			//diag_log format["cleanupAliveAI:: deleting vehicle %1",_veh];
			_veh setDamage  1;
			deleteVehicle _veh;
		};	
		 
		//diag_log format["_fnc_cleanupAliveAI:: _x is %4, typeOf _x %1 typeOf vehicle _x %2, blck_vehicle %3", (typeOf _x), (typeOf (vehicle _x)),_veh,_x];
		{
			_ai removeAllEventHandlers  _x;
		}forEach ["Killed","Fired","HandleDamage","HandleHeal","FiredNear"];

		{
			deleteVehicle _x;
		}forEach nearestObjects [getPos _ai,["WeaponHolderSimulated","GroundWeapoonHolder"],3];	
	
		_group = group _ai;
		[_ai] joinSilent grpNull;

		if (count units group _ai < 1) then
		{
			deletegroup group _ai;
		};
		deleteVehicle _ai;
	};
}forEach _aiList;
//diag_log format["_fnc_cleanupAliveAI:: AI Cleanup Completed"];