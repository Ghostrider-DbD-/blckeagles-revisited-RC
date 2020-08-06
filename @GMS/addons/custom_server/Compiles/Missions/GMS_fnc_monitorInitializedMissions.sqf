/*
	GMS_fnc_monitorInitializedMissions
	by Ghostrider-GRG-
*/

for "_i" from 1 to (count blck_activeMissionsList) do 
{

	if (_i > (count blck_activeMissionsList)) exitWith {};
	
	// Select a mission category (blue, red, green , etd)
	private _el = blck_activeMissionsList deleteAt 0;

	_el params [
		"_missionCategoryDescriptors",  // 0
		"_missionTimeoutAt",			// 1
		"_triggered",					// 2
		"_spawnPara",					// 3
		"_missionData",					// 6
		"_missionParameters"			// 7
	];

	#define noActive 2
	#define waitTime 5
	#define missionData 6

 	_missionCategoryDescriptors params [
		"_difficulty",
		"_noMissions",  // Max no missions of this category
		"_noActive",  // Number active 
		"_tMin", // Used to calculate waittime in the future
		"_tMax", // as above
		"_waitTime",  // time at which a mission should be spawned
		"_missionsData"  // 
	];
				
						//   0       1       2          3         4                    5                6                    7             8
	_missionData params ["_coords","_mines","_objects","_crates","_blck_AllMissionAI","_assetSpawned","_missionAIVehicles","_markers"];

_missionParameters params[
	"_markerName",
	"_markerMissionName",
	"_endMsg",
	"_startMsg",
	"_defaultMissionLocations",	
	"_crateLoot", 				
	"_lootCounts", 				
	"_markerType", 
	"_markerColor", 
	"_markerSize",
	"_markerBrush",	
	"_missionLandscapeMode", 	
	"_garrisonedBuildings_BuildingPosnSystem", 
	"_garrisonedBuilding_ATLsystem",
	"_missionLandscape",
	"_missionLootBoxes",
	"_missionLootVehicles",
	"_missionPatrolVehicles",
	"_submarinePatrolParameters",
	"_airPatrols",
	"_noVehiclePatrols", 
	"_vehicleCrewCount",
	"_missionEmplacedWeapons",
	"_noEmplacedWeapons", 
	"_useMines", 
	"_minNoAI", 
	"_maxNoAI", 
	"_noAIGroups", 		
	"_missionGroups",
	"_scubaGroupParameters",		
	"_hostageConfig",
	"_enemyLeaderConfig",
	"_assetKilledMsg",	
	"_uniforms", 
	"_headgear", 
	"_vests", 
	"_backpacks", 
	"_weaponList",
	"_sideArms", 
	"_chanceHeliPatrol", 
	"_noChoppers", 
	"_missionHelis", 
	"_chancePara", 
	"_noPara", 
	"_paraTriggerDistance",
	"_paraSkill",
	"_chanceLoot", 
	"_paraLoot", 
	"_paraLootCounts",
	"_spawnCratesTiming", 
	"_loadCratesTiming", 
	"_endCondition",
	"_isScubaMission"
];
	
	private _playerInRange = [_coords, blck_TriggerDistance, false] call blck_fnc_playerInRange;
	#define delayTime 1
	private _monitorAction = -2;

	if (_triggered isEqualTo 0) then 
	{
		if (diag_tickTime > _missionTimeoutAt) then 
		{
			_monitorAction = -1;
		} else {
			if (_playerInRange) then {
				_monitorAction = 0;
			} else {
				if (blck_debugLevel >= 3) then {_monitorAction = 0};  //  simulate the mission being tripped by a player
			};
		};
	} else {
		if (_triggered isEqualTo 1) then 
		{
				_monitorAction = 1;
		}; 
	};
	
	switch (_monitorAction) do 
	{
		// Handle Timeout
		case -1:
		{
				[format["_fnc_monitorInitializedMissions: mission timed out: %1",_el]] call blck_fnc_log;
				_missionCategoryDescriptors set[noActive, _noActive - 1];
				[_coords,_mines,_objects,_crates, _blck_AllMissionAI,_endMsg,_markers,markerPos (_markers select 1),_markerName,_markerMissionName,  1] call blck_fnc_endMission;
		}; 			
		
		//  Handle mission waiting to be triggerd and player is within the range to trigger		
		case 0: 
		{
			#define triggered 2
			#define timedOut 1
			_el set[triggered,1];
			_el set[timedOut,diag_tickTime + 240];
			
			private["_temp"];
			if (blck_SmokeAtMissions select 0) then  // spawn a fire and smoke near the crate
			{
				_temp = [_coords,blck_SmokeAtMissions select 1] call blck_fnc_smokeAtCrates;
				if (typeName _temp isEqualTo "ARRAY") then 
				{
					_objects append _temp;
					uiSleep delayTime;
				};
			};
			
			if (_useMines) then
			{
				_mines = [_coords] call blck_fnc_spawnMines;
				uiSleep delayTime;
			};

			if (_missionLandscapeMode isEqualTo "random") then
			{
				_temp = [_coords,_missionLandscape, 3, 15, 2] call blck_fnc_spawnRandomLandscape;
			} else {

				_temp = [_coords, _missionLandscape] call blck_fnc_spawnCompositionObjects;
			};
			_objects append _temp;
			uiSleep delayTime;	

			try {
				_temp = [_coords, _minNoAI,_maxNoAI,_noAIGroups,_missionGroups,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call blck_fnc_spawnMissionAI;
				_temp params["_ai","_abort"];
				if (_abort) throw 1;
				_blck_AllMissionAI append (_ai);
				uiSleep delayTime;		

				if !(_hostageConfig isEqualTo []) then
				{
					_temp = [_coords,_hostageConfig] call blck_fnc_spawnHostage;
					if (_temp isEqualTo grpNull) then {throw 1} else 
					{
						_assetSpawned = _temp select 0;
						_missionData set[5,_assetSpawned];
						_objects pushBack (_temp select 1);
						_blck_AllMissionAI pushBack _assetSpawned;
					};
				};

				if !(_enemyLeaderConfig isEqualTo []) then
				{
					private _temp = [_coords,_enemyLeaderConfig] call blck_fnc_spawnLeader;
					if (_temp isEqualTo grpNull) then {throw 1} else 
					{
						_assetSpawned = _temp select 0;
						_missiondata set[5,_assetSpawned];
						_objects pushBack (_temp select 1);	
						_blck_AllMissionAI pushBack _assetSpawned;
					};
				};

				private _noChoppers = [_noChoppers] call blck_fnc_getNumberFromRange;
				if (_noChoppers > 0) then
				{
					for "_i" from 1 to (_noChoppers) do
					{
						if (random(1) < _chanceHeliPatrol) then
						{
							_temp = [_coords,_difficulty,_missionHelis,_uniforms,_headGear,_vests,_backpacks,_weaponList, _sideArms,"none"] call blck_fnc_spawnMissionHeli;
							if (typeName _temp isEqualTo "ARRAY") then 
							{
								blck_monitoredVehicles pushBack (_temp select 0);
								_blck_AllMissionAI append (_temp select 1);
							} else {
								if (typeName _temp isEqualTo "GROUP") then 
								{
									if (isNull _temp) throw 1;
								};
							};
						};
					};
				};		
				uisleep 3;

				if (count _garrisonedBuilding_ATLsystem > 0) then  // Note that there is no error checking here for nulGroups
				{
					private _temp = [_coords, _garrisonedBuilding_ATLsystem, _difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call blck_fnc_garrisonBuilding_ATLsystem;
					if (_temp isEqualTo grpNull) then {throw 1} else 
					// TODO: Add error checks for grpNull to the ATLsystem spawner
					{				
						_objects append (_temp select 1);
						blck_monitoredVehicles append (_temp select 2);
						_blck_AllMissionAI append (units (_temp select 0));
					};
				};	
				uiSleep 3;

				if (count _garrisonedBuildings_BuildingPosnSystem > 0) then
				{
					private _temp = [_coords, _garrisonedBuildings_BuildingPosnSystem, _difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call blck_fnc_garrisonBuilding_RelPosSystem;
					if (_temp isEqualTo grpNull) then {throw 1} else 
					// TODO: add error checks for grpNull to the RelPosSystem
					{
						_objects append (_temp select 1);
						blck_monitoredVehicles append (_temp select 2);
						_blck_AllMissionAI append (units (_temp select 0));
					};
				};		
				uiSleep 15;

				private _userelativepos = true;
				private _noEmplacedWeapons = [_noEmplacedWeapons] call blck_fnc_getNumberFromRange;
				if (blck_useStatic && ((_noEmplacedWeapons > 0) || count _missionEmplacedWeapons > 0)) then
				// TODO: add error checks for grpNull to the emplaced weapon spawner
				{

					private _temp = [_coords,_missionEmplacedWeapons,_userelativepos,_noEmplacedWeapons,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call blck_fnc_spawnEmplacedWeaponArray;
					if (_temp isEqualTo grpNull) then {throw 1} else 
					{
						_objects append (_temp select 0);
						_blck_AllMissionAI append (_temp select 1);
					};
				};	
				uisleep 10;

				private _noVehiclePatrols = [_noVehiclePatrols] call blck_fnc_getNumberFromRange;
				if (blck_useVehiclePatrols && ((_noVehiclePatrols > 0) || count _missionPatrolVehicles > 0)) then
				{
					_temp = [_coords,_noVehiclePatrols,_difficulty,_missionPatrolVehicles,_userelativepos,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,false,_vehicleCrewCount] call blck_fnc_spawnMissionVehiclePatrols;
					// TODO: add grpNull checks to missionVehicleSpawner
					if (_temp isEqualTo grpNull) then {throw 1} else 
					{
						_patrolVehicles = _temp select 0;
						_blck_AllMissionAI append (_temp select 1);
					};
				};		
				uiSleep  delayTime;
				if (blck_debugLevel >= 3) then {diag_log format["monitorInitializedMissions:  _spawnCrateTiming = %1 _loadCratesTiming = %2 | _markerMissionName = %3",_spawnCratesTiming,_loadCratesTiming, _markerMissionName]};
				if (blck_debugLevel >= 3) then {diag_log format["monitorInitializedMissions:  _missionLootBoxes = %1",_missionLootBoxes]};
				if (_spawnCratesTiming in ["atMissionSpawnGround","atMissionStartAir"]) then
				{
					if (_missionLootBoxes isEqualTo []) then
					{
						_crates = [_coords,[[selectRandom blck_crateTypes,[1,1,0],_crateLoot,_lootCounts]], _loadCratesTiming, _spawnCratesTiming, "start", _difficulty] call blck_fnc_spawnMissionCrates;
					}
					else
					{
						_crates = [_coords,_missionLootBoxes,_loadCratesTiming, _spawnCratesTiming, "start", _difficulty] call blck_fnc_spawnMissionCrates;						
					};

					if (blck_cleanUpLootChests) then
					{
						_objects append _crates;
					};
				};
				_missionData set[2,_objects];
				_missionData set[3,_crates];				
				
				uiSleep  delayTime;

				if (blck_showCountAliveAI) then
				{
					blck_missionLabelMarkers pushBack [_markers select 1,_markerMissionName,_blck_AllMissionAI];
				};
				
				{
					_x setVariable["crateSpawnPos", (getPos _x)];
				} forEach _crates;			
				private _spawnPara = if (random(1) < _chancePara) then {true} else {false};
				_missionData = [_coords,_mines,_objects,_crates, _blck_AllMissionAI,_assetSpawned,_missionAIVehicles,_markers];

				_el set[missionData, _missionData];

				// Everything spawned withouth serous errors so lets keep the mission active for future monitoring

				blck_activeMissionsList pushBack _el;	
			} 
			
			catch 
			{
				if (_exception isEqualTo 1) then 
				{
					_missionCategoryDescriptors set[noActive, _noActive - 1];				
					[_coords,_mines,_objects,_crates, _blck_AllMissionAI,_endMsg,_markers,markerPos (_markers select 1),_markerName,_markerMissionName,  1] call blck_fnc_endMission;
					["Critial Error returned by one or more critical functions, mission spawning aborted!",'error'] call blck_fnc_log;
				};
			};
		};

		case 1:
		{
			private _missionComplete = -1;
			private ["_secureAsset","_endIfPlayerNear","_endIfAIKilled"];
		
			/*
				"_endCondition",
			*/

			switch (_endCondition) do
			{
				case "playerNear": {_secureAsset = false; _endIfPlayerNear = true;_endIfAIKilled = false;};
				case "allUnitsKilled": {_secureAsset = false; _endIfPlayerNear = false;_endIfAIKilled = true;};
				case "allKilledOrPlayerNear": {_secureAsset = false; _endIfPlayerNear = true;_endIfAIKilled = true;};
				case "assetSecured": {_secureAsset = true; _endIfPlayerNear = false; _endIfAIKilled = false;};
			};

			try {
				private _playerIsNear = [_crates,20,true] call blck_fnc_playerInRangeArray;
				private _minNoAliveForCompletion = (count _blck_AllMissionAI) - (round(blck_killPercentage * (count _blck_AllMissionAI)));			
				private _aiKilled = if (({alive _x} count _blck_AllMissionAI) <= _minNoAliveForCompletion)  then {true} else {false}; // mission complete

				if (_endIfPlayerNear) then
				{
					if (_playerIsNear) throw 1; // mission complete
				};

				if (_endIfAIKilled) then
				{
					if (_aiKilled) throw 1;
				};

				if (_spawnPara) then
				{
					if ([_coords,_paraTriggerDistance,true] call blck_fnc_playerInRange) then
					{
						_spawnPara = false; // The player gets one try to spawn these.
						_el set[3,_spawnPara];
						if (random(1) < _chancePara) then  //  
						{
							private _paratroops = [_coords,_noPara,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call blck_fnc_spawnParaUnits;
							if !(isNull _paratroops) then 
							{
								_blck_AllMissionAI append (units _paratroops);
							};
							if (random(1) < _chanceLoot) then
							{
								private _extraCrates = [_coords,[[selectRandom blck_crateTypes,[0,0,0],_paraLoot,_paraLootCounts]], "atMissionSpawn","atMissionStartAir", "start", _difficulty] call blck_fnc_spawnMissionCrates;
								if (blck_cleanUpLootChests) then
								{
									_objects append _extraCrates;
								};		
							};	
						};
					};
				};

				if (_secureAsset) then
				{		
					if !(alive _assetSpawned) then 
					{
						throw 3;
					} else {
						
						if (({alive _x} count _blck_AllMissionAI) <= (_minNoAliveForCompletion + 1)) then
						{
							if ((_assetSpawned getVariable["blck_unguarded",0]) isEqualTo 0) then 
							{
								_assetSpawned setVariable["blck_unguarded",1,true];
							};
							
							if ((_assetSpawned getVariable["blck_AIState",0]) isEqualTo 1) then 
							{
								_assetSpawned allowdamage false;
								[_assetSpawned] remoteExec["GMS_fnc_clearAllActions",-2, true];
								throw 1;								
							};
						};
					};
				};

				private _moved = false;
				if ((_spawnCratesTiming isEqualTo "atMissionSpawnGround") && blck_crateMoveAllowed) then 
				{
					{
						if ( _x distance (_x getVariable ["crateSpawnPos", (getPos _x)]) > max_distance_crate_moved_uncompleted_mission) throw 2;
					} forEach _crates;
				};

				_missionData = [_coords,_mines,_objects,_crates, _blck_AllMissionAI,_assetSpawned,_missionAIVehicles,_markers];

				_el set[missionData, _missionData];

				// If there were no throws then lets check on the mission in a bit.
				blck_activeMissionsList pushBack _el;	
			}

			catch // catch all conditions that cause the mission to end.
			{
				switch (_exception) do 
				{
					case 1: {  // Normal Mission End
								if (_spawnCratesTiming in ["atMissionEndGround","atMissionEndAir"]) then
								{
									if (!(_secureAsset) || (_secureAsset && (alive _assetSpawned))) then
									{
										if (count _missionLootBoxes > 0) then
										{
											_crates = [_coords,_missionLootBoxes,_loadCratesTiming,_spawnCratesTiming, "end", _difficulty] call blck_fnc_spawnMissionCrates;
										}
										else
										{
											_crates = [_coords,[[selectRandom blck_crateTypes,[0,0,0],_crateLoot,_lootCounts]], _loadCratesTiming,_spawnCratesTiming, "end", _difficulty] call blck_fnc_spawnMissionCrates;
										};
										
										if (blck_cleanUpLootChests) then
										{
											_objects append _crates;
										};
									};
								};	

								if (_spawnCratesTiming isEqualTo "atMissionSpawnGround" && _loadCratesTiming isEqualTo "atMissionCompletion") then
								{
									if (!(_secureAsset) || (_secureAsset && (alive _assetSpawned))) then
									{
										{
											[_x] call blck_fnc_loadMissionCrate;
										} forEach _crates;
									};
								};

								if (_secureAsset && (alive _assetSpawned)) then
								{
									if (_assetSpawned getVariable["assetType",0] isEqualTo 1) then
									{
										_assetSpawned setVariable["GMSAnimations",[""],true];
										[_assetSpawned,""] remoteExec["switchMove",-2];;
										uiSleep 0.1;
										_assetSpawned enableAI "ALL";
										private _newPos = (getPos _assetSpawned) getPos [1000, random(360)];
										(group _assetSpawned) setCurrentWaypoint [group _assetSpawned, 0];
										[group _assetSpawned,0] setWaypointPosition [_newPos,0];
										[group _assetSpawned,0] setWaypointType "MOVE";
									};

									if (_assetSpawned getVariable["assetType",0] isEqualTo 2) then
									{
										[_assetSpawned,""] remoteExec["switchMove",-2];
										_assetSpawned setVariable["GMSAnimations",_assetSpawned getVariable["endAnimation",["AidlPercMstpSnonWnonDnon_AI"]],true];
										[_assetSpawned,selectRandom(_assetSpawned getVariable["endAnimation",["AidlPercMstpSnonWnonDnon_AI"]])] remoteExec["switchMove",-2];
									};
								};
								[_coords,_mines,_objects,_crates,_blck_AllMissionAI,_endMsg,_markers,markerPos (_markers select 1),_markerName,_markerMissionName, _exception] call blck_fnc_endMission;
	
								_waitTime = diag_tickTime + _tMin + random(_tMax - _tMin);
								_missionCategoryDescriptors set [noActive,_noActive - 1];
								_missionCategoryDescriptors set [waitTime,_waitTime];
					};
					case 2: { // Abort, crate moved.
								_endMsg = "Crate Removed from Mission Site Before Mission Completion: Mission Aborted";
								[_coords,_mines,_objects,_crates, _blck_AllMissionAI,"Crate Removed from Mission Site Before Mission Completion: Mission Aborted",_markers,markerPos (_markers select 1),_markerName,_markerMissionName,  _exception] call blck_fnc_endMission;
							};
					case 3: {  // Abort, key asset killed		
								[_coords,_mines,_objects,_crates,_blck_AllMissionAI,_assetKilledMsg,_markers,markerPos (_markers select 1),_markerName,_markerMissionName, _exception] call blck_fnc_endMission;
							};
					case 4: {  // Reserved for grpNull errors in the future

					};
				};
			};
		};
		default 
		{
			blck_activeMissionsList pushBack _el;
		};
	};
};
