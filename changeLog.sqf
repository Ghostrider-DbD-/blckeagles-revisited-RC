/*
blck Mission system by Ghostrider [GRG]
Loosely based on the AI mission system by blckeagls ver 2.0.2
Contributions by Narines: bug fixes, testing, infinite ammo fix.
Ideas or code from that by He-Man, Vampire and KiloSwiss have been used for certain functions.
Many thanks for new Coding and ideas from Grahame.



Significant Changes:

=====================
7.02 Build 230

New: Option to hide bushes and trees that happen to be under the location in which an enterable building is spawned 
	blck_hideRocksAndPlants = true; //  When true, any rocks, trees or bushes under enterable buildings will be 'hidden'

New: Added support for simple objects.  Note that these can be exported by the editor tool now.

New: Option to drop crates on a parachute at mission spawn which adds some randomness to where crates end up. 
	blck_spawnCratesTiming = "atMissionSpawnAir";

New: You can now add money to crates at static missions by defining the following parameter in your .sqf for the mission.
	_crateMoney = 10000;
	this can be a value or a range such as [1000,10000];
	a random amount of money from 0 to the maximum defined will be added. 

New: Added checks and logging for invalid marker types and colors; default values are now provided.

New: Added some basic error checking and logging for incorrect entries for some key settings.

New: 3DEN Editor plugin exports missions as .sqf formated text ready to paste into a file.
	See the instructions in the @blckeagls_3DEN folder of this download for more information. 

Fixed: Don and Hostage missions could not be completed 
Fixed: Missions tended to spawn all at once 
Fixed: Vehicles sometimes blew up on spawn. vehicles are spawned at a safe spot which should reduce unintended explosions 
Fixed: Missions sometimes spawned on steep hillsides.
Fixed: Missions were not distributed over the entire map. The scripts now pick a random quadrant to search thus ensuring broader distribution of mission locations.
Fixed: Money was not added to crates at dynamic missions 
Fixed: Markers were not shown if more than once instance of a mission was spawned.
Fixed: No subs or scuba units were spawned at dynamic UMS missions.
Fixed: Jets crashed at spawn in.

Changed: Timers for spawning missions adjusted a bit to space out spawn/timeouts a bit more.
Changed: The system has been upgraded to a state-based system, meaning only one script (GMS_fnc_mainThread)is running once all missions are initialized.
Changed: a lot of debugging code was removed.
Changed: List of missions for dynamic Underwater missions was moved to \Missions\GMS_missionLIsts.sqf
Changed: Units spawned where the surface is water are spawned with UMS gear now.
Changed: Added some CBA compatability (Thanks to porkeid for the fixes)

6.98 Build 206
FIXED: few minor bug fixes. 
FIXED: Static Mission Loot vehicles are no longer deleted by Epoch servers when players enter them.
FIXED: an error in coordinates for some randomly spawned missions tha added an extra 0 to the array with the coordinaates.
Added: a define for NIA all in one in blck_defines; 
Added a few preconfiguration variables with lists of NIA Armas items.
Added: an optional parameter to define the location of a mission as one of one or more locations in an array 
  _defaultMissionLocations = [];

Added: a function that returns an array of all mission markers used by blckeagls for mission makers and server owners 
	blck_fnc_getAllBlackeaglsMarkers
	Returns: an array with all markers used by the mission system.

Added: a function to pull a list of all map markers belonging to DMS and avoid spawning new blckeagls missions near these.
	Configuraiont parameter: blck_minDistanceFromDMS  // set to -1 to disable this check.
	Function: blck_fnc_getAllDMSMarkers

Removed: some debugging and map sepcific settings from blck_custom_config.sqf 
Changed: some code for finding locations for a new mission. 
Added: all blckeagls map markers have the same prefix:  "blckeagls_marker"

6.96 Build 199
Added support for Arma servers not running Epoch or Exile 

6.96 Build 197
Sorted some wisses with the dynamic UMS spawner. 
Removing debugging info
TODO: come back to grpNull detection 

6092 Build 196
sorted issues with markers 
and added new findSafeLocation 

6.92 Build 194
Added _noAIGroups to parameter list for _spawnMissionAI
Other minor changes to delete logging.

6.92 Build 193
Updates to scripts to see if player(s) are near locations.
Updates to scripts to delete alive and dead AI.
Updates to simulation managers.

6.92 Guild 192
All actions on dead AI are handled throug units blck_graveyardGroup 
All use of blck_deadAI has been deleted.

6.92 Build 184
Fixed an issues that caused blckeagls to load before exile servers were ready to accept players.
Added checks that ensure that live AI and mission scenery do not despawn when players are nearby.
Decreased the frequency with which some checks (dead AI, live AI, scenery at completed missions) is checked.
Redid a few lops that should be using the more speedy deleteAt rather than forEach methods.
worked on killed and hit EH so that these can run on the client owning the unit and server with each having a specific role 
  - note that this requires that the code be streamed to clients and compiled on the HC.
Updates to client to reduce logging 
Added a firedNear EH 
Redid system for setting up combatmode and behavior to be context dependent
Redid setNextWaypont to include an antiStuck check and implement the above checks on behavior and combat mode. 
Support for claim-vehicle scripts is now built-in 
	blck_allowClaimVehicle = true; // To allow players to claim vehicles (Exile only).
Added a setting to disable having AI toss smoke before healing. Set:
	blck_useSmokeWhenHealing=false; // to disable this
Added an option to display kill notices using Toasts
	blck_aiKillUseToast=true; // in blckClient.sqf in the debug folder of your mission.pbo to enable these.
Added offloading of AI to clients
	////////
	//  Client Offloading and Headless Client Configurations
	blck_useHC = true; // Experimental (death messages and rewards not yet working).
	//  Credit to Defent and eraser for their excellent work on scripts to transfer AI to clients for which these settings are required.
	blck_ai_offload_to_client = true; // forces AI to be transfered to player's PCs.  Disable if you have players running slow PCs.
	blck_ai_offload_notifyClient = false;  // Set true if you want notifications when AI are offloaded to a client PC. Only for testing/debugging purposes.
										// TODO: set to false before release
	blck_limit_ai_offload_to_blckeagls = true;  // when true, only groups spawned by blckeagls are evaluated.

Fixed - Vehicle unlock when empty of crew through adding a getOut event handler.
Code for spawning vehicles redone to reduced redundancy.
Monitoring of groups refined to route mission groups that have left the mission area back to it.

V 6.90  Build 175
1. Added new settings to specify the number of crew per vehhicle to blck_config.sqf and blck_config_mil.sqf
  
    // global settings for this parameters
    // Determine the number of crew plus driver per vehicle; excess crew are ignored.
    // This can be a value or array of [_min, _max];
	blck_vehCrew_blue = 3;
	blck_vehCrew_red = 3;
	blck_vehCrew_green = 3;
	blck_vehCrew_orange = 3;

    You can also define this value in missions by adding the following variable definition to the mission template:

    _vehicleCrewCount = [3,6]; // min/max number of AI to load including driver. see the missions\blue\template.sqf and blck_configs.sqf for more info.

2.  Lists of items to be excluded from dynamically generated loadouts has been moved to:
    blck_config.sqf
    blck_config_mil.sqf

3. Added a new setting that specifies whether logging of blacklisted items is done (handy for debugging)
    blck_logBlacklistedItems = true;  // set to false to disable logging 

4. Hit and Killed event handlers extensively reworked. Methods for notification of nearby AI and Vehicles of the killers whereabouts were revised to be more inclusive of neighboring AI.

5. Issues with AIHit events fixed; AI now deploy smoke and heal.

6. Added constraints on aircraft patrols to keep them in the mission area.

7. Removed some unnecessary logging.

8. Other minor coding fixes and optimizations.

6.88 
This update consists primarily of a set of bug fixes and code tweaks.
Many thanks to HeMan for his time in effort spent going through the scripts to troublehsoot and improve them.

6.86 Build 156
Added support for spawning infantry and statics inside buildings for forming a garrison using either of two methods.
	1. by placing a marker object such as a sphere in the building you define it as having units/statics inside 
	2. by placing units or statics in it you determine the garrison to be placed at mission spawn.
Added tools to facilitate grabbing data from missions in the editor (see the new TOOLS folders for more information).
Added additional error checks for missing mission parameters.
Fixed: issues that prevented completion of capture/hostage missions on exile servers
Added: code that forces air, land and sea vehicles to detect nearby players which should help with frozen AI _noChoppers
Changed: code for blckeagls simulation manager to force simulation when groups are awoken.
Added: additional settings for simulation management (see blck_configs.sqf for details)
Changed: Simulation management is now set using the new variable blck_simulationManager which is defined in blck_configs.sqf
Fixed: Heli's just hovered over missions.
Fixed: GRG code that locked up the mission system was removed from the public RC.

6.84 Build 145
Added Option to load weapons, pistols, uniforms, headgear, vests and backpacks from CfgPricing (Epoch) or the Arsenal (Exile) and exclude items above a certain price
	Add details on configs for enabling this and setting the maximum price
	To use this new feature
	Set blck_useConfigsGeneratedLoadouts = true; 
	
	To specify the maximum price for items added to AI, change:
	blck_maximumItemPriceInAI_Loadouts = 100; 
	
	NOTE: this function overides any loadouts you specify in blck_config.sqf etc.
	
Added functions to despawn static patrols of all types when no players are nearby. This tracks the number of infantry alive in a group and respawns only the number alive when the group was despawned.
Added: Static units will now be spawned with gear specific to difficulty level (blue, red, green, orange) as specified in blck_config.sqf etc.
Added: AI now have a chance of spawning with binocs or range finders.
Added: a lit road cone spawns at the center of the mission to help find it and aid in triggering mission completion.

Changed: Hostage missions redesigned to reduce chances of AI being glitched into containers and of mission objects flying about when spawned in.
Changed: Units are spawned with greater dispersion.
Changed: method for spawning random landscapes has been changed. Note the added randomization in missions\blue\default.sqf

Fixed: Collisions between objects at missions caused issues.
Fixed: Attempted a fix to reduce the chance that AI will spawn inside or under objects like rocks or containers.
Fixed: Captive missions now complete properly. 
Fixed: Hostage missions now complete properly.
Fixed: Paratroops spawned at UMS missions now spawn with scuba gear.

Version 1.82 Build 134
Added: configs for blue, red, green and orange pistol, vest, backpack and uniforms (with thanks to Grahame for suggesting this change and doing most of the coding)
Changes: 
	Commented out all configs in missions for uniforms, headgear, backpacks and uniforms.
	Commented out most configs for helis, paratroops and supplemental loot dropped by paratroops.
	Removed some logging that is not required.
	
Version 1.82 Build 132
Added: 	blck_killPercentage = 0.9;  // The mission will complete if this fraction of the total AI spawned has been killed.
								// This facilitates mission completion when one or two AI are spawned into objects.	

Added: Male and Female uniforms are separated and can be used alone or together for specific missiosn (Epoch Only).

Added: Loot tables updated to include food and supplies as of Epoch 1.1.0.

Added: Setting that configures vehicles to be sold at Black Market Traders.
	blck_allowSalesAtBlackMktTraders = true; // Allow vehicles to be sold at Halve's black market traders.
	
Added: Support for hostage rescue missions. 
	The hostage can be spawned at any location relative to the mission center.
	The mission aborts if the hostage is killed; all loot is deleted.
	To complete the mission, a player must approach the hostage and execute the rescue action.
	The hostage then runs away, and loot becomes available to the player.
	See missions\blue\hostage.sqf for an example mission.
	
	*****  PLEASE READ - IMPORTANT ****
	Please update the blck_client.sqf in your mission.pbo or you will not be able to interact with or see animations of the new AI characters.
	
Added: Support for Arrest Leader missions.
	These are similar to the rescue hostage mission except that the leader, when arrested, will sites
	awaiting arrival of imaginary survivor forces.
	See missions\blue\capture.sqf for an example mission

Added: 	blck_missionEndCondition = "playerNear";  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
		which provides a simple way to define the default conditions under which the mission ends for all missions. 
		You can of course define _endCondition in the specific mission file if you wish.
		
Added:  A new mission completion condition for hostage and captive missions.
		_endCondition = "assetSecured";
		
Added: 	Mission crates can now be spawned on the ground or in the air at mission completion.
		blck_spawnCratesTiming sets the default for all missions.
		blck_spawnCratesTiming = "atMissionEndAir"; // Choices: "atMissionSpawnGround","atMissionSpawnAir","atMissionEndGround","atMissionEndAir". 
		Define _spawnCratesTiming to set this parameter for a particular mission.
		_spawnCratesTiming = "atMissionEndAir";
		See the hostage1.sqf mission as an example.
		
Added: Crates spawn with tabs or crypto. Set the values in the mod-specific configs.
		For Epoch, the crypto can be accessed by pressing space bar.
			
Added: Additional documentation for those who wish to design their own missions.
	   See \missions\blue\default.sqf and default2.sqf for details.
	   
Added: greater control over AI loadouts.
		For land-based dynamic missions you can now specify for each mission:
		Uniforms
		Headgear
		Vests
		Weapons allowed
		Sidearms allows.
		(See \Missions\Blue\default2.sqf for examples).
		[Still to do: upgrade statics for the same functionality; doable but will require adding these parameters to the spawn info for the groups of infantry, vehicle, submerged and air units];
		
Added: greater control of mission helis - you can now set variables in the mission file (see examples below).
	    when these are not defined in the mission file, defaults are used.
		_chancePara = blck_chanceParaBlue; // Setting this in the mission file overrides the defaults 
		_noPara = blck_noParaBlue;  // Setting this in the mission file overrides the defaults 
		_chanceHeliPatrol = blck_chanceHeliPatrolBlue;  // Setting this in the mission file overrides the defaults 
		_noChoppers = blck_noPatrolHelisBlue;
		_missionHelis = blck_patrolHelisBlue;
		
Added: default minimun and maximum radius for groups to patrol.
		blck_minimumPatrolRadius = 22;  // AI will patrol within a circle with radius of approximately min-max meters. note that because of the way waypoints are completed they may more more or less than this distance.
		blck_maximumPatrolRadius = 35;
		
Changed: **** VERY IMPORTANT  ******
		The definitions of private variables used in missions in now read in through an include statement (see Missions\Blue\default.sqf for an example)
		Please update any custom mission you have generated accordingly.
		This should save quite a bit of editing going forward.
		Please note that if you do not update the private variables definitions list certain features of the mission spawner may not work due to issues with scope of variables.
		
Changed: Each mission is now compiled at server startup which I hope will save a little server resource between restarts.
         A few variables that were not used were eliminated.
		 Some declarations of private variables were consolidated.
		 Together these changes should be worth a small performance bump.
		 
Changed: Code for Heli Patrols redone.
		Code that spawns paratroops moved to a separate function that is called when a player is within a certain radius of the mission.
		Code that spawns a supplemental loot chest added - this will be spawned along with the paratroop reinforcements, if desired.
		This crate can have customized loot (think ammo, building supplies, tools and food, ala Exile/Epoch airdrops).

Changed: Logic for spawning paratroops was redone so it is more clear.
		When helis are spawned the paratroops will spawn at the heli location at the location at which the heli spawn based on probability set in _chancePara in the mission file or the default for that mission difficulty.
		When no helies are to be spawned, paratroops will spawn at the mission center when it spawns based on probability set in _chancePara in the mission file or the default for that mission difficulty.
		A delay was added so that paratroops spawn when players are nearby for more drama !!
		
Changed: Methods for detecting NULL Groups (rarely a problem with arma these days) simplified.
		Still more work to be done here.

Changed: Methods for defining mission crate loot were relaxed.
		You can define each item either with the old method ["Item Name", minimun number, maximum number] or just "Item name".
		
Fixed: disabled some logging that is not required except when debugging.
Fixed: AI Counts were not being shown at dynamic UMS.
Fixed: AI were glitching through walls. 
Fixed: Emplaced weapons are now spawned at correct locations when their positions are defined in an array in the mission file.
Fixed: an issue with the experimental build whereby the number of dynamically tracked missions was not correctly spawned.
Fixed: Dead Ai in vehicles were sometimes detected as alive. Dead AI are now ejected.
Fixed: Vehicles are now properly released to players when all AI inside are killed when an HC is connected.

Version 1.80 Build 118
Added: you can now determine whether objects spawned at dynamic missions have simulation or damage enabled.
     See the medicalCamp.sqf mission for an example of how this is done.
Added: you can now spawn simple objects as part of your mission landscape. Useful for STATIC missions only. 
Added: lists of armed vehicles from which you can choose those you wish to spawn at vehicles broken down by category (wheeled, traced APC, Tank, etc)
Added: Three constants that define how far away missions are from players when they spawn.
	blck_minDistanceToBases = 900; Minimum distance from any freq jammer or flag
	blck_minDistanceToPlayer = 900; Minimum distance from any player
	blck_minDistanceFromTowns = 300; Minimum distance from cites or towns.
	
Changed: Default missions reworked to support the above.

Version 1.79, Build 116
Added: Map-specific information for Lythium.
Added: New configuration setting: blck_showCountAliveAI = true;  When = true, the number of alive AI at a mission will be displayed by the mission marker.
Added: You can now define the types of patrol vehicles spawned based on AI difficulty.

Fixed: Setting 	blck_useTimeAcceleration = false; now disables the time acceleration module.
Fixed: several issues with dynamic UMS missions.
Fixed: AI Heli's at missions should now be released to players when all AI are dead.
Fixed: script errors when dynamic simulation off.

Changed: Code for checking the state of AI vehicles and releasing them to players was re-written.
Changed: Eliminated useless files from the debug folder (mission.pbo).
		Please replace the debug folder in your mission PBO with the updated one found on the github. 
		[removed all scripts for markers from mission\debug. These are now located in custom_server\compiles\functions.]

Version 6.78 Build 107
Fixed: blck_baseSkill is now used properly to set skill of units.
Added: Units assemble in formation when spawned.

Version 6.78 build 106
Changed how event handlers are handled.
bug fixes
Removed lines specific to GRG servers.

Version 6.76 Build 104
Added: A new timer that determines the time after which Vehicles are deleted once all AI are dead if no player has entered the driver's seat.
Added: an optional variable in the template for missions called _missionGroups by which you can define the parameters (position, skill level, number, patrol radius) for each group spawned.
		See the default2.sqf mission under custom_server\Missions\blue for an example 
Changed: The method by which the server handles AI damage was changed to use MPHit. 
Added: an MPKilled event handler for vehicles.

Fixed: Static Vehicles were being spawned repeatedly.
Fixed: _missionGroups parameters were not being handled correctly.
Fixed: sever FPS was not being logged by GMS_passToHCs
Fixed: crate marker was not shown when in debug mode.
Known Issues: Vehicles are not unlocked when released to players if an HC is connected.

Version 6.74 Build 97
Added Core Code for spawning dynamic underwater missions.
Added Core Code for spawning scuba units and surface and SDV patrols.
Added Code to spawn static underwater missions.
Note: support for scuba AI required a significant re-write of the code for spawning AI groups and units.

Changed static missions so that AI are spawned only when players are within 2000 meter.
Added optional respawn to static AI groups, vehicles, emplaced weaps and aircraft.
Added four functions that support spawning of static AI with setting for difficulty, patrol radius, and respawn time.
	For examples, see the updated static eample mission 
	and blck_custom_config.sqf and the examples below:
	
	position                 difficulty  radius respawn
	[[[22920.4,16887.3,3.19144],"red",[1,2], 75,   120]] call blck_fnc_sm_AddGroup;
	
	weapon             position                 difficulty radius (not used) respawn time
	[["B_G_Mortar_01_F",[22867.3,16809.1,3.17968],"red",0,0]] call blck_fnc_sm_AddEmplaced;
	
	  vehicle                    position               difficulty radius respawn
	[["B_G_Offroad_01_armed_F",[22819.4,16929.5,3.17413],"red",   600,    0]] call blck_fnc_sm_AddVehicle;
	
	aircraft                            position           difficulty radius respawn
	[["Exile_Chopper_Huey_Armed_Green",[22923.4,16953,3.19],"red",    1000,   0]] call blck_fnc_sm_AddAircraft; 	
Re-did event handlers for compatability with Arma 1.78+, and moved most code into pre-compiled functions that execute on the server.
	
======================	
Version 6.72 Build 81
[Added] Support for headless clients. This functionality works for one HC regardless of the name used for HCs.
[Added] Added an optional variable for mission patrol vehicles:  _missionPatrolVehicles
		One can use this variable to defin the spawn position and types of vehicles spawned at missions.
		note: one can still have the type of vehicle randomized by using selectRandom and pointing it to either the default list of patrol vehicles for the mission system or providing a custom array of vehicle class names.
		I added this because on some of our GRG missions the vehicles were being destroyed at the time they were spawned.
[Changed] Crates can now be lifted only AFTER a mission is completed.		
[Changed] The client is now activated using remoteExec instead of a public variable.
	      **** Please be sure to update the files in the debug folder on your client.

=====================
Version 6.71 Build 77
[Added] HandleDamage Event Handler for Armed Vehicles to increase their interaction with players.
[Fixed] Mission name was not displayed with start or end messages when the mission marker labels were disabled.
[Fixed] the mission system would hang in some situations due to an undefined global variable in SLS.

============================
8/13/17 Version 6.61 Build 71
[Added] Most parameters for numbers of loot, AI, and vehicle patrols can be defined as either a scalar value or range. 
	Note that there is backwards compatability to prior versions so you need make no changes to your configs if you do not wish to.
	The major reason to include this feature is so that players to do not go looking for that third static weapon at an orange mission. They have to scope out the situation.
[Added] options to have multiple aircraft spawn per mission.	
	[Note that if you spawn more than one aircraft I recommend that you disable the paratroop spawns to avoid spawning more than 124 groups].
[Added] an optional militarized setting whereby missions use a full complement of Arma air and ground vehicles including fighter jets and tanks. This is OFF by default.
	Uncomment #define blck_milServer in custom_server\Configs\blck_defines to enable this.
	[ Note!!! There are both general and mod-specific configs for the militarized missions.]
[Added] Support for setting a range for certain configurations rather than setting a single value.
This should make missions a little more varied in that players will no longer be looking for the 4 statics that always spawn at an orange mission.
This pertains to:
	Numbers of Emplaced Weapons
	Numbers of Vehicles Patrols
	Numbers of Air Patrols 
	AI Skills; for example you can now set ["aimingAccuracy",[0.08,16]],["aimingShake",[0.25,0.35]],["aimingSpeed",0.5],["endurance",0.50], .... ];
	Numbers of Items to load into Mission and Static loot crates; for example, for the orange level of difficulty item counts could be revised as follows:
	blck_lootCountsOrange = [[6,8],[24,32],[5,10],[25,35],16,1];  
	
7/27/17  Version 6.59 Build 60
[added] AI units in mission vehicles and emplaced weapons are notified of the location of the shooter when an AI unit is hit or killed. Location of the unit is revealed gradually between 0.1 and 4 where 4 is precise. Increments increase with increasing mission difficulty.

6/1/17 Version 6.59 Build 59
[changed] Players are no longer given crypto for each AI kill. Crypto added to AI Bodies was increased.
[fixed] error in GMS_fnc_setupWaypoints wherein _arc was not defined early enough in the script.
[fixed] Exile Respect Loss bug (temporary fix only).

5/21/17 Version 6.58 build 58
[Fixed] typos for blck_epochValuables.
[Fixed] All loot was removed from AI vehicles at the time a mission was completed.
[Fixed] When mission completion criteria included killing all AI, missions could be completed with alive AI in vehicles. 

4/6/17 Version 6.58 Build 54
[Added] A FAQ presenting an overview of the mission system and addons.
[Changed] Helicopter crew waypoint system reverted to that from Build 46.
[Fixed] Mission timouts would prevent new missions from spawning after a while.
[Fixed] blck_timeAcceleration now determines if time acceleration is activated.
[Fixed] Missions did not complete correctly under certain circumstances.
[Fixed] Mission vehicles were not properly deleted, unlocked or otherwise handled at misison end or when AI crew were killed.
[Fixed] Throws errors when evaluating errors related to certain disallowed types of kills.
Known errors: throws errors with certain loot crate setups (Exile)

3/23/17 Verision 6.58 build 48
Turned debugging off
Added some preprocessor commands to minimize the use of if()then for debugging purposes when running without any debugging settings on.
Teaks to heli patrol waypoint system.
bugfixes.

3/21/17 Version 6.58 Build 44
[Added] Each mission now has a setting for mines which is set to false. To use the global setting in blck_config for yoru mission just change this to read:
	_useMines = blck_useMines;
[Fixed] Logging by the time acceleration module was disabled.
[Fixed] Emplaced weapons now spawn in the correct locations.
[Fixed] Missions end correctly when all AI are dead and _endCondition = "allKilledOrPlayerNear"; 
[changed] Reverted to the waypoint system from build 42.

3/18/17 Version 6.58 Build 44
[Fixed] Time acceleration was not working.
[Fixed] blck_timeAcceleration now determines if time acceleration is activated.
[Fixed] The mission described by default2 in the blue missions folder now spawns correctly. 
	You can use this as a guide for how to place loot crates or static weapons at specific locations like inside or on top of structures.
	Loot vehicles are now spawned correctly.
	Loot crates positioned at specific locations are now spawned correctely.
	static weapons to be spawned at specified positions are now spawned correctly.
	That mission is disabled by default.
[Added] option to disable time acceleration (blck_timeAcceleration = true; line 30 of blck_config.sqf)
[Added] options to have armed heli's patrolling the missions and for them to drop AI.
[Added] options to have paratroops drop over missions as an alternative to the above.
[Added] Code optimization for GMS_fnc_spawnMissionAI.sqf and several other AI spawning scripts.
Added] Formalizing exception handling for the case in which a createGroup request returns grpNull. 
	If this happens during mission spawning the mission will be aborted and all mission objects and AI will be deleted.
	This should prevent the mission system from crashing causing no further missions to spawn.
[Added] a new configuration that sets a cap on the maximum number of spawned missions. 
	blck_maxSpawnedMissions = 4; // Line 181 of blck_configs.sqf
[Added] a function blck_fnc_allPlayers which returns an array of allPlayers (as a temporizing fix till BIS patches the allPlayers function.
	
[Changed] Coding improvements for waypoint generation.
	Tried a new approach to generating waypoints to make AI more aggressive without the overhead of the last method.
	
[Changed] Redid the mission spawner to spawn one random mission every 1 min for mission for which timers say they can be spoawned.
	This will continue until the cap is reached then randomly select a mission from those that are ready to be respawned to be spawned next.
	If you want the various missions to have an equal chance of being spawned at all times, give the the timers for blue, red, green and red timers the same values for Min and Max.
[Chaged] logic for detecting whether a player is near the mission center or loot crates to test if a player is near any of an array of location or objects. 	
[Added] a function blck_fnc_allPlayers which returns an array of allPlayers (as a temporizing fix till BIS patches the allPlayers function.

To Do - consider moving back to storing AI in a group-based manner (doable easily, needs testing).
		Build a template for static missions (planned for Ver 6.60).
		Write a static mission spawning routine (planned for Ver 6.60).
	
3/17/17 Version 6.58 Build 43
Reverted back to v6.56 build 39 then:
[Added] a Hit event handler to make AI more responsive. All AI in the group to which the hit AI belongs are informed of the shooter's location.
[Changed] the Killed event handler as below.
[Added] New logic for informing AI of the location of players to give AI a more gradual ramp up from little knowledge about player location to full knowledge.
[Added] scripts and functions for reinforcements: a) heli patrols; b) paratroops.
[Added] ...\custom_server\Configs\blck_defines.hpp inside which you can disable APEX gear and other attributes.

[Changed] Re-organized variables in the configs.
[Changed] Divided configs into tow basic parts: 
	- General configs for the mission system.
	- Mod-specific configs.
[Changed] spawnMarker.sqf in the debug folder (mission.pbo) to reduce unneeded logging.
	
3/13/17 Version 6.57 Build 41
Changed the method of tracking live AI from an array of units to an array of groups which will aid in monitoring groups for a 'stuck' state.
Added Search and Destroy waypoints for each location in the waypoint cycle.
Change waypoint compbat mode to "COMBAT"
Added Group Waypoint Monitor that deals with the case wherein a group gets 'stuck' in a search and destroy waypoint without any nearby targets.
Updated spawnMarker.sqf in the debug folder (mission.pbo) to reduce unneeded logging.

3/12/17 Version 6.57 Build 40  Reworked AI Event handlers
Added an event handler to make AI more responsive.
Revised logic for informing AI of the location of players to give AI a more gradual ramp up from little knowledge about player location to full knowledge.

2/24/17 Version 6.56 Build 39. Reworked Mission End Criteria and timing of loading of loot chests
Added a check so that mission completion by players near loot crates was tripped only when players were on foot.
Added a setting that determines whether loot crates are loaded when the mission spawns or once the mission is complete. 
	see blck_loadCratesTiming = "atMissionCompletion"; (line 78) for this configuration setting.
	
1/28/17 Version 6.55 Build 38 Bug Fixes
bug fixes
Commented out logging that is no longer needed
Removed a weapon from loot tables that could be used for dupping.

1/24/17 Version 6.55 Build 35 Improved handling of static weapons with dead AI; added option to delete loot chests at some time after mission completion.
Added a new configuration blck_killEmptyStaticWeapons which determines if static weapons shoudl be disabled after the AI is killed.
Added a configuration blck_cleanUpLootChests that determines if loot crates are deleted when other mission objects are deleted.
Fixed an issue that prevented proper deletion of mission objects and live AI.

1/23/17 Version 6.54 Build 33 Bug Fixes
Fixed typos in GMS_fnc_vehicleMonitor.sqf
Removed a few files that are not used or needed.
Removed some code that had been commented out from blck_functions.sqf.

1/22/17 Version 6.54 build 32 Primarily performance-oriented improvements to switch from using timers and .sqf to a 'thread' that scans various arrays related to missions and mission objects using pre-compiled functions.
Changed code to test for conditions that trigger to spawn mission objects and AI completely
Rewrote the code for spawning emplaced weapons from scratch.
Fixed an error in how the waitTime till a mission was respawned after being updated to inactive status.
Added additional reporting as to the mission type for which AI, statics and vehicle patrols are being spawned.
Continued switching from blck_debugOn to blck_debugLevel.
Continued work to move much of the code from GMS_fnc_missionSpawner to precompiled functions.
	- tested and working for all but the emplaced weapons module.
Removed old code that had been commented out from GMS_missionSpawner.
deactivated the 'fired' event handler
added an 'reloaded' event handler to units that adds a magazin of the type used to reload the weapon to prevent units running out of ammo. this also provides a break in firing and is more realistic.
Added a check to GMS_fnc_vehicleMonitor that addes ammo to vehicle cargo when stores are low. Removed the infinite ammo script for static and vehicle weapons, again for greater realism.
Increased number of rounds of ammo added to AI units for primary and secondary weapons.
Tweaked code in GMS_fnc_spawnUnit to increase efficiency.
Attempted a fix for occaisional issues with missions not triggering or ending by changing from distance to distance2D.
Tweaked code for deleting dead AI to also delete any weapons containers nearby.
Checked throughout for potential scope issues; ensured all private variables were declared as such.
Changed the method by which mission patrol vehicles and static weapons are deleted at the end of a mission.

1/21/17 Build 29. Reverted to an older system for mission timers.
Went back to the timerless system for spawning missions.
Improved code for updating the array of pending/active missions
	GMS_fnc_updateMissionQue.sqf re-written to take greater advantage of existing array commands: set and find.
Ensured that the array used to store the location(s) of active or recent missions is properly updated.

1/13/17 Version 6.54 Build 27
Rerverted back to the code that spawned a single instance of each mission until I can debug certain issues.

1/7/17 Version 6.53 Build 24 AI difficulty updates; some performance improvements.
Added a setting blck_baseSkill = 0.7; // This defines the base skil of AI. Increase it to make AI more challenging.
Tweaked AI difficulty settings to make missions more difficult.
changed - GMS_EH_unitKilled - the event handler now uses precompiled rather than compiled on the fly code.
changed - several other minor performance tweaks were made server side.
changed - small changes were made the the loop in blck_client.sqf 
Tweaked debugging information to reduced unnecessary logging when not in debug-mode.
Disabled the loop sending server fps client-side
fixed - GMS_fnc_updateMissionQue was not correctly updating mission information after mission completion.
fixed - GMS_fnc_mainThread was not deleted old AI and Vehicles from the arrays used to capture them after mission completion.
changed - calls to GMS_fnc_vehicleMonitor were moved inside the main loop.

1/3/17 Version 6.51 Build 23 Added several new kinds of messaging to the UI.
Moved configuration for the client from debug\blckclient.sqf to debug\blckconfig.sqf.
Added a setting blck_useKillMessages = true/false; (line 60 of the config. when true, kill messages will be send to all players when a player kills an AI. The style of the message is controlled client-side (debug\blck_config.sqf)
Added a setting blck_useKillScoreMessage = true/false; // (line 61 of the config) when true a tile is displayed to the killer with the kill score information
Added a setting 	blck_useIEDMessages = true/false;  // when true players will receive a message that their vehicle was damaged when AI are killed in a forbidden way (Run over Or Killed with vehicle-mounted weapons)
Fixed: Messages that a nearby IED was detonated are now properly displayed when players illegally kill AI.
Added a way to easily include / exclude APEX items. To exclude them comment out the line 
	#define useAPEX 1
	at approximately line 219 in the config.

12/21/16 Version 6.50 Build 21 Added checks that delete empty groups. 
Added a check for mod type to the routine that deletes empty groups as this is only needed for Epoch.
Added back the code that (a) eliminates the mission timers and (b) allows multiple instances of a mission to be spawned.

12/20/16 Version 6.46 Buid 20  Tweaks to time acceleration module.
Moved Variables for time acceleration to the config files.
Reworked code for time acceleration to use timeDay and BIS_fnc_sunriseSunsetTime.

11/20/16 Build 6.45 Build 19  UI-related additions and bug fixes.
Added Option to display mission information in Toasts (Exile Only).
Fixed an issue related to bugs in Arma 1.66

11/16/16 Version 6.44 Build 15  Added options for automated generation of location blacklists; added APEX gear; tweaks to the code that loads items into crates.
Added parameters
	blck_blacklistTraderCities=true; // the locations of the Epoch/Exile trader cities will be pulled from the config and added to the location blacklist for the mission system.
	blcklistConcreteMixerZones = true; // Locations of the concrete mixers will be pulled from the configs; no missions will be spawned within 1000 m of these locations.
	blck_blacklistSpawns = true; // Locations of Exile spawns will be pulled from the config. No missions will spawn within 1000 m of these locations.
Added: the main thread now runs a function that checks for empty groups. 
Fixed: The mission system would hang on epoch after a while because createGroup returned nullGroup. this appeared to occur because the maximum number of active groups had been reached. Deleting empty groups periodically solved the issue on a test machine.
Teaked: code to check whether a possible mission spawn location is near a flag or plot pole. Still needs work.
Added: Completed adding EDEN weapons, optics, bipods, optics to AI configurations and mission loot crates.
Added APEX headgear and uniforms.  (Note, you would need to add any of these you wished for players to sell to Epoch\<Map Name>\epoch_config\CfgPricing.hpp on Epoch)
Changed: Definitions of blacklist locations such as spawns moved from GMS_findWorld.sqf to the blck_configs_(epoch|exile).
Changed: Divided rifles and optics into subcategories to better enable assigning weapons to AI difficulties in a sort of class-based way, e.g., 556, 6.5, or LMG are separate classes.
Changed: DLS crate loader (not publically available yet) now uses blck_fnc_loadLootItemsFromArray rather than the prior approach for which specific crate loading functions were called depending on the loadout type (weapons, building supplies, foord etc).
Fixed: You can now loot AI bodies in Epoch.

11/12/16 Version 6.43 Build 12  Added MAP ADDONS and Loot Crate Spawners.
Added: MapAddons - use this to spawn AI strongholds or other compositions you generate with Eden editor at server startup.
Added: Loot Crate Spawner - Spawn loot crates at prespecified points. This is designed so that you can spawn crates inside buildings or other structures spawned through the map-addons.
Added: APEX weapons, sights and optics to AI and loot crates.

11/12/16 Version 6.42 Build 11  Added code to fit weapons attachments.
Enhancements to code to equip weapons; pointrs, silencers and bipods are now attached.

11/11/16 Version 6.42 build 10 Added code to fit weapons attachments. Improved code to spawn mission objects.
Redid the code that spawns the objects at missions to work properly with the new formats generated by M3Arma EDEN Editor whilc being backwards compatible with older formats used in the existing missions.
Added code to add scopes and other attachments to AI weapons.
Added new variable blck_blacklistedOptics which you can use to block spawning optics like TMS.
Added new parameter blck_removeNVG which when true will cause NVG to be deleted from AI bodies.
Fixed: launchers and rounds should now be deleted when blck_removeLaunchers = true;
Fixed: All AI should spawn with a uniform.
More bug fixes and correction of typos.

11/2/16 Version 6.41 Build 9  Kill message improvements; added money to AI.
Added a parameter 	blck_useKilledAIName that, when true, changes the kill messages to show player name and AI unit name 
Added message to players for killstreaks and a crypto/Tabs bonus for killstreaks.
Exile: AI spawn with a few tabs.
//Epoch: AI spawn with a few Crypto
Corrected an error that would spawn Epoch NVG on AI in Exile.

10/25/16 Version 6.4 Build 8   Code improvements.
Reworked the code to spawn vehicle patrols and static weapons and clean them up.
Reworked the code that messages players to be sure that calling titleText does not hang the messaging function and delay hints or system chat notifications.

10/22/16 v 6.3 Build 8-14-16  Code performance improvements.
Moved routines that delete dead AI, Alive AI and mission objects from individual loops to a single loop spawned by blck_init.sqf.
Added functions to cache these data with time stamps for later time-based deletion.

10/21/16 Version 6.2 Build 7  Coding improvements
Redid system for markers which are now defined in the mission template reducing dependence on client side configurations for each mission or marker type.
Bug-fixes for helicrashes including ensuring that live AI are despawned after a certain time.

10-1-16 Version 6.1.4 Build 6  Added a time acceleration function
1) Added back the time acceleration module

9-25-16 Version 6.1.4 Build 6  bug fixes; added metadata.
1) Added metadata for Australia 5.0.1
2) Fixed bugs with the IED notifications used when a player is penalized for illeagal AI Kills. _fnc_processIlegalKills (server side) and blckClient (client side) reworked. _this select 0 etc was replaced with params[] throughout. Many minor errors were corrected.

9/24/16 Version 6.1.3 Build 5   Code optimization
1) Re-wrote the SLS crate spawning code which now relies on functions for crate spawning and generating a smoke source already used by the mission system. Replaced old functions with newer ones (e.g., params[] and selectRandom). Found a few bugs. Broke the script up into several discrete functions. Tested on Exile and Epoch,
2) Reworked the code for generating a smoke source. Added additional options with defaults set using params[].

9-19-16 Ver 6.1.2/11/16  Bug fixes.
Minor bug fixes to support Exile.
Corrected errors with scout and hunter missions trying to spawn using Epoch headgear.
Corrected error wherein AI were spawned as Epoch soldiers
Inactivated a call to an exile function that had no value 

9-15-16 vER 6.1.1 Bug fixes.
1) Reverted to the old spawnUnits routine because the new one was not spawning AI at Scouts and Hunters correctly.

9-13-16 Ver 6.10 Improved vehicle patrols.
1) Added waypoints for spawned AI Vehicles.
2) Reworked the logic for generating the positions of these waypoints
3) Added loiter waypoints in addition to move wayponts.
4) Reworked the param/params for spawnUnits
5) several other minor optimizations.

9-3-16 Ver 6.0 
1) Re-did the custom_server folder so the mod automatically starts. Blck_client.sqf no longer calls the mod from the server.
2) Added a variable blck_modType which presently can be either "Epoch" or "Exile" with the aim of having a single mission system for both mods.
3) Added a more intelligent method for loading key components (variables, functions, and map-specific parameters).
4) Re-did all code to automatically select correct parameters to run correctly on either exile or epoch servers.
5) Added the Exile Static Loot Crate Spawner; Re-did this to load either an exile or epoch version as needed since a lot of the variables and also the locations tables are unique.
6) Added the Dynamic Loot system from Exile again with Exile and Epoch specific configurations; here the difference is only in the location tables.
7) Pulled the map addons function from the Exile build and added a functionality to spawn addons appropriately for map and mod type.
8) Helicrashes redone to provide more variability in the types of wrecks, loot and challenge. These are spawned by a new file Crashes2.sqf
9) Added a setting to determine the number of crash sites spawned at any one time: blck_maxCrashSites. Set to -1 to disable altogether.
10) Added settings to enable / disable specific mission classes, e.g., blck_enableOrangeMissions. Set to 1 to enable, -1 to disable.

8-14-16
Added mission timout feature, set blck_MissionTimeout = -1 to disble;
Changed to use of params for all .sqf which also eliminated calls to BIS_fnc_params
changed to selectRandom for all .sqf

some changes to client side functions to eliminate the public variable event handler (credits to IT07 for showing the way)
Added the armed powerler to the list of default mission vehicles.

2/28/16
1) Bug fixes completed. Cleanup of bodies is now properly separated from cleanup of live AI. Cleanup of vehicles with live AI is now working correctly.
2) Released to servers this morning.
3) Next step will be to add in the heli reinforcements for ver 5.2.

2/20/16
Bugfixes and enhancements.
1) added checks for nearby bases or nearby players when spawning missions.
2) Fixed typos in Medical Camp missions.
3) Added two new modes for completing mission: 1) mission is complete when all AI are killed; 2) mission is complete when player reaches the crate OR when all AI are killed.

In Progress
1) Mission timouts
2) Added optional reinforcments via helicopters which can then patrol the mission area.

2/11/16
Major Update to Build 5.0

1) All missions but heli crashes are spawned using a single mission timer and mission spawner
2) The mission timer now calles a file containing the mission parameters. The mission spawner is included and run from that file.
3) A kill feed was added reporting each AI kill.
4) AI kills are now handled via an event handler run on the server for forward compatability with headless clients.
5) Multiple minor errors and bug fixes related to mission difficulty, AI loadouts, loot and other parameters were included. 
6) The first phase of restructuring of the file structure has been completed. Most code for functions and units has been moved to a compiles directory in Compiles\Units and Compiles\Functions.
7) Some directionality and randomness was added where mission objects are spawned at random locations from an array of objects to give the missions more of a feeling of a perimeter defense where H-barrier and other objects were added.
8) As part of the restructuing, variables were moved from AIFunctions to a separate file.
9) Bugs in routines for cleanup of dead and live AI were fixed. A much simpler system for tracking live AI, dead AI, locations of active and recent missions, was implemented because of the centralization of the mission spawning to a single script
