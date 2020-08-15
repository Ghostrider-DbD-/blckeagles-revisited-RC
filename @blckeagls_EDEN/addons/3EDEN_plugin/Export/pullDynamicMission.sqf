

diag_log "==========  <START>  ==========================";

private _markers = all3DENEntities select 5;

///////////////////
// Define some values for our AI 
// Change values of these variables to suit your needs
///////////////////
#define aiDifficulty "Red"
#define minAI 3
#define maxAI 6
#define minPatrolRadius 30
#define maxPatrolRadius 45
#define AI_respawnTime 600
#define aiVehiclePatrolRadius 75
#define vehiclePatrolRespawnTime 600
#define staticWeaponRespawnTime 600
#define aiAircraftPatrolRespawnTime 600
#define aiAircraftPatrolRadius 1700
#define oddsOfGarrison 0.67
#define maxGarrisonStatics 3
#define maxGarrisonUnits 4
#define typesGarrisonStatics []  //  When empty a static will be randomly chosen from the defaults for blckeagls
#define garrisonMarkerObject "Sign_Sphere100cm_F"  //  This can be anything you like. I find this large sphere easy to see and convenient.
#define unitMarkerObject "Sign_Arrow_Direction_Green_F"  //  This can be anything. I chose this arrow type because it allows you to easily indicate direction. 
#define objectAtMissionCenter "RoadCone_L_F"
#define lootVehicleMarker "Sign_Arrow_F"
#define landVehicles "LandVehicle"

///////////////////
//  Define the coordinates of the center of the mission.
///////////////////
if (isNil "CENTER") then
{
	CENTER = [0,0,0];
};
if (CENTER isEqualTo [0,0,0]) then 
{
	hint "Please define a center point for your mission";
	_obj = allMissionObjects objectAtMissionCenter;
	_obj1 = _obj select 0;	
	diag_log format["Determining position of first roadcone found which is located at %1 with player found at %2",getPos _obj1,position Player];
	if (count _obj > 0) then
	{
		CENTER = [3,3,0] vectorAdd (getPosATL _obj1);
	};
	hint format["Position of Road Cone at %1 used to define mission center",CENTER];
	diag_log format["Position of Road Cone at %1 used to define mission center",CENTER];	
	diag_log format["Player located at position %1",position player];
};
diag_log format["CENTER Set to %1",CENTER];

///////////////////
// Identify any buildings in which a garrison should be spawned using the Arma building positions.
// Tell the script which buildings to garrison by placing an object inside that designates them as such.
// I use a large yellow sphere for this purpose.
// The function below assembles a list of such buildings for use in defining the data for mission buildings.
///////////////////

_cb = "";

//////////////////
//    ***   OPTIONAL  ****
//    Place a marker over your mission and configure it as you would like to to appear in the tame.
//    The marker configuration will be included in the output of this script.
//    Note **  Only the first marker placed will be processed  ** 
// 	  Configure Marker
/////////////////

diag_log format["<<  ----  pullDynamicMision: START  %1  ----  >>",diag_tickTime];

////////////////////////
//   Begin pulling data here
///////////////////////

_cb = _cb + format["blck_garrisonedBuildings_BuildingPosnSystem = [",endl];

_helpers = allMissionObjects garrisonMarkerObject; 
//diag_log format["_helpers = %1",_helpers];
{
	if ( (typeOf _x) isEqualTo garrisonMarkerObject) then
	{
		private _isInside = [_x] call _fn_isInside;
		if (_isInside) then
		{
			_building = [_x] call _fn_buildingContainer;
			blck_garrisonedBuildings pushbackunique _building;
			blck_garrisonedBuildings pushbackunique _x;			
			//  data structure ["building Classname",[/*building pos*/],/*building dir*/,/*odds of garrison*/, /*Max Statics*/,/*types statics*/,/*max units*/],
														// 1				2								3			4	  5			6			7					8						9
			_line = format['     ["%1",%2,%3,%4,%5,%6,%7,%8,%9]',typeOf _building,(getPosATL _building) vectorDiff CENTER,getDir _building, 'true','true',oddsOfGarrison,maxGarrisonStatics,typesGarrisonStatics,maxGarrisonUnits];
			systemChat _line;
			//diag_log _line;
			if (_forEachIndex == 0) then
			{
				_cb = _cb + format["%1%2",endl,_line];
			} else {
				_cb = _cb + format[",%1%2",endl,_line];
			};			
		};
	};
} forEach _helpers;
_cb = _cb + format["%1];%1%1",endl];

_logging = format["blck_garrisonedBuildings = %1",blck_garrisonedBuildings];
diag_log _logging;
systemChat _logging;
//diag_log format["_cb = %1%2",endl,_cb];


/*
	This bit will set up the garrison for each building having units and / or statics inside it or on top.
	Coding must ensure that nothing is repeated but everything is captured.
*/

_fn_configureGarrisonForBuildingATL = {
	private["_b","_staticsInBuilding","_unitsInBuilding","_staticsText","_unitsText","_buildingGarrisonATL","_staticsInBuilding","_unitsInBuilding","_count"];
	_b = _this select 0;
	_count = 0;
	if (_b in blck_garrisonedBuildings) exitWith {""};
	_staticsText = "";
	_unitsText = "";
	_buildingGarrisonATL = "";
	_staticsInBuilding = nearestObjects[getPosATL _building,["StaticWeapon"],sizeOf (typeOf _building)];
	{
		if !(_x in _configuredStatics) then
		{
			_isInside = [_x] call _fn_isInside;
			if (_isInside) then {_building = [_x] call _fn_buildingContainer};
			if (_b isEqualTo _building) then
			{
				_configuredStatics pushBackUnique _x;
				//_configuredStaticsPositions pushBack  (getPosATL _x) vectorDiff CENTER;
				if (_staticsText isEqualTo "") then
				{
					_staticsText = format['["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff (getPosATL _b),getDir _x];
				} else {
					_staticsText = _staticsText + format[',["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff (getPosATL _b),getDir _x];
				};
			};
		};
	} forEach _staticsInBuilding;
	_unitsInBuilding = nearestObjects[getPosATL _building,[unitMarkerObject],sizeOf (typeOf _building)];

	{
		if !(_x in _configuredUnits) then
		{
			_isInside = [_x] call _fn_isInside;
			if (_isInside) then {_building = [_x] call _fn_buildingContainer};
			if (_b isEqualTo _building) then
			{
				_configuredUnits pushBackUnique _x;
				
				if (_unitsText isEqualTo "") then
				{
					_unitsText = format["[%1,%2]",(getPosATL _x) vectorDiff (getPosATL _b),getDir _x];
				} else {
					_unitsText = _unitsText + format[",[%1,%2]",(getPosATL _x) vectorDiff (getPosATL _b),getDir _x];
				};
				_count = _count + 1;
			};
		};
	} forEach _unitsInBuilding;	
	if ( !(_staticsText isEqualTo "") || !(_unitsText isEqualTo "")) then
	{
		_buildingGarrisonATL = format['     ["%1",%2,%3,%4,%5,[%6],[%7]]',typeOf _b,(getPosATL _b) vectorDiff CENTER,getDir _b,'true','true',_staticsText,_unitsText];
		blck_garrisonedBuildings pushBackUnique _b;
	};
	_buildingGarrisonATL
};

private _count = 0;
_cb = _cb + "_garrisonedBuilding_ATLsystem = [";
{
	private _isInside = [_x] call _fn_isInside;
	if (_isInside) then
	{
		private _building = [_x] call _fn_buildingContainer;
		private _include = if ( !(_building in blck_garrisonedBuildings) && !((typeOf _building) isEqualTo unitMarkerObject) && !((typeOf _building) isEqualTo garrisonMarkerObject)) then {true} else {false};
		if (_include) then
		{
			//diag_log format["_x = %1 | _building = %1",_x,_building];
			private _buildingGarrisonInformation = [_building] call _fn_configureGarrisonForBuildingATL;
			diag_log format["_buildingGarrisonInformation = %1",_buildingGarrisonInformation];
			if !(_buildingGarrisonInformation isEqualTo "") then
			{
				if (_count == 0) then
				{
					_cb = _cb + format["%1%2",endl,_buildingGarrisonInformation];
				} else {
					_cb = _cb + format[",%1%2",endl,_buildingGarrisonInformation];
				};
				_count = _count + 1;
			};
		};
	};
		
} forEach ((allMissionObjects "StaticWeapon") + (allMissionObjects "Man") + (allMissionObjects unitMarkerObject));
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// Configure info remaining mission landscape
///////////////////
_land = allMissionObjects "Static";
_count = 0;
_cb = _cb + format["_missionLandscape = [",endl];
{
	diag_log format["evaluating mission landscape: _x = %1 | typeOf _x = %1",_x, typeOf _x];
	//diag_log format["evaluating mission landscape: _x %1 | typeOf _x %1",_x, _x isKindOf "Helper_Base_F"];
	if !(_x in blck_garrisonedBuildings && !((typeOf _x) isEqualTo unitMarkerObject) && !((typeOf _x) isEqualTo garrisonMarkerObject)) then
	{
		_line = format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x, 'true','true'];
		systemChat _line;
		if (_count == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};	
		_count = _count + 1;
	};
}forEach allMissionObjects "Static";
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// Configure loot boxes
///////////////////
_cb = _cb + "_missionLootBoxes = [";
{
	_line = format['     ["%1",%2,%3,%4,%5]',typeOf _x,(getPosATL _x) vectorDiff CENTER, '_crateLoot','_lootCounts',getDir _x];
	systemChat _line;
	if (_forEachIndex == 0) then
	{
		_cb = _cb + format["%1%2",endl,_line];
	} else {
		_cb = _cb + format[",%1%2",endl,_line];
	};	
}forEach ((allMissionObjects "ReammoBox") + (allMissionObjects "ReammoBox_F"));
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// Setup Info for loot vehicles
///////////////////
_missionLootVehicles = [];
_missionVehicles = ((allMissionObjects "Car") + (allMissionObjects "Tank") + allMissionObjects "Ship");
_lootVehicleMarkers = allMissionObjects lootVehicleMarker;
diag_log format["_lootVehicleMarkers = %1",_lootVehicleMarkers];
_cb = _cb + format["_missionLootVehicles = ["];
{
	_kindOf = "nothing";
	_isInside = [_x,"Car"] call _fn_isInside;
	if (_isInside) then {_kindOf = "Car"};
	if !(_isInside) then {_isInside = [_x,"Ship"] call _fn_isInside};
	if (_isInside) then {_kindOf = "Ship"};
	if (_isInside) then
	{

		_object = [_x,_kindOf] call _fn_buildingContainer;
		diag_log format["object %1 is inside object %2",_x,_object];
		_missionLootVehicles pushBack _object;
		_line = format['     ["%1",%2,%3,%4,%5]',typeOf _object,(getPosATL _x) vectorDiff CENTER, '_crateLoot','_lootCounts',getDir _x];
		systemChat _line;
		if (_forEachIndex == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};	
	};		
} forEach allMissionObjects lootVehicleMarker;
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// Setup Info for vehicle patrols
///////////////////
_cb = _cb + format["_missionPatrolVehicles = ["];
{
	if ( !((typeOf _x) isKindOf "SDV_01_base_F") && !(_x in _missionLootVehicles) ) then
	{
		_line = format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x];
		systemChat _line;
		if (_forEachIndex == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};	
	};
}forEach ((allMissionObjects "Car") + (allMissionObjects "Tank") + allMissionObjects "Ship");
_cb = _cb + format["%1];%1%1",endl];

_cb = _cb + "_submarinePatrolParameters = [";
{
	if ((typeOf _x) isKindOf "SDV_01_base_F") then
	{
		_line = format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x];
		systemChat _line;
		if (_forEachIndex == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};
	};
}forEach allMissionObjects "Ship";
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// Configs for Air Patrols
///////////////////
_cb = _cb + "_airPatrols = [";
	//[selectRandom _aircraftTypes,[22830.2,16618.1,11.4549],"blue",1000,60]
{
	_line = format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x, 'true','true'];
	systemChat _line;
	if (_forEachIndex == 0) then
	{
		_cb = _cb + format["%1%2",endl,_line];
	} else {
		_cb = _cb + format[",%1%2",endl,_line];
	};		
}forEach allMissionObjects "Air";
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// Setup info for remaining static/emplaced weapons
///////////////////
_count = 0;
_cb = _cb + format["_missionEmplacedWeapons = ["];
{
	
	//if !(_x in _configuredStatics) then
	private _isInside = [_x] call _fn_isInside;
	if !(_isInside) then
	{
		// 	["B_HMG_01_high_F",[22883.5,16757.6,6.31652],"blue",0,10]
		_line = format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff CENTER,getDir _x, 'true','true'];	
		systemChat _line;	
		if (_count == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};
		_count = _count + 1;
	};

}forEach allMissionObjects "StaticWeapon";
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// Setup information for infantry groups spawning outside buildings
///////////////////
_cb = _cb + format["_missionGroups = ["];
{
		//[[22920.4,16887.3,3.19144],"red",[1,2], 75,120],
	_isInside = [_x] call _fn_isInside;
	_isInfantry = [_x] call _fn_isInfantry;
	//diag_log format["_missionGroups: _unit %1 | _isInside %2 _isInfantry %3",_x,_isInside,_isInfantry];
	if (_isInfantry) then
	{
		if (!(surfaceIsWater (getPos _x))  && !(_isInside) && !(isPlayer _x)) then
		{
			_line = format['     [%1,%2,%3,"%4",%5,%6]',(getPosATL _x) vectorDiff CENTER,minAI,maxAI,aiDifficulty,minPatrolRadius,maxPatrolRadius];
			systemChat _line;
			if (_forEachIndex == 0) then
			{
				_cb = _cb + format["%1%2",endl,_line];
			} else {
				_cb = _cb + format[",%1%2",endl,_line];
			};
		};
	};
}forEach allMissionObjects "Man";
_cb = _cb + format["%1];%1%1",endl];

_cb = _cb + "_scubaGroupParameters = [";
{
		//[[22920.4,16887.3,3.19144],"red",[1,2], 75,120],
	_isInside = [_x] call _fn_isInside;
	_isInfantry = [_x] call _fn_isInfantry;
	//diag_log format["_missionGroups: _unit %1 | _isInside %2 _isInfantry %3",_x,_isInside,_isInfantry];
	if (_isInfantry) then
	{
		if ((surfaceIsWater (getPos _x))  && !(_isInside) && !(isPlayer _x)) then
		{
			_line = format['     [%1,%2,%3,"%4",%5,%6]',(getPosATL _x) vectorDiff CENTER,minAI,maxAI,aiDifficulty,minPatrolRadius,maxPatrolRadius];
			systemChat _line;
			if (_forEachIndex == 0) then
			{
				_cb = _cb + format["%1%2",endl,_line];
			} else {
				_cb = _cb + format[",%1%2",endl,_line];
			};
		};
	};
}forEach allMissionObjects "Man";
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// All done, notify the user and copy the output to the clipboard
///////////////////
_msg = "All Objects organzied, formated and copied to the Clipboard";
hint _msg;
systemChat _msg;
systemChat format["_cb has %1 characters",count _cb];
copyToClipboard _cb;
diag_log "DONE";

