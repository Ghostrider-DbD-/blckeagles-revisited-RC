/*
	AI Mission for Epoch Mod for Arma 3
	For the Mission System originally coded by blckeagls
	By Ghostrider
	Functions and global variables used by the mission system.
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include"\q\addons\custom_server\Configs\blck_defines.hpp";

if (blck_debugOn) then {diag_log "[blckeagls] loading variables"};

blck_minFPS = 8; 

// radius within whih missions are triggered. The trigger causes the crate and AI to spawn.
#ifdef blck_milServer
blck_TriggerDistance = 1500;
#else
blck_TriggerDistance = 1500;
#endif

////////////////////////////////////////////////
//  Do Not Touch Anything Below This Line
///////////////////////////////////////////////

blck_townLocations = []; //nearestLocations [blck_mapCenter, ["NameCity","NameCityCapital"], 30000];
blck_ActiveMissionCoords = [];
blck_recentMissionCoords = [];
blck_monitoredVehicles = [];
blck_livemissionai = [];
blck_monitoredMissionAIGroups = [];  //  Used to track groups in active missions for whatever purpose
blck_oldMissionObjects = [];
blck_hiddenTerrainObjects = [];
blck_pendingMissions = [];
blck_missionsRunning = 0;
blck_missionsRun = 0;
blck_activeMissions = [];
blck_connectedHCs = [];
blck_missionMarkerRootName = "blckeagls_marker";
DMS_missionMarkerRootName = "DMS_MissionMarker";
blck_missionLabelMarkers = [];
blck_temporaryMarkers = [];
blck_illuminatedCrates = []; // [crate,duration,freq of replacement]
blck_mainThreadUpdateInterval = 60;
blck_revealMode = "detailed"; //""basic" /*group or vehicle level reveals*/,detailed /*unit by unit reveals*/";
blck_dynamicMissionsSpawned = 0;
blck_spawnerMode = 1;
blck_missionData = [];
blck_activeMissionsList = [];
blck_initializedMissionsList = [];
blck_blackListedLocations = []; // [ [marker, time]]
blck_activeMonitorThreads = 0;
blck_validEndStates = ["allUnitsKilled", "playerNear", "allKilledOrPlayerNear","assetSecured"];
blck_validLootSpawnTimings = ["atMissionSpawnGround","atMissionSpawnAir","atMissionEndGround","atMissionEndAir"];
blck_validLootLoadTimings = ["atMissionCompletion", "atMissionSpawn"];

if (blck_debugOn) then {diag_log "[blckeagls] Variables Loaded"};

