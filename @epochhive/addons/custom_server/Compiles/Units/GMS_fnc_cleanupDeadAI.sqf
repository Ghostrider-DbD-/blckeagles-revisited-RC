/*
  Delete Dead AI and nearby weapons after an appropriate period.
  by Ghostrider
  Last updated 2/28/16   
*/

private["_aiList","_ai"];

while {true} do
{
	_aiList = blck_deadAI;
	{
		// As written, this ignores any bodies that do not have GMS_DiedAt defined.
		
		if ( (_x getVariable ["GMS_DiedAt",0]) > 0 ) then
		{
			if ( diag_tickTime > ((_x getVariable ["GMS_DiedAt",0]) + blck_bodyCleanUpTimer) ) then //  DBD_DeleteAITimer
			{
				_ai = _x;
				{
					deleteVehicle _x;
				}forEach nearestObjects [getPos _x,["WeaponHolder"],3];	
				uiSleep 0.1;
				//diag_log ["deleting AI %2 at _pos %1",getPos _ai,_ai];
				blck_deadAI = blck_deadAI - [_ai];
				deleteVehicle _ai;
			};
		};
	} forEach _aiList;
	uiSleep 60;
};