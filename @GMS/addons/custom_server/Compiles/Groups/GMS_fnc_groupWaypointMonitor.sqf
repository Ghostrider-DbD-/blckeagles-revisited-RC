
/*
	Checks for groups that have not reached their waypoints within a proscribed period
	and redirects them.

	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";
// TODO: Test functionality of this
_fn_waypointComplete = {
	private _group = _this select 0;
	private _wp = currentWaypoint _group;
	private _done = if (currentWaypoint _group) > (count (waypoints _group)) then {true} else {false};
	_done
};

{
	private["_timeStamp","_index","_unit","_soldierType"];
	if ( !(_x isEqualTo grpNull) && ({alive _x} count (units _x) > 0) ) then
	{
		_timeStamp = _x getVariable ["timeStamp",0];
		if (_timeStamp isEqualTo 0) then 
		{
			_x setVariable["timeStamp",diag_tickTime];
		};
		_soldierType = _x getVariable["soldierType","null"];
		switch (_soldierType) do
		{
			case "infantry": {[_x, 60] call blck_fnc_checkgroupwaypointstatus;};
			case "vehicle": {[_x, 90, 800] call blck_fnc_checkgroupwaypointstatus;};
			case "aircraft": {[_x, 90, 1000] call blck_fnc_checkgroupwaypointstatus;};
		};
	};
} forEach blck_monitoredMissionAIGroups;

