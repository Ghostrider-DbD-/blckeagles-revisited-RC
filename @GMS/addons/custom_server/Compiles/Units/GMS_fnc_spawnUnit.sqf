/*
	blck_fnc_spawnUnit
	Original Code by blckeagls
	Modified by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_i","_weap","_unit","_skillLevel","_aiSkills","_launcherRound","_index","_ammoChoices","_optics","_pointers","_muzzles","_underbarrel","_legalOptics"];
params["_pos","_aiGroup",["_skillLevel","red"],["_uniforms", []],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_Launcher","none"],["_weaponList",[]],["_sideArms",[]],["_scuba",false],["_garrison",false]];

if (_weaponList isEqualTo []) then {_weaponList = [_skillLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_skillLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_skillLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_skillLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_skillLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_skillLevel] call blck_fnc_selectAIBackpacks};

if (isNull _aiGroup) exitWith {["NULL-GROUP Provided to _fnc_spawnUnit"] call blck_fnc_log};

_unit = ObjNull;

if (blck_modType isEqualTo "Epoch") then
{
	"I_Soldier_EPOCH" createUnit [_pos, _aiGroup, "_unit = this", blck_baseSkill, "COLONEL"];
	_unit setVariable ["LAST_CHECK",28800,true];
	switch(_skillLevel) do
	{
		case "blue":{_unit setVariable["Crypto",2 + floor(random(blck_maxMoneyBlue)),true];};
		case "red":{_unit setVariable["Crypto",4 + floor(random(blck_maxMoneyRed)),true];};
		case "green":{_unit setVariable["Crypto",6 + floor(random(blck_maxMoneyGreen)),true];};
		case "orange":{_unit setVariable["Crypto",8 + floor(random(blck_maxMoneyOrange)),true];};
	};
};
if !(blck_modType isEqualTo "Epoch") then
{
	"i_g_soldier_unarmed_f" createUnit [_pos, _aiGroup, "_unit = this", blck_baseSkill, "COLONEL"];
	switch(_skillLevel) do
	{
		case "blue":{_unit setVariable["ExileMoney",2 + floor(random(blck_maxMoneyBlue)),true];};
		case "red":{_unit setVariable["ExileMoney",4 + floor(random(blck_maxMoneyRed)),true];};
		case "green":{_unit setVariable["ExileMoney",6 + floor(random(blck_maxMoneyGreen)),true];};
		case "orange":{_unit setVariable["ExileMoney",8 + floor(random(blck_maxMoneyOrange)),true];};
	};
};

private _tempPos = _pos findEmptyPosition [0.1, 3, typeOf _unit];

if !(_tempPos isEqualTo []) then {_unit setPos _tempPos};

[_unit] call blck_fnc_removeGear;
if (_scuba) then
{
	_unit swiminDepth (([_pos] call blck_fnc_findWaterDepth) / 2);
};

//Sets AI Tactics
_unit enableAI "ALL";
if(_garrison) then
{
	_unit disableAI "PATH";
};
_unit allowDammage true;
_unit setBehaviour "COMBAT";
_unit setunitpos "AUTO";

if (surfaceIsWater (getPos _unit)) then 
{
	_uniforms = blck_UMS_uniforms;
	_headGear = blck_UMS_headgear;
	_weaponList = blck_UMS_weapons;
	_vests = blck_UMS_vests;
};
_unit forceAddUniform (selectRandom _uniforms);
if !(_headGear isEqualTo []) then 
{
	_unit addHeadgear (selectRandom _headGear);
};
if !(_vests  isEqualTo []) then 
{
	_unit addVest (selectRandom _vests);
};

if (_weaponList isEqualTo []) then {_weaponList = call blck_fnc_selectAILoadout};
_weap = selectRandom _weaponList;  
_unit addWeaponGlobal  _weap; 
_ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
_unit addMagazines[selectRandom _ammochoices,3];
/*
_optics = getArray (configfile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
_pointers = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
_muzzles = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
_underbarrel = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
*/

if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom ([_weap, 101] call BIS_fnc_compatibleItems))};  // muzzles
if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom ([_weap, 201] call BIS_fnc_compatibleItems))};  // optics
if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom ([_weap, 301] call BIS_fnc_compatibleItems))};  // pointers
if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom ([_weap, 302] call BIS_fnc_compatibleItems))};  // underbarrel
if ((count(getArray (configFile >> "cfgWeapons" >> _weap >> "muzzles"))) > 1) then 
{
	_unit addMagazine "1Rnd_HE_Grenade_shell";
};

if !(_sideArms  isEqualTo []) then
{
	_weap = selectRandom _sideArms;
	_unit addWeaponGlobal  _weap; 
	_ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
	_unit addMagazines [selectRandom _ammoChoices, 2];
};
for "_i" from 1 to (1+floor(random(4))) do 
{
	_unit addItem (selectRandom blck_ConsumableItems);
};

// Add  First Aid or Grenade 50% of the time
if (round(random 10) <= 5) then 
{
	_unit addItem selectRandom blck_specialItems;
};

/*
if ( !(_Launcher isEqualTo "none") && !(_backpacks  isEqualTo [])) then
{
	_unit addWeaponGlobal _Launcher;
	_unit addBackpack (selectRandom _backpacks);
	for "_i" from 1 to 3 do 
	{
		_unit addItemToBackpack (getArray (configFile >> "CfgWeapons" >> _Launcher >> "magazines") select 0); // call BIS_fnc_selectRandom;
	};
	_unit setVariable["Launcher",_launcher,true];
} else {
	if ( random (1) < blck_chanceBackpack && !(_backpacks  isEqualTo [])) then
	{ 
		_unit addBackpack selectRandom _backpacks;
	};
};
*/
if !(_backpacks isEqualTo []) then 
{
	if (_Launcher isEqualTo "none") then 
	{
		if ( random (1) < blck_chanceBackpack) then
		{ 
			_unit addBackpack selectRandom _backpacks;
		};
	} else {
		_unit addWeaponGlobal _Launcher;
		_unit addBackpack (selectRandom _backpacks);
		private _mags = getArray (configFile >> "CfgWeapons" >> _Launcher >> "magazines");
		for "_i" from 1 to 3 do 
		{
			_unit addItemToBackpack (_mags select 0); // call BIS_fnc_selectRandom;
		};
		_unit setVariable["Launcher",_launcher,true];		
	};
};

if(sunOrMoon < 0.2 && blck_useNVG)then
{
	_unit addWeapon selectRandom blck_NVG;
	_unit setVariable ["hasNVG", true,true];
}
else
{
	_unit setVariable ["hasNVG", false,true];
};

_unit addWeapon selectRandomWeighted["",4,"Binocular",3,"Rangefinder",1];
//_unit addEventHandler ["HandleDamage",{_this call blck_EH_handleDamage;}];
_unit addEventHandler ["FiredNear",{_this call blck_EH_AIfiredNear;}];
_unit addEventHandler ["Reloaded", {_this call blck_EH_unitWeaponReloaded;}];
_unit addMPEventHandler ["MPKilled", {[(_this select 0), (_this select 1)] call blck_EH_AIKilled;}];
_unit addMPEventHandler ["MPHit",{[_this] call blck_EH_AIHit;}];

switch (_skillLevel) do 
{
	case "blue": {_index = 0;_aiSkills = blck_SkillsBlue;};
	case "red": {_index = 1;_aiSkills = blck_SkillsRed;};
	case "green": {_index = 2;_aiSkills = blck_SkillsGreen;};
	case "orange": {_index = 3;_aiSkills = blck_SkillsOrange;};
	default {_index = 0;_aiSkills = blck_SkillsBlue;};
};

[_unit,_aiSkills] call blck_fnc_setSkill;
_unit setVariable ["alertDist",blck_AIAlertDistance select _index,true];
_unit setVariable ["intelligence",blck_AIIntelligence select _index,true];
_unit setVariable ["GMS_AI",true,true];

_unit


