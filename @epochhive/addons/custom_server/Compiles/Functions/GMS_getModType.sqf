/*
   Based on code by IT07 written for VEMF_r
*/

private "_mod";

_mod = "";

if not ( isNull ( configFile >> "CfgPatches" >> "exile_server" ) ) then { _mod = "Exile" };
if not ( isNull ( configFile >> "CfgPatches" >> "a3_epoch_server" ) ) then { _mod = "Epoch" };

_mod
