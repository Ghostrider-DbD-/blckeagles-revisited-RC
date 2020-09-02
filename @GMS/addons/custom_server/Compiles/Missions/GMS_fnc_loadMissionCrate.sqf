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
private _crate = _this select 0;
[_crate,(_crate getVariable "lootArray"),(_crate getVariable "lootCounts")] call blck_fnc_fillBoxes;
_crate setVariable["lootLoaded",true];



	
