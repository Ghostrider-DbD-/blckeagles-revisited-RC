/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
if (toLower(blck_modType) isEqualTo "default") exitWith {};

params["_obj",["_money",-1]];
_money = ([_money] call blck_fnc_getNumberFromRange);
//if (blck_debugLevel >= 3) then {[format["_fnc_addmoneyToObject: _money = %1 _obj = %2",_money,_obj]] call blck_fnc_log};
if !(_money <= 0) then 
{
	switch(toLower(blck_modType)) do 
	{
		case "exile": {_obj setVariable["ExileMoney",_money,true]};
		case "epoch": {_obj setVariable["Crypto", _money,true]};
	};
};
