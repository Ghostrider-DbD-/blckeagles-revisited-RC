/*
	[_item,_crate] call blck_addItemToCrate;
	where
		_crate is a container such as ammo box or vehicle
		_item is a string or array.
		If _item is a string then add 1 of that item to the container.
		If _item is an array with 2 elements ["itemName",3] then assume that the first element is a string and is the name of the item, and the second is the number to add.
		if _item is an array with 3 elements ["itemName",2,6] assume that the first element is the item name (string), the second the min # to add and the third the max # to add.
	By Ghostrider-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";


	params["_itemInfo","_crate",["_addAmmo",0]];
	private["_isRifle","_isMagazine","_isBackpack"];
	_isWeapon = false;
	_isMagazine = false;
	_isBackpack = false;
	_quant = 0;

	if (typeName _itemInfo isEqualTo "STRING") then {_item = _itemInfo; _quant = 1};  // case where only the item descriptor was provided
	if (typeName _itemInfo isEqualTo "ARRAY") then {
		
		if (count _itemInfo isEqualTo 2) then {_item = _itemInfo select 0; _quant = _itemInfo select 1;}; // case where item descriptor and quantity were provided
		if (count _itemInfo isEqualto 3) then {
			_item = _itemInfo select 0; 
			_quant = (_itemInfo select 1) + round(random((_itemInfo select 2) - (_itemInfo select 1)));
		}; // case where item descriptor, min number and max number were provided.
	};
	if (((typeName _item) isEqualTo "STRING") && (_item != "")) then
	{
		if (isClass(configFile >> "CfgWeapons" >> _item)) then {
			_crate addWeaponCargoGlobal [_item,_quant]; 
			_isWeapon = true;
			_count = 0;
			if (typeName _addAmmo isEqualTo "SCALAR") then
			{
				_count = _addAmmo;
			};
			if (typeName _addAmmo isEqualto "ARRAY") then
			{
				_count = (_addAmmo select 0) + (round(random((_addAmmo select 1) - (_addAmmo select 0))));
			};
			_ammo = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");			
			for "_i" from 1 to _count do
			{
					_crate addMagazineCargoGlobal [selectRandom _ammo,1];
			};
		};
		if (_item isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) then {_crate addBackpackCargoGlobal [_item,_quant]; _isBackpack = true;};
		if (isClass(configFile >> "CfgMagazines" >> _item)) then {_crate addMagazineCargoGlobal [_item,_quant]; _isMagazine = true;};
		if (!_isWeapon && !_isMagazine && _isBackpack && isClass(configFile >> "CfgVehicles" >> _item)) then {_crate addItemCargoGlobal [_item,_quant]};
	};
