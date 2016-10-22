/*

	SDROP for A3 Epoch 
	Modified for GMS by
	Ghostrider-DBD-
	Last modified 2/19/16
*/

fn_returnHome = {
		private["_unitGroup","_heliLoitering","_helicopter","_startingpos"];
		_unitGroup = _this select 0;
		_helicopter = _this select 1;
		_startingpos = _this select 2;
		
		diag_log "fn_returnHome:: sending heli home now";
		//return helicopter to spawn area and clean it up
		//sometimes this doesn't happen, so we check heli loitering later
		_wpHome =_unitGroup addWaypoint [_startingpos, 1];
		_wpHome setWaypointType "MOVE";
		_wpHome setWaypointSpeed "FULL";
		_wpHome setWaypointBehaviour "COMBAT";
		_wpHome setWaypointCompletionRadius 800;
		_wpHome setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach units group this;"];

		//check to see if helicopter is loitering (it should be long gone by now)
		//hate to do this, but have to just delete the vehicle as it refuses to comply with waypoint
		_heliLoitering = true;
		while {_heliLoitering} do {
			if (_helicopter distance (getWPPos _wpPosition) < 400 && !isNull _helicopter) then {
				diag_log text format ["[SDROP]: Deleted supply helicopter for loitering"];
				deleteWaypoint [_unitGroup, 0];
				deleteWaypoint [_unitGroup, 1];
				{deleteVehicle _x;} forEach units _unitGroup;
				deleteVehicle _helicopter;
			} else {
				_heliLoitering = false;
			};
			uiSleep 5;
		};
		diag_log "fn_returnHome:: heli and crew destroyed";
};

fn_LoadLootFood = {
	private["_crate","_foodAndDrinks","_apparel","_backpacks"];
	_crate = _this select 0;
	
	//empty crate first
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	_foodAndDrinks = [
		["ItemSodaRbull",2],["ItemSodaPurple",2],["ItemSodaOrangeSherbet",2],["ItemSodaMocha",2],["ItemSodaMocha",2],["ItemSodaBurst",2],["FoodMeeps",2],["FoodSnooter",2],
		["FoodWalkNSons",2],["water_epoch",4],["ItemCoolerE",4],["SweetCorn_EPOCH",4],["WhiskeyNoodle",6],["SnakeMeat_EPOCH",1],["CookedRabbit_EPOCH",2],["CookedChicken_EPOCH",2],["CookedGoat_EPOCH",2],
		["CookedSheep_EPOCH",2]
	];
	{_crate addMagazineCargoGlobal _x} forEach _foodAndDrinks;
	
	_apparel = [
		["U_O_GhillieSuit",1],["U_O_Wetsuit",1],["U_OG_Guerilla1_1",1],["U_OG_Guerilla2_1",1],["U_OG_Guerilla3_1",1],["U_OrestesBody",1],["U_Wetsuit_uniform",1],["U_Ghillie1_uniform",1],["U_O_CombatUniform_ocamo",1]
	];
	{_crate addItemCargoGlobal _x} forEach _apparel;
	{_crate addBackpackCargoGlobal _x} forEach [["B_Carryall_ocamo",2]];
};

fn_LoadLootSupplies = {
	private["_crate","_supplies"];
	_crate = _this select 0;
	
	//empty crate first
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	//fill the crate with SUPPLIES
	_supplies = [
		["CinderBlocks",8],["jerrycan_epoch",3],["CircuitParts",4],["ItemCorrugatedLg",1],["ItemCorrugated",4],["ItemMixOil",2],["MortarBucket",6],["PartPlankPack",4],["FAK",6],["VehicleRepair",2],
		["Towelette",4],["HeatPack",2],["ColdPack",2],["Pelt_EPOCH",2],/*["Heal_EPOCH",2],["Repair_EPOCH",1],*/["EnergyPack",4],["EnergyPackLg",1]
	];
	{_crate addMagazineCargoGlobal _x} forEach _supplies;
	_crate addWeaponCargoGlobal ["MultiGun",2];	
	{_crate addBackpackCargoGlobal  _x} forEach [["B_Carryall_oucamo",1],["B_FieldPack_cbr",1],["B_TacticalPack_ocamo",1]];
};

fn_LoadLootWeapons = {
	private["_crate","_weapons","_magazines","_attachments","_apparel"];
	_crate = _this select 0;
	
	//empty crate first
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	//fill the crate with WEAPONS and AMMO
	_weapons = [
		["srifle_DMR_01_F",1],["arifle_Mk20_F",1],["arifle_MX_Black_F",1],["M249_EPOCH",1],["srifle_LRR_SOS_F",1]
	];
	{_crate addWeaponCargoGlobal _x} forEach _weapons;
	_magazines = [
		["20Rnd_762x51_Mag",4],["30Rnd_556x45_Stanag",4],["30Rnd_65x39_caseless_mag_Tracer",4],["200Rnd_556x45_M249",2],["7Rnd_408_Mag",3],["HandGrenade",2],["MiniGrenade",2]
	];
	{_crate addMagazineCargoGlobal _x} forEach _magazines;
	_attachments = [
		["optic_Arco",1],["optic_SOS",1],["optic_Aco",1],["optic_LRPS",1],["Muzzle_snds_H",1],["Muzzle_snds_M",1],["Muzzle_snds_B",1],["ItemCompass",4],["ItemGPS",4],["ItemWatch",4]
	];
	_apparel = [
		["V_7_EPOCH",1],["V_10_EPOCH",1],["V_13_EPOCH",1],["V_14_EPOCH",1],["V_15_EPOCH",1],["V_37_EPOCH",1],["V_38_EPOCH",1]
	];
	{_crate addItemCargoGlobal _x} forEach _attachments + _apparel;
	_crate addBackpackCargoGlobal [["B_FieldPack_ocamo",2]];
};

fn_LoadLootRandom = {
	private ["_crate","_var","_tmp","_kindOf","_report","_cAmmo","_blackList","_LootList"];
	
	_blackList = // Crate Blacklist - These are items that should NOT be in random crate - should eliminate most BE filter issues (may need more testing)
	[
		"DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag",
		"APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag", "NVGoggles_OPFOR", "NVGoggles_INDEP",
		"FirstAidKit", "Medikit", "ToolKit", "optic_DMS"
	];
	_crate = _this select 0;
	
	// Empty Crate
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal  _crate;
	clearItemCargoGlobal _crate;
	
	_LootList = [];
	// Generate Loot
	{
	 _tmp = (getArray(_x >> 'items'));
	 {_LootList = _LootList + [ ( _x select 0 ) select 0 ];} forEach (_tmp);
	} forEach ("configName _x != 'Uniforms' && configName _x != 'Headgear'" configClasses (configFile >> "CfgLootTable"));
	
	_report = [];
	// Load Random Loot Amount
	for "_i" from 1 to ((floor(random 10)) + 10) do {
		_var = (_LootList call BIS_fnc_selectRandom);
		
		if (!(_var in SDROPCrateBlacklist)) then {
			switch (true) do
			{
				case (isClass (configFile >> "CfgWeapons" >> _var)): {
					_kindOf = [(configFile >> "CfgWeapons" >> _var),true] call BIS_fnc_returnParents;
					if ("ItemCore" in _kindOf) then {
						_crate addItemCargoGlobal [_var,1];
					} else {
						_crate addWeaponCargoGlobal [_var,1];
						
						_cAmmo = [] + getArray (configFile >> "cfgWeapons" >> _var >> "magazines");
						{
							if (isClass(configFile >> "CfgPricing" >> _x)) exitWith {
								_crate addMagazineCargoGlobal [_x,2];
							};
						} forEach _cAmmo;
					};
				};
				case (isClass (configFile >> "cfgMagazines" >> _var)): {
					_crate addMagazineCargoGlobal [_var,1];
				};
				case ((getText(configFile >> "cfgVehicles" >> _var >>  "vehicleClass")) == "Backpacks"): {
					_crate addBackpackCargoGlobal [_var,1];
				};
				default {
					_report = _report + [_var];
				};
			};
		};
	};
	
	if ((count _report) > 0) then {
		diag_log text format ["[blckeagls]: LoadLoot: <Unknown> %1", str _report];
	};
};

fn_spawnLootCrate = {
	private["_crate","_chute","_crateTypeArr","_crateType","_supplyHeli","_crateOnGround"];
	_supplyHeli = _this select 0;
	//create the parachute and crate

	_chute = createVehicle ["I_Parachute_02_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_chute call EPOCH_server_vehicleInit;
	_chute call EPOCH_server_setVToken;
	_crate = createVehicle ["IG_supplyCrate_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_crate call EPOCH_server_vehicleInit;
	_crate call EPOCH_server_setVToken;	
	//open parachute and attach to crate	
	_chute setPos [position _supplyHeli select 0, position _supplyHeli select 1, (position _supplyHeli select 2) - 10];	
	_crate setPos [position _chute select 0, position _chute select 1, (position _chute select 2) - 10];	
	_crate attachTo [_chute, [0, 0, -0.5]];
	// To be sure the crate survives landing and any stray gunfire turn off damage for that object
	_crate allowDamage false;

	//FILL crate with LOOT
	_crateTypeArr = ["food","supplies","weapons"/*,"random","random","random"*/];
	_crateType = _crateTypeArr call bis_fnc_selectrandom;

	//Randomize the crate type and fill it
	//same crate every time is boring yo!
	switch (_crateType) do {
		case "food": {
			[_crate] call fn_LoadLootFood;
		};
		case "supplies": {
			[_crate] call fn_LoadLootSupplies;
		};
		case "weapons": {
			[_crate] call fn_LoadLootWeapons;
		};
		case "random": {
			[_crate] call fn_LoadLootRandom;
		};
	};
	// put a marker on the crate
	[_crate] spawn blck_fnc_signalEnd;
	//detach chute when crate is near the ground
	_crateOnGround = false;
	while {!_crateOnGround} do {
		if (getPosATL _crate select 2 > 30) then {
			//attempt to smooth drop for paratroops
			//commented out for performance improvements
			/*if (SDROP_CreateParatrooperAI) then {
				{
					_vel = velocity _x;
					_dirTo = [_x,_crate] call bis_fnc_dirTo;
					_x setDir _dirTo;
					_x setVelocity [
						(_vel select 0) + (sin _dirTo * 0.2),
						(_vel select 1) + (cos _dirTo * 0.2),
						(_vel select 2)
					];
				} forEach units _grp;
			};*/
			uiSleep 5;
		};

		if (getPosATL _crate select 2 < 4) then {
			_crateOnGround = true;
			detach _crate;
		};
		uiSleep 1;
	};

	//delete the chute for clean-up purposes
	deleteVehicle _chute;			
};

//////////////////////////////////////////////////////////////
// Start of the main routine
/////////////////////////////////////////////////////////////
private ["_cleanheli","_drop","_helipos","_gunner2","_gunner","_playerPresent","_skillarray","_aicskill","_aiskin","_aigear","_helipatrol","_gear","_skin","_backpack","_mags",
		"_gun","_triggerdis","_startingpos","_aiweapon","_mission","_heli_class","_startPos","_helicopter","_unitGroup","_pilot","_skill","_paranumber","_position","_wp1","_weapons",
		"_headgear","_units","_wpPosition","_wpHome","_chanceLootCrate"];

_position = _this select 0;  // Coordinates of the AI group requesting reinforcements; typically the center of the mission
_startingpos = _this select 1; // location at which the heli should begin its approach, such as 1 km from the mission
_triggerdis = _this select 2; // 25-40 meters from _position is recommended
_heli_class = [_this, 3, "B_Heli_Light_01_armed_F"] call BIS_fnc_param;
_paranumber = [_this, 4,3] call BIS_fnc_param;  // Number of paratroops to spawn
_skill = [_this, 5, "red"] call BIS_fnc_param;
_chanceHeliPatrol = [_this, 6, 0.33] call BIS_fnc_param;  // when true the heli will circle around _position and suppress
_chanceLootCrate = [_this, 7,0.33] call BIS_fnc_param;
_weapons = [_this, 8,blck_WeaponList_Red] call BIS_fnc_param;
_skins = [_this,9,blck_SkinList] call BIS_fnc_param;
_headgear = [_this, 10, blck_headgear] call BIS_fnc_param;

_units = [];
// wait for player to come into area.
diag_log "[bckeagls]: Paradrop Waiting for player";

//sleep 120;

waitUntil{ {isPlayer _x && _x distance _position <= 600} count playableunits > 0 };  
// Three Initial Tasks, Spawn Chopper, give it Crew, and give the Crew initial waypoints for a flyby over the mission area and return to base for cleanup of chopper.

//Spawing in Chopper and crew
diag_log format ["[bckeagls]: Spawning a %1 with %2 units to be paradropped at %3",_heli_class,_paranumber,_position];
diag_log format ["[bckeagls]: Spawning a %1 to fly to, patrol and return from at %2",_heli_class,_paranumber,_position];
_unitGroup = createGroup blck_AI_Side;
_pilot = [[0,0,0],_weapons,_unitGroup,_skill] call blck_fnc_spawnAI;
[_pilot] joinSilent _unitGroup;
//_units pushback _pilot;

_helicopter = createVehicle [_heli_class, [(_startingpos select 0),(_startingpos select 1), 100], [], 0, "FLY"];
_helicopter setFuel 1;
_helicopter engineOn true;
clearWeaponCargoGlobal _helicopter;
clearMagazineCargoGlobal _helicopter;
clearItemCargoGlobal _helicopter;
_helicopter setVehicleAmmo 1;
_helicopter flyInHeight 150;
_helicopter addEventHandler ["GetOut",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];


//keep heli around until we delete it
//_helicopter call EPOCH_server_vehicleInit;
_helicopter call EPOCH_server_setVToken;

_pilot assignAsDriver _helicopter;
_pilot moveInDriver _helicopter;
_pilot setSkill 1;

//set waypoint for helicopter over the mission requesting reinforcements
_wpPosition =_unitGroup addWaypoint [_position, 0];
_wpPosition setWaypointType "MOVE";
_wpPosition setWaypointSpeed "FULL";
_wpPosition setWaypointBehaviour "COMBAT";
	
_gunner = [[0,0,0],_weapons,_unitGroup,_skill] call blck_fnc_spawnAI;
[_gunner] joinSilent _unitGroup;;
_gunner assignAsGunner _helicopter;
_gunner moveInTurret [_helicopter,[0]];

_gunner2 = [[0,0,0],_weapons,_unitGroup,_skill] call blck_fnc_spawnAI;
_gunner2 assignAsGunner _helicopter;
_gunner2 moveInTurret [_helicopter,[1]];
[_gunner2] joinSilent _unitGroup;

_unitGroup allowFleeing 0;
_unitGroup setBehaviour "COMBAT";
_unitGroup setSpeedMode "FULL";
_unitGroup setCombatMode "RED";

_paraGroup = [[0,0,0],_paranumber,_paranumber,_skill,_position,5,35,_skins,_headgear] call blck_fnc_spawnGroup;

// Remove waypoints which may not be correct in this instance
 while {(count (waypoints group(_paraGroup select 0))) > 0} do
 {
	deleteWaypoint ((waypoints group (_paraGroup select 0)) select 0);
 };
 {
	// Give unit parachute
	removeBackpack _x;
	_x addBackpack "B_Parachute";
	_x assignAsCargoIndex [_helicopter, 1];
	_x moveInCargo _helicopter;
 } forEach _paraGroup;
 
//Waits until heli gets near the position to drop crate, or if waypoint timeout has been triggered
if ( random(1) < _chanceLootCrate) then {
	private["_destinationDone","_supplyDropStartTime"];
	// drop a crate with loot
	_wait = true;
	_destinationDone = false;
	_supplyDropStartTime = diag_tickTime;
	while {_wait && !_destinationDone} do {
		if (_helicopter distance (getWPPos _wpPosition) < 200 ) then {
			_destinationDone = true;
			[_helicopter] spawn fn_spawnLootCrate;
			diag_log "spawnheli_para:: loot crate spawned";
		};
		if ((diag_tickTime - _supplyDropStartTime) > 300) then {
			_wait = false;
		};
		uiSleep 10;
	};
};

diag_log "spawnheli_para:: Waiting for heli to be in position to deploy paratrops";
while {_helicopter distance _position > 200} do { uiSleep 5;};
diag_log "spawnheli_para:: Deploing paratroopers";
[_pos,10,35,_paraGroup] call blck_fnc_setupWaypoints;
{
	unassignVehicle (_x); 
	(_x) action ["EJECT", _helicopter]; 
	uiSleep 1.5; 
} forEach units _paraGroup;
diag_log "spawnheli_para:: Paratroopers deployed";

_wpLoiter = _unitGroup addWaypoint [_position,30];
_wpLoiter setWaypointType "LOITER";
_wpLoiter setWaypointSpeed "LIMITED";
_wpLoiter setWaypointTimeout  [30,45,60];
_wpLoiter setWaypointLoiterType "CIRCLE_L";

if (random(1) < _chanceHeliPatrol) then { 
	[_unitGroup,_position,_startingpos] spawn {
		private["_wp1","_unitGroup","_position","_startingpos","_helicopter"];
		_unitGroup = _this select 0;
		_position = _this select 1;
		_helicopter = _this select 2;
		_startingpos = _this select 3;
		
		_wp1 = _unitGroup addWaypoint [[(_position select 0),(_position select 1)], 100];
		_wp1 setWaypointType "SAD";
		_wp1 setWaypointCompletionRadius 150;
		_wp1 setWaypointTimeout [250,300,325];  // about 5 min.
		_unitGroup setBehaviour "AWARE";
		{_x addEventHandler ["Killed",{[_this select 0, _this select 1, "air"] call on_kill;}];} forEach (units _unitgroup);
		uiSleep 300;
		[_unitGroup,_helicopter,_startingpos] spawn fn_returnHome;
	};
} else {
	//small pause to ensure all items extract
	uiSleep 3;
	[_unitGroup,_helicopter,_startingpos] spawn fn_returnHome;
};

diag_log "GMS_fnc_spawnheli_para.sqf has finished";
_units;
/*
if (!isServer)exitWith{};



//Delay before chopper spawns in.
//sleep _delay;


// Add waypoints to the chopper group.
_wp = _unitGroup addWaypoint [[(_position select 0), (_position select 1)], 0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 100;

_drop = true;
_helipos = getpos _helicopter;
while {(alive _helicopter) AND (_drop)} do {
	private ["_magazine","_weapon","_weaponandmag","_chute","_para","_pgroup"];
	sleep 1;
	_helipos = getpos _helicopter;
	if (_helipos distance [(_position select 0),(_position select 1),100] <= 200) then {
		_pgroup = createGroup blck_AI_Side;
		for "_i" from 1 to _paranumber do
		{
			_para = [[0,0,0],_weapons,_unitGroup,_skill] call blck_fnc_spawnAI;
			_helipos = getpos _helicopter;
			_chute = createVehicle ["B_Parachute", [(_helipos select 0), (_helipos select 1), (_helipos select 2)], [], 0, "NONE"];
			_para moveInDriver _chute;
			[_para] joinSilent _pgroup;
			sleep 1.5;
		};
		
		_drop = false;
		_pgroup selectLeader ((units _pgroup) select 0);
		//diag_log format ["WAI: Spawned in %1 ai units for paradrop",_paranumber];
		[_position,10,30,_pgroup] call blck_fnc_setupWaypoints;
	};
	//_units = units _pgroup;
};
diag_log format ["[bckeagls]: dropped %1 units to be paradropped at %2",_paranumber,_position];




	
	
