// =========================================================================================================
//  blckeagls mission system
//  Author: Ghostrider-DBD-
// Last modified 9-3-16
// ------------------------------------------------------------------------------------------------------------
// Unused at present, reserved for the future

private ["_ai_veh","_ai_veh_hitsource","_ai_veh_type","_ai_veh_name","_ai_veh_side","_ai_veh_group_side","_ai_veh_hitsource_group_side","_ai_veh_hitsource_type","_ai_veh_hitsource_name","_ai_veh_hitsource_side"];

//diag_log "Vehicle Decommisioning handler activated";
params["_ai_veh"];

/*
_ai_veh = _this select 0;
*/

_ai_veh_type = typeof _ai_veh;
_ai_veh_name = name _ai_veh;

_ai_veh setFuel 0;
_ai_veh setVehicleAmmo 0;
_ai_veh setAmmoCargo 0;

_s = ["MOTOR",
	"wheel_1_1_steering","wheel_2_1_steering","wheel_1_2_steering","wheel_2_2_steering",
	"wheel_1_3_steering","wheel_2_3_steering","wheel_1_4_steering","wheel_2_4_steering"];
{_ai_veh setHit [_x,1]} forEach _s;
