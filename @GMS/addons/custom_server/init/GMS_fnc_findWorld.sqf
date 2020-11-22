/*
	Determine the map name, set the map center and size, and return the map name.
	Trader coordinates were pulled from the config.cfg
	Inspired by the Vampire and DZMS
	Last Modified 9/3/16
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/


	Notes: 
	Setting blck_maxSeaSearchDistance = 0; 
	Prevents these missions from being spawned.
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

diag_log format["[blckeagls] Loading Map-specific settings with worldName = %1",worldName];
switch (toLower worldName) do 
{// These may need some adjustment - including a test for shore or water should help as well to avoid missions spawning on water.
		case "altis":{blck_mapCenter = [12000,10000,0]; blck_mapRange = 25000; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = 20000;};
		case "stratis":{blck_mapCenter = [3900,4500,0]; blck_mapRange = 4500; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = 5000;}; 
		case "tanoa":{blck_mapCenter = [9000,9000,0];  blck_mapRange = 10000; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = 10000;};
		case "malden":{	blck_mapCenter = [6000,7000,0];	blck_mapRange = 6000; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = 5500;};		
		case "enoch":{blck_mapCenter = [6500,6000,0];  blck_mapRange = 5800; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = 20000;};
		case "gm_weferlingen_summer":{blck_mapCenter = [10000,10000,0];	blck_mapRange = 10000; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = 0};
		case "gm_weferlingen_winter":{blck_mapCenter = [10000,10000,0];	blck_mapRange = 10000; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = 0;};
		case "chernarus":{blck_mapCenter = [7100, 7750, 0]; blck_mapRange = 5300; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = 6000;};	
		case "namalsk":{blck_mapCenter = [5700, 8700, 0]; blck_mapRange = 10000; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = 5000;};		
		case "chernarus_summer":{blck_mapCenter = [7100, 7750, 0]; blck_mapRange = 6000; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = 6000;}; 
		case "chernarus_winter":{blck_mapCenter = [7100, 7750, 0]; blck_mapRange = 6000; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = 6000;}; 
		case "cup_chernarus_a3":{blck_mapCenter = [7100, 7750, 0]; blck_mapRange = 6000; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = 6000;};
		case "bornholm":{blck_mapCenter = [11240, 11292, 0];blck_mapRange = 14400; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = blck_mapRange;};
		case "esseker":{blck_mapCenter = [6049.26,6239.63,0]; blck_mapRange = 6000; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = 0;};
		case "taviana":{blck_mapCenter = [10370, 11510, 0];blck_mapRange = 14400; blck_maxGradient = 0.20; blck_maxSeaSearchDistance = blck_mapRange;};
		case "napf": {blck_mapCenter = [10240,10240,0]; blck_mapRange = 14000; blck_maxGradient = 0.30; blck_maxSeaSearchDistance = 12000;};  
		case "australia": {blck_mapCenter = [20480,20480, 150];blck_mapRange = 40960; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = blck_mapRange;};
		case "panthera3":{blck_mapCenter = [4400, 4400, 0];blck_mapRange = 4400; blck_maxGradient = 0.40;blck_maxSeaSearchDistance = blck_mapRange;};
		case "isladuala":{blck_mapCenter = [4400, 4400, 0];blck_mapRange = 4400; blck_maxGradient = 0.40;blck_maxSeaSearchDistance = blck_mapRange;};
		case "sauerland":{blck_mapCenter = [12800, 12800, 0];blck_mapRange = 12800; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = 0;};
		case "trinity":{blck_mapCenter = [6400, 6400, 0];blck_mapRange = 6400; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = blck_mapRange;};
		case "utes":{blck_mapCenter = [3500, 3500, 0];blck_mapRange = 3500; blck_maxGradient = 0.20;};
		case "zargabad":{blck_mapCenter = [4096, 4096, 0];blck_mapRange = 4096; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = 0;};
		case "fallujah":{blck_mapCenter = [3500, 3500, 0];blck_mapRange = 3500; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = 0;};
		case "tavi":{blck_mapCenter = [10370, 11510, 0];blck_mapRange = 14090; blck_maxGradient = 0.40; blck_maxSeaSearchDistance = 12000;};
		case "lingor":{blck_mapCenter = [4400, 4400, 0];blck_mapRange = 4400; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = blck_mapRange;};	
		case "takistan":{blck_mapCenter = [5500, 6500, 0];blck_mapRange = 5000; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = 0;};
		case "lythium":{blck_mapCenter = [10000,10000,0];blck_mapRange = 8500; blck_maxGradient = 0.30; blck_maxSeaSearchDistance = 0;};
		case "vt7": {blck_mapCenter = [9000,9000,0]; blck_mapRange = 9000; blck_maxGradient = 0.20;};		
		case "rof_mok": {
			blck_mapCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"); 
			blck_mapRange = worldsize /2;
			blck_maxGradient = 0.40;		
			blck_maxSeaSearchDistance =  worldsize / 2;
			[format["worldName / center / worldsize / and range set for %1 / %2 / %3",worldName,blck_mapCenter,worldSize,blck_mapRange]] call blck_fnc_log;
		};
		default {blck_mapCenter = [6322,7801,0]; blck_mapRange = 6000; blck_maxGradient = 0.20;blck_maxSeaSearchDistance = blck_mapRange;};
};
