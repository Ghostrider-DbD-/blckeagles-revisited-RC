/*
	Author: Ghostrider [GRG]
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP
	License: Attribution-NonCommercial-ShareAlike 4.0 International
	Last Modified 1/23/17
*/
params["_grpPilot"];
private["_heli","_pilot"];
_pilot = (units _grpPilot) select 0;
_heli = vehicle _pilot;
diag_log "reinforcements deployed:: send heli back to spawn";
[[_heli], 300 /* 5 min*/] spawn blck_fnc_addObjToQue;
_spawnVector = round(random(360));
_spawnDistance = 2000;
_pos = getPos _heli;

_home = _pos getPos [_spawnDistance,_spawnVector];

// Send the heli back to base
_grpPilot = group this;
[_grpPilot, 0] setWPPos _pos; 
[_grpPilot, 0] setWaypointType "MOVE";
[_grpPilot, 0] setWaypointSpeed "FULL";
[_grpPilot, 0] setWaypointBehaviour "CARELESS";
[_grpPilot, 0] setWaypointCompletionRadius 200;
[_grpPilot, 0] setWaypointStatements ["true", "{deleteVehicle _x} forEach units group this;deleteVehicle (vehicle this);diag_log ""helicopter and crew deleted"""];
[_grpPilot, 0] setWaypointName "GoHome";
[_grpPilot,0] setWaypointTimeout [0.5,0.5,0.5];



