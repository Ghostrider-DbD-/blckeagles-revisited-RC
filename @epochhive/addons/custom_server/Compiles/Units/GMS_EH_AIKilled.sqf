
params["_unit","_killer"];

//diag_log format["EH_AIKilled:: _units = %1 and _killer = %2",_unit,_killer];
[_unit,_killer] remoteExec ["blck_fnc_processAIKill",2];
