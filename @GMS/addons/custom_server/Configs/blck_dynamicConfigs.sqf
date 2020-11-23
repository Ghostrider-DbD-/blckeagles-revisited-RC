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

blck_headgearList = [];
blck_SkinList = [];
blck_vests = [];
blck_backpacks = [];
blck_Pistols = [];
blck_primaryWeapons = [];
//blck_throwable = [];

_allWeaponRoots = ["Pistol","Rifle","Launcher"];
_allWeaponTypes = ["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","Pistol","SubmachineGun","Handgun","MissileLauncher","RocketLauncher","Throw","GrenadeCore"];
_addedBaseNames = [];
_allBannedWeapons = [];
_wpnAR = []; //Assault Rifles
_wpnARG = []; //Assault Rifles with GL
_wpnLMG = []; //Light Machine Guns
_wpnSMG = []; //Sub Machine Guns
_wpnDMR = []; //Designated Marksman Rifles
_wpnLauncher = [];
_wpnSniper = []; //Sniper rifles
_wpnHandGun = []; //HandGuns/Pistols
_wpnShotGun = []; //Shotguns
_wpnThrow = []; // throwables
_wpnUnknown = []; //Misc
_wpnUnderbarrel = [];
_wpnMagazines = [];
_wpnOptics = [];
_wpnPointers = [];
_wpnMuzzles = [];
_allBannedWearables = [];
_uniforms = [];
_headgear = []; 
_glasses = []; 
_masks = []; 
_backpacks = []; 
_vests = [];
_goggles = []; 
_NVG = []; 
_misc = [];
_baseClasses = [];	

_classnameList = [];
diag_log format["blck_modType = %1",blck_modType];
if (toLower(blck_modType) isEqualTo "epoch") then
{
	_classnameList = (missionConfigFile >> "CfgPricing" ) call BIS_fnc_getCfgSubClasses;
};
if (toLower(blck_modType) isEqualTo "exile") then
{
	_classnameList = (missionConfigFile >> "CfgExileArsenal" ) call BIS_fnc_getCfgSubClasses;
};
private _dlcList = [];
private _ffaa = [];
private _lago = [];
private _cupv = []; 
diag_log format["_fnc_dynamicConfigsConfigurator: count _classnameList = %1",count _classnameList];
{
	private _configName = "";
	switch (true) do
	{
		case isClass(configFile >> "CfgMagazines" >> _x): 	{ _configName = "CfgMagazines"; };
		case isClass(configFile >> "CfgVehicles" >> _x): 	{ _configName = "CfgVehicles"; };
		case isClass(configFile >> "CfgAmmo" >> _x): 		{ _configName = "CfgAmmo"; };
		case isClass(configFile >> "CfgGlasses" >> _x): 	{ _configName = "CfgGlasses"; };
		default 											     	{ _configName = "CfgWeapons"; };
	};
	private _dlc = getText(configFile >> _configName >> _x >> "DLC");
	_dlcList pushBackUnique _dlc;
	if (_dlc isEqualTo "LAGO") then {_lago pushBackUnique _x};
	if (_dlc isEqualTo "FFAA" || _dlc isEqualTo "FFAAMOD") then {_ffaa pushBackUnique _x};
	if (_dlc isEqualTo "CUP_Vehicles") then {_cupv pushBackUnique _x};
	if !(_dlc in blck_blackListedMods) then 
	{
		private _temp = [_x] call bis_fnc_itemType;
		//diag_log _temp;
		_itemCategory = _temp select 0;
		_itemType = _temp select 1;
		_price = blck_maximumItemPriceInAI_Loadouts;
		if (toLower(blck_modType) isEqualTo "epoch") then
		{
			_price = getNumber(missionConfigFile >> "CfgPricing" >> _x >> "price");
		};
		if (toLower(blck_modType)  isEqualTo "exile") then
		{
			_price = getNumber(missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
		};
		if (_price < blck_maximumItemPriceInAI_Loadouts && !(["base",_x] call BIS_fnc_inString)) then
		{
			if (_itemCategory isEqualTo "Weapon") then
			{
				switch (_itemType) do
				{
					case "AssaultRifle": {if !(_x in blck_blacklistedSecondaryWeapons) then {_wpnAR pushBack _x} else {if (blck_logBlacklistedItems) then {diag_log format["Assualt Rifle %1 Excluded: blacklisted Item",_x]}}};
					case "MachineGun": {if !(_x in blck_blacklistedSecondaryWeapons) then {_wpnLMG pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Machine Gun %1 Excluded: blacklisted Item",_x]}}};
					case "SubmachineGun": {if !(_x in blck_blacklistedSecondaryWeapons) then {_wpnSMG pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Submachinegun %1 Excluded: blacklisted Item",_x]}}};
					case "Shotgun": {if !(_x in blck_blacklistedSecondaryWeapons) then {_wpnShotGun pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Shotgun %1 Excluded: blacklisted Item",_x]}}};
					case "Rifle": {if !(_x in blck_blacklistedSecondaryWeapons) then {_wpnAR pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Rifle %1 Excluded: blacklisted Item",_x]}}};
					case "SniperRifle": {if !(_x in blck_blacklistedSecondaryWeapons) then {_wpnSniper pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Sniper Rifle %1 Excluded: blacklisted Item",_x]}}};
					case "Handgun": {if !(_x in blck_blacklistedSecondaryWeapons) then {_wpnHandGun pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Handgun %1 Excluded: blacklisted Item",_x]}}};
					case "Launcher": {if !(_x in blck_blacklistedLaunchersAndSwingWeapons) then {_wpnLauncher pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Launcher %1 Excluded: blacklisted Item",_x]}}};
					case "RocketLauncher": {if !(_x in blck_blacklistedLaunchersAndSwingWeapons) then {_wpnLauncher pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Rocket Launcer %1 Excluded: blacklisted Item",_x]}}};
					case "Throw": {if !(_x in blck_blacklistedItems) then {_wpnThrow pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Throw %1 Excluded: blacklisted Item",_x]}}};
				};
			};
			
			if (_itemCategory isEqualTo "Item") then
			{
				switch (_itemType) do
				{
					case "AccessoryMuzzle": {if !(_x in blck_blacklistedAttachments) then {_wpnMuzzles pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Muzzle %1 Excluded: blacklisted Item",_x]}}};
					case "AccessoryPointer": {if !(_x in blck_blacklistedAttachments) then {_wpnPointers pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Pointer %1 Excluded: blacklisted Item",_x]}}};
					case "AccessorySights": {if !(_x in blck_blacklistedOptics) then {_wpnOptics pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Optic %1 Excluded: blacklisted Item",_x]}}};
					case "AccessoryBipod": {if !(_x in blck_blacklistedAttachments) then {_wpnUnderbarrel pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Bipod %1 Excluded: blacklisted Item",_x]}}};
					case "Binocular": {if !(_x in blck_blacklistedItems) then {_misc pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Binocular/Rangefinder/Binocular %1 Excluded: blacklisted Item",_x]}}};
					case "Compass": {if !(_x in blck_blacklistedItems) then {_misc pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Compass %1 Excluded: blacklisted Item",_x]}}};
					case "GPS": {if !(_x in blck_blacklistedItems) then {_misc pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["GPS %1 Excluded: blacklisted Item",_x]}}};
					case "NVGoggles": {if !(_x in blck_blacklistedItems) then {_NVG pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["NVG %1 Excluded: blacklisted Item",_x]}}};		
				};
			};
			
			
			if (_itemCategory isEqualTo "Equipment") then
			{
				switch (_itemType) do
				{
					case "Glasses": {if !(_x in blck_blacklistedItems) then {_glasses pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Glasses %1 Excluded: blacklisted Item",_x]}}};
					case "Headgear": {if !(_x in blck_blacklistedHeadgear) then {_headgear pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Headgear %1 Excluded: blacklisted Item",_x]}}};
					case "Vest": {if !(_x in blck_blacklistedVests) then {_vests pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Vest %1 Excluded: blacklisted Item",_x]}}};
					case "Uniform": {if !(_x in blck_blacklistedUniforms) then {_uniforms pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Uniform %1 Excluded: blacklisted Item",_x]}}};
					case "Backpack": {if !(_x in blck_blacklistedBackpacks) then {_backpacks pushBack _x}else {if (blck_logBlacklistedItems) then {diag_log format["Backpack %1 Excluded: blacklisted Item",_x]}}};
				};
			};
		} else {
			//if (["base",_x] call BIS_fnc_inString) then {diag_log format["_dynamicConfigs: excluding class %1",_x]};
		};
	};
} forEach _classnameList;
private _allWep =  _wpnAR + _wpnLMG + _wpnSMG + _wpnShotGun + _wpnSniper + _wpnHandGun;
{
	diag_log format["_dlcList %1 = %2",_forEachIndex,_x];
} forEach _dlcList;
/*
	Below are some examples of how you can use information collected to verify that the correct items were included 
*/
{
	diag_log format["_ffaa %1 = %2",_forEachIndex,_x];
}forEach _ffaa;
{
	diag_log format["_lago %1 = %2",_forEachIndex,_x];
} forEach _lago;
{
	diag_log format["_cupv %1 = %2",_forEachIndex,_x];
} forEach _cupv; 

blck_primaryWeapons = _wpnAR + _wpnLMG + _wpnSMG + _wpnShotGun + _wpnSniper;
blck_WeaponList_Blue = blck_primaryWeapons;
blck_WeaponList_Red = blck_primaryWeapons;
blck_WeaponList_Green = blck_primaryWeapons;
blck_WeaponList_Orange = blck_primaryWeapons;

/*
	here is an example for checking that weapons in the FFAA mod were added 
*/
private _absentWep = [];
{
	if !(_x in _allWep) then {diag_log format["_absentWep %1 = %2",_forEachIndex,_x];};
} forEach _ffaa + _lago _cupw;

blck_pistols = _wpnHandGun;
blck_Pistols_blue = blck_Pistols;
blck_Pistols_red = blck_Pistols;
blck_Pistols_green = blck_Pistols;
blck_Pistols_orange = blck_Pistols;

blck_headgearList = _headgear;
blck_headgear_blue = blck_headgearList;
blck_headgear_red = blck_headgearList;
blck_headgear_green = blck_headgearList;
blck_headgear_orange = blck_headgearList;
	
blck_SkinList = _uniforms;
blck_SkinList_blue = blck_SkinList;
blck_SkinList_red = blck_SkinList;
blck_SkinList_green = blck_SkinList;
blck_SkinList_orange = blck_SkinList;

blck_vests = _vests;
blck_vests_blue = blck_vests;
blck_vests_red = blck_vests;
blck_vests_green = blck_vests;
blck_vests_orange = blck_vests;

blck_backpacks = _backpacks;
blck_backpacks_blue = blck_backpacks;
blck_backpacks_red = blck_backpacks;
blck_backpacks_green = blck_backpacks;
blck_backpacks_orange = blck_backpacks;
	
blck_explosives = 	_wpnThrow;

diag_log format["Compilation of dynamic AI Loadouts complete at %1",diag_tickTime];
