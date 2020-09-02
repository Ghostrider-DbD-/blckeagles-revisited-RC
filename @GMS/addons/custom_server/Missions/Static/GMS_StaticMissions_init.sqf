/*
	by Ghostrider [GRG]
	for ghostridergaming
	12/5/17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#include "\q\addons\custom_server\Missions\Static\GMS_StaticMissions_Lists.sqf";

blck_sm_Infantry = [];
blck_sm_Vehicles = [];
blck_sm_Aircraft = [];
blck_sm_Emplaced = [];
blck_sm_scubaGroups = [];
blck_sm_surfaceShips = [];
blck_sm_submarines = [];
blck_sm_lootContainers = [];
blck_sm_garrisonBuildings_ASL = [];
blcl_sm_garrisonBuilding_relPos = [];

blck_sm_monitoring = 0;
blck_sm_groupDespawnTime = 120;
blck_sm_patrolRespawnInterval = 600;
{
	if ((toLower worldName) isEqualTo toLower(_x select 1)) then
	{
		if ((toLower blck_modType) isEqualTo (toLower(_x select 0))) then
		{
			[] call compilefinal preprocessFileLineNumbers format["\q\addons\custom_server\Missions\Static\missions\%1",(_x select 2)];
			diag_log format["_initializing static mission %1 for mod type %2",_x select 1,blck_modType];
		};
	};
}forEach _staticMissions;
["GMS_StaticMissions Initialized.sqf <Loaded>"] call blck_fnc_log;

