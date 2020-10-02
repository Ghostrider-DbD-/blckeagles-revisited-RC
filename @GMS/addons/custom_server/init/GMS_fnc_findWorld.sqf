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
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

diag_log format["[blckeagls] Loading Map-specific settings with worldName = %1",worldName];
switch (toLower worldName) do 
{// These may need some adjustment - including a test for shore or water should help as well to avoid missions spawning on water.
		case "altis":{blck_mapCenter = [12000,10000,0]; blck_mapRange = 25000;};
		case "stratis":{blck_mapCenter = [3900,4500,0]; blck_mapRange = 4500;}; 
		case "tanoa":{blck_mapCenter = [9000,9000,0];  blck_mapRange = 10000;};
		case "malden":{	blck_mapCenter = [6000,7000,0];	blck_mapRange = 6000;};		
		case "enoch":{blck_mapCenter = [6500,6000,0];  blck_mapRange = 5800;};
		case "gm_weferlingen_summer":{blck_mapCenter = [10000,10000,0];	blck_mapRange = 10000;};
		case "gm_weferlingen_winter":{blck_mapCenter = [10000,10000,0];	blck_mapRange = 10000;};
		case "chernarus":{blck_mapCenter = [7100, 7750, 0]; blck_mapRange = 5300;};	
		case "namalsk":{blck_mapCenter = [5700, 8700, 0]; blck_mapRange = 10000;};		
		case "chernarus_summer":{blck_mapCenter = [7100, 7750, 0]; blck_mapRange = 6000;}; 
		case "chernarus_winter":{blck_mapCenter = [7100, 7750, 0]; blck_mapRange = 6000;}; 
		case "cup_chernarus_a3":{blck_mapCenter = [7100, 7750, 0]; blck_mapRange = 6000;};
		case "bornholm":{blck_mapCenter = [11240, 11292, 0];blck_mapRange = 14400;};
		case "esseker":{blck_mapCenter = [6049.26,6239.63,0]; blck_mapRange = 6000;};
		case "taviana":{blck_mapCenter = [10370, 11510, 0];blck_mapRange = 14400;};
		case "napf": {blck_mapCenter = [10240,10240,0]; blck_mapRange = 14000;};  
		case "australia": {blck_mapCenter = [20480,20480, 150];blck_mapRange = 40960;};
		case "panthera3":{blck_mapCenter = [4400, 4400, 0];blck_mapRange = 4400;};
		case "isladuala":{blck_mapCenter = [4400, 4400, 0];blck_mapRange = 4400;};
		case "sauerland":{blck_mapCenter = [12800, 12800, 0];blck_mapRange = 12800;};
		case "trinity":{blck_mapCenter = [6400, 6400, 0];blck_mapRange = 6400;};
		case "utes":{blck_mapCenter = [3500, 3500, 0];blck_mapRange = 3500;};
		case "zargabad":{blck_mapCenter = [4096, 4096, 0];blck_mapRange = 4096;};
		case "fallujah":{blck_mapCenter = [3500, 3500, 0];blck_mapRange = 3500;};
		case "tavi":{blck_mapCenter = [10370, 11510, 0];blck_mapRange = 14090;};
		case "lingor":{blck_mapCenter = [4400, 4400, 0];blck_mapRange = 4400;};	
		case "takistan":{blck_mapCenter = [5500, 6500, 0];blck_mapRange = 5000;};
		case "lythium":{blck_mapCenter = [10000,10000,0];blck_mapRange = 8500;};
		case "vt7": {blck_mapCenter = [9000,9000,0]; blck_mapRange = 9000};		
		default {blck_mapCenter = [6322,7801,0]; blck_mapRange = 6000};
};
