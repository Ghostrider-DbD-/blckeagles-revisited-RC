/*
	GMS_fnc_time.sqf
	by Ghostrider-GRG-

	Credits to AWOL, A3W, LouD and Creampie for insights.

*/

/*
	blck_timeAcceleration = true; // When true, time acceleration will be periodically updated based on amount of daylight at that time according to the values below 
								  // which can be set using the corresponding variables in the config file for that mod.
	
	blck_timeAccelerationDay = 1;  // Daytime time accelearation
	blck_timeAccelerationDusk = 3; // Dawn/dusk time accelearation
	blck_timeAccelerationNight = 6;  // Nighttim time acceleration
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_arr","_sunrise","_sunset","_time"];
_arr = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _arr select 0;
_sunset = _arr select 1;
_time = dayTime;

// Night
if (_time > (_sunset + 0.5) || _time < (_sunrise - 0.5)) exitWith {
	setTimeMultiplier blck_timeAccelerationNight; 
};

// Day
if (_time > (_sunrise + 0.5) && _time < (_sunset - 0.5)) exitWith {
	setTimeMultiplier blck_timeAccelerationDay; 	
};

// default
setTimeMultiplier blck_timeAccelerationDusk; 



