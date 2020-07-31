/*
	By Ghostrider-GRG-
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_crate"];
private _result = if ((_crate distance (_crate getVariable["crateSpawnPos",[0,0,0]])) > 10) then {true} else {false};
_result;
