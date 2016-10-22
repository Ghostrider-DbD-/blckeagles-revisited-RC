/*
	Code by blckeagls
	Modified by Ghostrider
	Logic for adding AI Ammo, GL Shells and Attachments addapted from that by Vampire.
	Code to delete dead AI bodies moved to AIKilled.sqf
	Everything having to do with spawning and configuring an AI should happen here
*/

//Defines private variables so they don't interfere with other scripts
private ["_pos","_i","_weap","_ammo","_other","_skin","_aiGroup","_ai1","_magazines","_players","_owner","_ownerOnline","_nearEntities","_skillLevel","_aiSkills","_specialItems",
		"_Launcher","_launcherRound","_vest","_index","_WeaponAttachments","_Meats","_Drink","_Food","_aiConsumableItems","_weaponList","_ammoChoices","_attachment","_attachments",
		"_headGear","_uniforms","_pistols","_specialItems","_noItems"];

params["_pos","_weaponList","_aiGroup",["_skillLevel","red"],["_Launcher","none"],["_uniforms", blck_SkinList],["_headGear",blck_headgear],["_underwater",false]];
//_pos = _this select 0;  // Position at which to spawn AI
//_weaponList = _this select 1;
//_aiGroup = _this select 2;  // Group to which AI belongs
//_skillLevel = [_this,3,"red"] call BIS_fnc_param;   // Assign a skill level in case one was not passed."blue", "red", "green", "orange"
//_Launcher = [_this, 4, "none"] call BIS_fnc_param; // Set launchers to "none" if no setting was passed.
//_uniforms = [_this, 5, blck_SkinList] call BIS_fnc_param;
//_headGear =  [_this, 6, _shemag]  call BIS_fnc_param;//_headGear

_ai1 = ObjNull;
_modType = call blck_getModType;
if (_modType isEqualTo "Epoch") then
{
	"I_Soldier_EPOCH" createUnit [_pos, _aiGroup, "_ai1 = this", 0.7, "COLONEL"];
};
if (_modType isEqualTo "Exile") then
{
	"i_g_soldier_unarmed_f" createUnit [_pos, _aiGroup, "_ai1 = this", 0.7, "COLONEL"];
};
[_ai1] call blck_fnc_removeGear;
_skin = selectRandom _uniforms;  // call BIS_fnc_selectRandom;
_ai1 forceAddUniform _skin;

//Stops the AI from being cleaned up
_ai1 setVariable["DBD_AI",1];

//Sets AI Tactics
_ai1 enableAI "TARGET";
_ai1 enableAI "AUTOTARGET";
_ai1 enableAI "MOVE";
_ai1 enableAI "ANIM";
_ai1 enableAI "FSM";
_ai1 allowDammage true;
_ai1 setBehaviour "COMBAT";
_ai1 setunitpos "AUTO";

if (_modType isEqualTo "Epoch") then
{
	// do this so the AI or corpse hangs around on Epoch servers.
	_ai1 setVariable ["LAST_CHECK",28800,true];
};

_ai1 addHeadgear (selectRandom _headGear);
// Add a vest to AI for storage
_vest = selectRandom blck_vests;  // call BIS_fnc_selectRandom;
_ai1 addVest _vest;

if ( random (1) < blck_chanceBackpack) then
{
	_bpck = selectRandom blck_backpack;  // call BIS_fnc_selectRandom;
	_ai1 addBackpack _bpck; 
};

// Add a primary weapon : Vampires logic used here.
_weap = selectRandom _weaponList;  // call BIS_fnc_selectRandom;

//diag_log format["[spawnUnit.sqf] _weap os %1",_weap];
_ai1 addWeaponGlobal  _weap; 
// get the ammo that can be used with this weapon. This function returns an array with all possible ammo choices in it.
_ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
_ammo = selectRandom _ammoChoices;  // call BIS_fnc_selectRandom;
//diag_log format["[spawnUnit.sqf] _ammo returned as %1",_ammo];
for "_i" from 2 to (floor(random 3)) do {
	_ai1 addMagazine _ammo;
};
// If the weapon has a GL, add some rounds for it: based on Vampires code
if ((count(getArray (configFile >> "cfgWeapons" >> _weap >> "muzzles"))) > 1) then {
	_ai1 addMagazine "1Rnd_HE_Grenade_shell";
};

// Add a pistol : Vampires logic used here.
//_weap = selectRandom _pistols; // call BIS_fnc_selectRandom;
_weap = selectRandom blck_Pistols;
//_ai1 setVariable["PrimaryWeap",_weap];

//diag_log format["[spawnUnit.sqf] _weap os %1",_weap];
_ai1 addWeaponGlobal  _weap; 

// get the ammo that can be used with this weapon. This function returns an array with all possible ammo choices in it.
_ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
_ammo = selectRandom _ammoChoices;  // call BIS_fnc_selectRandom;
//diag_log format["[spawnUnit.sqf] _ammo returned as %1",_ammo];
_ai1 addMagazine _ammo;

//adds 3 random items to AI.  _other = ["ITEM","COUNT"]
_noItems = floor(random(3));
for "_i" from 1 to _noItems do {
	_i = _i + 1;
	//_ai1 addItem (selectRandom _aiConsumableItems);
	_ai1 addItem (selectRandom blck_ConsumableItems);
};

// Add an First Aid or Grenade 50% of the time
if (round(random 10) <= 5) then 
{
	//_item = selectRandom _specialItems;  // call BIS_fnc_selectRandom;
	_item = selectRandom blck_specialItems;
	//diag_log format["spawnUnit.sqf] -- Item is %1", _item];
	_ai1 addItem _item;
};

if (_Launcher != "none") then
{
	private["_bpck"];
	//diag_log format["spawnUnit.sqf:  Available Launcher Rounds are %1",getArray (configFile >> "CfgWeapons" >> _Launcher >> "magazines")];
	_ai1 addWeaponGlobal _Launcher;
	_launcherRound = getArray (configFile >> "CfgWeapons" >> _Launcher >> "magazines") select 0;
	//diag_log format["[spawnUnit.sqf] Launcher round is %1",_launcherRound];
	for "_i" from 1 to 3 do 
	{
		//diag_log format["[spawnUnit.saf] Adding Launcher Round %1 ",_launcherRound];
		//private["_round"];
		//_round = selectRandom _launcherRound;
		_ai1 addItemToBackpack  _launcherRound call BIS_fnc_selectRandom;
	};
	_ai1 selectWeapon (secondaryWeapon _ai1);
	_ai1 setVariable["Launcher",_launcher];
};

if(sunOrMoon < 0.2 && blck_useNVG)then
{
	_ai1 addWeapon "NVG_EPOCH";
	_ai1 setVariable ["hasNVG", true];
}
else
{
	_ai1 setVariable ["hasNVG", false];
};

// Infinite ammo
_ai1 addeventhandler ["fired", {(_this select 0) setvehicleammo 1;}];

// Do something if AI is killed
_ai1 addEventHandler ["killed",{ [(_this select 0), (_this select 1)] execVM blck_EH_AIKilled;}]; // changed to reduce number of concurrent threads, but also works as spawn blck_AIKilled; }];
//_ai addEventHandler ["HandleDamage",{ [(_this select 0), (_this select 1)] execVM blck_EH_AIHandleDamage;}];

switch (_skillLevel) do 
{
	case "blue": {_index = 0;_aiSkills = blck_SkillsBlue;};
	case "red": {_index = 1;_aiSkills = blck_SkillsRed;};
	case "green": {_index = 2;_aiSkills = blck_SkillsGreen;};
	case "orange": {_index = 3;_aiSkills = blck_SkillsOrange;};
	default {_index = 0;_aiSkills = blck_SkillsBlue;};
};

_alertDist = blck_AIAlertDistance select _index; 
_intelligence = blck_AIIntelligence select _index;

[_ai1,_aiSkills] call blck_fnc_setSkill;
_ai1 setVariable ["alertDist",_alertDist,true];
_ai1 setVariable ["intelligence",_intelligence,true];
_ai1 setVariable ["GMS_AI",true,true];

_ai1


