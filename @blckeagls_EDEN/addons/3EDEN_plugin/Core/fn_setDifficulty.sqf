
params["_difficulty"];
missionNamespace setVariable["blck_difficulty",_difficulty];
private _m = format["Mission Difficulty updated to %1",_difficulty];
systemChat _m;
diag_log _m;


/*

missionNamespace setVariable["blck_difficulty","Red"];
missionNamespace setVariable["blck_lootTiming","atMissionStartGround"];
missionNamespace setVariable["blck_loadTiming","atMissionStart"];
missionNamespace setVariable["blck_endState","allUnitsKilled"];
missionNamespace setVariable["blck_startMessage","TODO: Add a start message"];
missionNamespace setVariable["blck_endMessage","TODO: Add an end message"];
