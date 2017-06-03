// Sets up waypoints for a specified group.
/*
	for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
	Last modified 6/1/17
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#ifdef blck_debugMode
diag_log "_fnc_setupWaypoints: blck_debugMode enabled";
#endif

private["_dir","_arc","_noWp","_newpos","_wpradius","_wp"];
params["_pos","_minDis","_maxDis","_group",["_mode","random"],["_wpPatrolMode","SAD"],["_soldierType","null"] ];
_wp = [_group, 0];
#ifdef blck_debugMode
diag_log format["_fnc_setupWaypoints (4/29/17): configuring waypoints for group %1: _mode = %2 | _wpPatrolMode = %3 _soldierType = %4",_group, _mode, _wpPatrolMode,_soldierType];
#endif
if (_soldierType isEqualTo "emplaced") then
{
	_wp setWaypointType "SENTRY";
	_wp setWPPos (getPos leader _group);
	_wp setWaypointCompletionRadius 100;
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointTimeout [1,1.1,1.2];
	//_wp setWaypointTimeout [0.1,0.1100,0.1200];	
	_group setCurrentWaypoint _wp;	
	_group setVariable["soldierType",_soldierType];
	#ifdef blck_debugMode
	_wp setWaypointStatements ["true","this call blck_fnc_emplacedWeaponWaypoint; diag_log format['====Updating timestamp for group %1 and changing its WP to an emplaced weapon Waypoint',group this];"];
	if (blck_debugLevel > 1) then {diag_log format["_fnc_setupWaypoints: configuring weapoints for group %2 for emplaced weapon with _soldierType = %1",_soldierType,_group];};	
	#else
	_wp setWaypointStatements ["true","this call blck_fnc_emplacedWeaponWaypoint;"];
	#endif
};
if !(_soldierType isEqualTo "emplaced") then 
{
	_arc = 360/5;
	_group setcombatmode "YELLOW";
	_group setBehaviour "COMBAT";
	_group setVariable["patrolCenter",_pos];
	_group setVariable["minDis",_minDis];
	_group setVariable["maxDis",_maxDis];
	_group setVariable["timeStamp",diag_tickTime];
	_group setVariable["wpRadius",30];
	_group setVariable["wpMode",_mode];
	_group setVariable["wpPatrolMode",_wpPatrolMode];
	_group setVariable["wpDir",0];
	_group setVariable["wpArc",_arc];
	_group setVariable["soldierType",_soldierType];
	_dir = 0;

	_wpradius = 30;
	_dis = (_minDis) + random( (_maxDis) - (_minDis) );
	_newPos = _pos getPos[_dis,_dir];
	_wp setWPPos [_newPos select 0, _newPos select 1];
	_wp setWaypointCompletionRadius (_group getVariable["wpRadius",30]); 
	_wp setWaypointType "MOVE";
	_wp setWaypointName "move";
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointTimeout [1,1.1,1.2];
	_group setCurrentWaypoint _wp;
	#ifdef blck_debugMode
	_wp setWaypointStatements ["true","this call blck_fnc_changeToMoveWaypoint; diag_log format['====Updating timestamp for group %1 and changing its WP to a Move Waypoint',group this];"];
	#else
	_wp setWaypointStatements ["true","this call blck_fnc_changeToMoveWaypoint;"];	
	#endif
	#ifdef blck_debugMode
	if (blck_debugLevel > 1) then
	{
		_marker = createMarker [format["GroupMarker%1",_group],_newPos];
		_group setVariable["wpMarker",_marker];
		_marker setMarkerColor "ColorBlue";
		_marker setMarkerText format["%1 %2",(_group getVariable["soldierType","null"]),_group];
		_marker setMarkerType "mil_triangle";
		//diag_log format["_fnc_setupWaypoints: configuring weapoints for group %2 mobile patrol with _soldierType = %1",_solderType,_group];
		diag_log format["_fnc_setupWaypoints: soldier type for mobile _group %1 set to %2",_group, (_group getVariable["soldierType","null"])];
		diag_log format["_fnc_setupWaypoints: all variables for the group have been set for group %1",_group];		
		diag_log format["_fnc_setupWaypoints:: -- >> wpMode %1 _dir %2 _dis 3",_group getVariable["wpMode","random"], _dir, _dis];
		diag_log format["_fnc_setupWaypoints:: -- >> group to update is %1 and new position is %2",_group, _newPos];		
		diag_log format["_fnc_setupWaypoints:: -- >> Waypoint statements for group %1 have been configured as %2",_group, waypointStatements _wp];
		diag_log format["_fnc_setupWaypoints:: -- >> Waypoint marker for group %1 have been configured as %2 with text set to %3",_group, _group getVariable "wpMarker", markerText (_group getVariable "wpMarker")];
	};
	#endif
};
