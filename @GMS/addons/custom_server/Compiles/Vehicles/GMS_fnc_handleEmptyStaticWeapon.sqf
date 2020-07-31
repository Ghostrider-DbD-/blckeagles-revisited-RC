// GMS_fnc_handleEmptyStaticWeapon.sqf
// NOT USED AT PRESENT
/*
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
    params["_veh"];
    if (blck_killEmptyStaticWeapons) then
    {
        _veh setDamage 1;
        _veh setVariable["blck_deleteAtTime",diag_tickTime + 60,true];
    }else {
        [_veh] call blck_fnc_releaseVehicleToPlayers;  //Call this from _processAIKill
        _veh setVariable["blck_DeleteAt",diag_tickTime + blck_vehicleDeleteTimer,true];
    };