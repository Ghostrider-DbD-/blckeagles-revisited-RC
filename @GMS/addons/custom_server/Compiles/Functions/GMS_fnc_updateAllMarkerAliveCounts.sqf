/*
	by Ghostrider [GRG] 
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
diag_log "_fnc_updateAllMarkerAliveCounts called";

{
	diag_log format["_fnc_updateAllMarkerAliveCounts: _x = %1",_x];
	[_x select 0, _x select 1, _x select 2] call blck_fnc_updateMarkerAliveCount;
}forEach blck_missionMarkers;
