/*

	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";
private ["_missionListBlue","_missionListRed","_missionListGreen","_missionListOrange"];
private _pathBlue = "Blue";
if (blck_debugOn) then 
{
	_missionListBlue = ["Toxin"];
} else {
	_missionListBlue = [
		"default",
		"hostage1",
		"captive1",
		"medicalCamp",
		"redCamp",
		"resupplyCamp",
		"derbunker",  // OK
		"forgotten_HQ",  // OK
		"IDAP",	// OK
		"Service_point",  //  OK
		"Toxin"  // OK
	];
};

private _pathRed = "Red";
if (blck_debugOn) then {
_missionListRed = ["tko_camp"];
} else {
	_missionListRed = [
		"default",
		"redCamp",
		"medicalCamp",
		"resupplyCamp",
		"carThieves",
		"Ammunition_depot",   // OK
		"Camp_Moreell",   // OK
		"dashq",  //  OK
		"derbunker",  //  OK
		"factory",  //  OK
		"lager",  // OK
		"Operations_Command", // OK
		"Outpost",  // OK
		"tko_camp"  //  OK
	];
};

 
private _pathGreen = "Green";
if (blck_debugOn) then 
{
	_missionListGreen = ["Operations_Command"];
} else {
	_missionListGreen = [
		"default",
		"medicalCamp",
		"redCamp",
		"resupplyCamp",
		"Camp_Moreell",   // OK
		"charlston",   // OK
		"dashq",		// OK
		"derbunker",  //  OK
		"factory",  //  OK
		"fortification",  //  OK
		"lager",  //  OK
		"munitionsResearch",  // OK
		"Operations_Command",  // OK
		"tko_camp"  //  OK
	];
};

private _pathOrange = "Orange";
if (blck_debugOn) then 
{
	_missionListOrange = ["dashq"];
} else {
	_missionListOrange = [
		"default",
		"medicalCamp",
		"redCamp",
		"resupplyCamp",
		"Ammunition_depot",  // OK
		"Camp_Moreell",  //  OK
		"dashq",  //  OK
		"derbunker",  // OK
		"lager",  // OK 
		"Operations_Command",
		"Outpost",  //  OK
		"tko_camp"  //  OK
	];
};

private _pathUMS = "UMS\dynamicMissions";
private _missionListUMS = ["default"];
