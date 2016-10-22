/*
	AI Mission for Epoch Mod for Arma 3
	For the Mission System originally coded by blckeagls
	By Ghostrider
	Functions and global variables used by the mission system.
	Last modified 10/17/16
*/
//blck_variablesLoaded = false;
blck_debugON = true;
blck_minFPS = 13;

//Minimum distance for between missions
MinDistanceFromMission = 1500;

////////////////////////////////////////////////
//  Do Not Touch Anything Below This Line
///////////////////////////////////////////////

blck_ActiveMissionCoords = [];
blck_recentMissionCoords = [];
//blck_emplacedWeapons = [];
blck_monitoredVehicles = [];
blck_liveMissionAI = [];
blck_oldMissionObjects = [];
blck_pendingMissions = [];
blck_activeMissions = [];
blck_deadAI = [];

// Arrays for use during cleanup of alive AI at some time after the end of a mission
DBD_HeliCrashSites = [];

// radius within whih missions are triggered. The trigger causes the crate and AI to spawn.
blck_TriggerDistance = 1000;
blck_mainThreadUpdateInterval = 60;
blck_missionSpawning = false;

diag_log "[blckeagls] Variables Loaded";
blck_variablesLoaded = true;
