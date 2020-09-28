/*
  Delete Dead AI and nearby weapons after an appropriate period.
  by Ghostrider-GRG-
  
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

{
	private _unit = _x; 
	if (_unit getVariable["blck_cleanupAt",0] isEqualTo 0) then {_unit setVariable["blck_cleanupAt",diag_tickTime + blck_bodyCleanUpTimer]};
	private _nearplayer = [position _unit,800] call blck_fnc_nearestPlayers;	

	if (diag_tickTime > _unit getVariable ["blck_cleanupAt",0]) then 
	{
		if (_nearplayer isequalto []) then 
		{
			{
				deleteVehicle _x;
			}forEach nearestObjects [getPos _unit,["WeaponHolderSimulated","GroundWeapoonHolder"],3];	
			deleteVehicle _unit;
		};
	};
} forEach (units blck_graveyardGroup);

