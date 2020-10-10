/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-

	Parts of config.cpp were derived from the Exile_3EDEN editor plugin 
	* and is licensed as follows:
	* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
	* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
#include "defines.h"
class CfgBlck3DEN 
{
	class configs 
	{
		objectAtMissionCenter = "RoadCone_L_F";
		minAI = 3;
		maxAI = 6;
		minPatroRadius = 30;
		maxPatrolRadius = 45;
		maxVehiclePatrolRadius = 75;
		aircraftPatrolRadius = 1000;
		oddsOfGarison = 0.67;
		maxGarrisonStatics = 3;
		typesGarrisonStatics = [];
		defaultMissionDifficulty = "Blue";
		defaultLootcrateSpawnTiming = "atMissionSpawnGround";
		defaultLootcrateLoadTiming = "atMissionSpawn";
		defaultMissionEndState = "allKilledOrPlayerNear";

		// Enter the string shown here under Atributes\Variable Name
		// to demarcate this vehicle as a loot vehicle
		lootVehicleVariableName = "lootVehicle";

		// Enter the string shown here under Atributes\Variable Name
		// To indicate that a garrison should be placed at standard Arma
		// building positions
		buildingPosGarrisonVariableName = "pos";

		// Enter the string shown here under Atributes\Variable Name
		// To indicate that a garrison should be placed using setPosATL
		// relative to the spawn position of the building
		buildingATLGarrisionVariableName = "atl";

		aiRespawnTime = 600;  // respawn time for infantry 
		vehicleRespawnTime = 900; // respawn time for vehicle patrols
		aircraftRespawnTime = 1200;	// respawn time for aircraft patrols
	};

	/****************************************
		DO NOT TOUCH ANYTHING BELOW THIS LINE 
	*****************************************/
	class CfgVersion 
	{
		version = 1.0;
		build = 8;
		date = "10/05/20";
	};
};

