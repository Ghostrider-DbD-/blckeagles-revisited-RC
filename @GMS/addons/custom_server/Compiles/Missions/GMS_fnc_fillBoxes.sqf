
/*
	By Ghostrider-GRG-
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

	private["_a1","_item","_diff","_tries"];
	params["_crate","_boxLoot","_itemCnts"];

	_itemCnts params["_wepCnt","_magCnt","_opticsCnt","_materialsCnt","_itemCnt","_bkcPckCnt"];
	_boxLoot params["_weapons","_magazines","_optics","_materials","_items","_backpacks"];

	if !(_weapons isEqualTo []) then
	{
		_tries = [_wepCnt] call blck_fnc_getNumberFromRange;
	
		// Add some randomly selected weapons and corresponding magazines
		for "_i" from 0 to (_tries - 1) do 
		{
			_item = selectRandom _weapons;

			if (typeName _item isEqualTo "ARRAY") then  //  Check whether weapon name is part of an array that might also specify an ammo to use
			{ 
				_crate addWeaponCargoGlobal [_item select 0,1];  // if yes then assume the first element in the array is the weapon name
				if (count _item >1) then {  // if the array has more than one element assume the second is the ammo to use.
					_crate addMagazineCargoGlobal [_item select 1, 1 + round(random(3))];
				} else { // if the array has only one element then lets load random ammo for it
					_crate addMagazineCargoGlobal [selectRandom (getArray (configFile >> "CfgWeapons" >> (_item select 0) >> "magazines")), 1 + round(random(3))];
				};
			} else {
				if (_item isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
				{
					_crate addWeaponCargoGlobal [_item, 1];
					_crate addMagazineCargoGlobal [selectRandom (getArray (configFile >> "CfgWeapons" >> _item >> "magazines")), 1 + round(random(3))];
				};
			};
		};
	};

	if !(_magazines isEqualTo []) then
	{
		_tries = [_magCnt] call blck_fnc_getNumberFromRange;

		// Add Magazines, grenades, and 40mm GL shells
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _magazines;

				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1);  // Take difference between max and min number of items to load and randomize based on this value
					_crate addMagazineCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addMagazineCargoGlobal [_item, 1];
				};
		};
	};

	if !(_optics isEqualTo []) then
	{
		_tries = [_opticsCnt] call blck_fnc_getNumberFromRange;

		// Add Optics
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _optics;

				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1); 
					_crate additemCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];		
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addItemCargoGlobal [_item,1];
				};
		};
	};

	if !(_materials isEqualTo []) then
	{
		_tries = [_materialsCnt] call blck_fnc_getNumberFromRange;

		// Add materials (cindar, mortar, electrical parts etc)
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _materials;

				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1); 
					_crate additemCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addItemCargoGlobal [_item, 1];
				};
		};
	};

	if !(_items isEqualTo []) then
	{
		_tries = [_itemCnt] call blck_fnc_getNumberFromRange;
	
		// Add Items (first aid kits, multitool bits, vehicle repair kits, food and drinks)
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _items;
				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1); 
					_crate additemCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];		
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addItemCargoGlobal [_item, 1];
				};
		};	
	};

	if !(_backpacks isEqualTo []) then
	{	
		_tries = [_bkcPckCnt] call blck_fnc_getNumberFromRange;
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _backpacks;
	
				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1); 
					_crate addbackpackcargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addbackpackcargoGlobal [_item, 1];
				};
		};
	};
