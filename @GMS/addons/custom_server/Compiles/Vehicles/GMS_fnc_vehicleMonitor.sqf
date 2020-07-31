/*
	By Ghostrider [GRG]
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

// TODO: Test that vehicles that are either scheduled for deletion are for deletion pending change in owner are proparly handled (kept in the list, deleted when the time arrives).
private _serverIDs =  ([2] + (entities "HeadlessClient_F"));
for "_i" from 1 to (count blck_monitoredVehicles) do
{
	if (_i > (count blck_monitoredVehicles)) exitWith {};
	private _veh = blck_monitoredVehicles deleteAt 0;
	if !(_veh isEqualTo objNull) then
	{
		// if the owner is a player do not add back for further monitoring
		if ((owner _veh) in (_serverIDs)) then 
		{
			if ((_veh getVariable ["blck_deleteAtTime",0]) > 0) then
			{
				if (diag_tickTime > ( _veh getVariable ["blck_deleteAtTime",0])) then
				{
					[_veh] call blck_fnc_destroyVehicleAndCrew;				
				} else {
					blck_monitoredVehicles pushBack _veh;
				};
			} else {
				[_veh] call blck_fnc_checkForEmptyVehicle;				
				blck_monitoredVehicles pushBack _veh;
			};
		} else {

		};
	};
};
