//This script sends Message Information to allplayers
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
if !(isServer) exitWith {};
params["_msg",["_players",allplayers]];

{
	if (isPlayer _x) then {_msg remoteExec["fn_handleMessage",(owner _x)]};
} forEach _players;



