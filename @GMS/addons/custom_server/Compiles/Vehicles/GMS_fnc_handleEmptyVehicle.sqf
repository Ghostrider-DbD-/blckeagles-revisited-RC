/*
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

params["_veh"];

if (isServer) then 
{
	if ({alive _x} count (crew _veh) == 0 || crew(_veh) isEqualTo []) then
	{	
		if (_veh getVariable["GRG_vehType","none"] isEqualTo "emplaced") then
		{
			if (blck_killEmptyStaticWeapons) then
			{
				_veh setDamage 1;
				_veh setVariable["blck_deleteAtTime",diag_tickTime + 60,true];
			}else {
				[_veh] call blck_fnc_releaseVehicleToPlayers;  //Call this from _processAIKill
				_veh setVariable["blck_deleteAtTime",diag_tickTime + blck_vehicleDeleteTimer,true];
			};			
		} else {
			if (blck_killEmptyAIVehicles) then
			{
				_veh setDamage 0.7;
				_veh setFuel 0;
				_veh setVariable["blck_deleteAtTime",diag_tickTime + 60];
			} else {
				_veh setVariable["blck_deleteAtTime",diag_tickTime + blck_vehicleDeleteTimer,true];	
				[_veh] call blck_fnc_releaseVehicleToPlayers;
			};
		};
	};	
};
 


