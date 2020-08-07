/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
//diag_log "[blckeagls] Initializing UMS";

#include "\q\addons\custom_server\Configs\blck_defines.hpp";
blck_dynamicUMS_MissionsRuning = 0;
blck_priorDynamicUMS_Missions = [];
blck_UMS_ActiveDynamicMissions = [];

//diag_log "Including GMS_UMS_configurations.sqf";
#include "GMS_UMS_configurations.sqf";
//diag_log "Including GMS_UMS_dynamicMissionLIsts.sqf";
//#include "GMS_UMS_dynamicMissionList.sqf";
//diag_log format ["Initializing UMS static missions at %1",diag_tickTime];
[] execVM "q\addons\custom_server\Missions\UMS\GMS_UMS_StaticMissions_init.sqf";

//diag_log "[blckeagls] UMS <Initialized>";
 

