/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_object"];

switch (true) do 
{
	case ((typeOf _object) isKindOf "ThingX" && blck_displayLootMarkerOn): {
		if !(_object getVariable["lootVehicle",""] isEqualTo "")  then 
		{
			[_object] call blck3DEN_fnc_createLootMarker;
			[_object] call blck3DEN_fnc_setEventHandlers;
		};
	};
	case ((typeOf _object) isKindOf "House" && blck_displayGarrisonMarkerOn): {
		if !(_object getVariable["garrisoned",""] isEqualTo "") then 
		{
			[_object] call blck3DEN_fnc_createGarrisonMarker;
			[_object] call blck3DEN_fnc_setEventHandlers;
		};
	};
};


