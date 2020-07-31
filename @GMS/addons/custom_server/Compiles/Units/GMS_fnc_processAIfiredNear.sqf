
/*
	blck_fnc_processAIfiredNear
	firedNear event handler for _units
	By Ghostrider-GRG-

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/

	See https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#FiredNear for details on this event handler. 

*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_unit","_firedBy"];

(group _unit) setBehaviour "COMBAT";
(group _unit) setCombatMode "RED";


