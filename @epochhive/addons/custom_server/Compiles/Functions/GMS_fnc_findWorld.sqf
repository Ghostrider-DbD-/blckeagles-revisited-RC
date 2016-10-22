/*
	Determine the map name, set the map center and size, and return the map name.
	Trader coordinates were pulled from the config.cfg
	Inspired by the Vampire and DZMS
	Last Modified 9/3/16
*/
private["_blck_WorldName"];

_blck_WorldName = toLower format ["%1", worldName];
_blck_worldSize = worldSize;
private["_modType"];
_modType = [] call blck_getModType;

diag_log format["[blckeagls] Loading Map-specific settings with worldName = %1 and modType = %2",_blck_WorldName,_modType];

if (_modType isEqualTo "Epoch") then
{
	switch (_blck_WorldName) do {// These may need some adjustment - including a test for shore or water should help as well to avoid missions spawning on water.
	case "altis":{
		diag_log "Altis-specific settings for Epoch loaded";
		blck_mapCenter = [6322,7801,0]; 
		blck_mapRange = 21000; 
		if (blck_blacklistSpawns) then {
			diag_log "Spawn black list locations added for Altis";
			blck_locationBlackList = blck_locationBlackList + [
				[[14939,15083,0],1000],  // trader
				[[23600, 18000,0],1000],  // trader
				[[23600,18000,0],1000],  // trader
				[[10800,10641,0],1000]  // isthmus
			];
		};
	}; // Add Central, East and West respawns/traders 
	case "taviana":{blck_mapCenter = [10370, 11510, 0];blck_mapRange = 14400;};
	case "namalsk":{blck_mapCenter = [4352, 7348, 0];blck_mapRange = 10000;};
	case "napf": {blck_mapCenter = [10240,10240,0]; blck_mapRange = 14000};  // {_centerPos = [10240, 10240, 0];_isMountainous = true;_maxHeight = 50;};
	case "australia": {
		blck_mapCenter = [20480,20480, 150];blck_mapRange = 40960;
		if (blck_blacklistSpawns) then {
		blck_locationBlackList = blck_locationBlackList + [ [[24398.3, 13971.6,0],800],[[34751.5, 13431.9,0],800],[[19032.7, 33974.6, 0],800],[[4056.35, 19435.9, 0],800] ];
		diag_log "Spawn black list locations added for Australia";
		};
	};  //
	default {blck_mapCenter = [ (_blck_worldSize/2),(_blck_worldSize/2),0],blck_mapRange = _blck_worldSize;};
	};
};

if (_modType isEqualTo "Exile") then
{
	switch (_blck_WorldName) do {// These may need some adjustment - including a test for shore or water should help as well to avoid missions spawning on water.
	case "altis":{
		//diag_log "Altis-specific settings loaded";
		blck_mapCenter = [6322,7801,0]; 
		blck_mapRange = 21000; 
		if (blck_blacklistSpawns) then {
			diag_log "Spawn black list locations added for Altis";
			blck_locationBlackList = blck_locationBlackList + [
				[[14939,15083,0],1000],  // trader
				[[23600, 18000,0],1000],  // trader
				[[23600,18000,0],1000],  // trader
				[[10800,10641,0],1000]  // isthmus
			];
		};
	}; // Add Central, East and West respawns/traders 
	case "taviana":{blck_mapCenter = [10370, 11510, 0];blck_mapRange = 14400;};
	case "namalsk":{blck_mapCenter = [4352, 7348, 0];blck_mapRange = 10000;};
	case "napf": {blck_mapCenter = [10240,10240,0]; blck_mapRange = 14000};  // {_centerPos = [10240, 10240, 0];_isMountainous = true;_maxHeight = 50;};
	case "tanoa": {
			blck_mapCenter = [ (_blck_worldSize/2),(_blck_worldSize/2),0];
			blck_mapRange = _blck_worldSize;	 
			blck_locationBlackList = blck_locationBlackList + [
				[[2901,12333,0],1000],  // trader
				[[23600, 18000,0],1000],  // trader
				[[23600,18000,0],1000],  // trader
				[[10800,10641,0],1000]  // isthmus
			];//  {.51, 0, .8}
	};
	default {blck_mapCenter = [ (_blck_worldSize/2),(_blck_worldSize/2),0],blck_mapRange = _blck_worldSize;};

	};
};

blck_townLocations = []; //nearestLocations [blck_mapCenter, ["NameCity","NameCityCapital"], 30000];

blck_WorldName = _blck_WorldName;
blck_worldSet = true;
