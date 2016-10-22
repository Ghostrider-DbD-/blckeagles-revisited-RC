//This script sends Message Information to allplayers
// Last modified 9/3/15 by Ghostrider-DBD-

blck_Message =  _this;
//diag_log format["AIM.sqf ===]  _this = %1",_this];
{
	//diag_log format["AIM.sqf ===]  (owner _x) = %1", (owner _x)];
	(owner _x) publicVariableClient "blck_Message";
} forEach playableUnits;
/*
if (_modType isEqualTo "Exile") then
{
	[_blck_Message] remoteExec["fn_blck_MessageHandler",0];
};
*/

