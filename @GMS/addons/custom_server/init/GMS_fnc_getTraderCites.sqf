/*
	By Ghostrider [GRG]
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

if ((tolower blck_modType) isEqualTo "epoch") then
{
	_blckListPrior = blck_locationBlackList;
	private _config = configFile >> "CfgEpoch";
	private _configWorld = _config >> worldname;
	private _telePos = getArray(configFile >> "CfgEpoch" >> worldName >> "telePos" );
	{
		blck_locationBlackList pushback [_x select 3, 1000];
	} foreach _telePos;
};

if ((tolower blck_modType) isEqualTo "exile") then
{
	private _traderCites = allMapMarkers;
	{
			if (getMarkerType _x isEqualTo "ExileTraderZone" && blck_blacklistTraderCities) then {
				blck_locationBlackList pushback [(getMarkerPos _x),1000];
			};
				
			if ((getMarkerType _x isEqualTo "ExileSpawnZone") && blck_blacklistSpawns) then {
				blck_locationBlackList pushback [(getMarkerPos _x),1000];			
			};
			//  
			if (getMarkerType _x isEqualTo "ExileConcreteMixerZone" && blck_listConcreteMixerZones) then {
				blck_locationBlackList pushback [(getMarkerPos _x),1000];		
			};	
	}forEach _traderCites;
};
