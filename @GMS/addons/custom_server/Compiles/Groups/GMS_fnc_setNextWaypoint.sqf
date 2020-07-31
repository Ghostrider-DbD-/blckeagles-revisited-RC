// Sets the WP type for WP for the specified group and updates other atributes accordingly.
/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/

	TODO: Replaces changeToMoveWaypoint 
	and
	Replaces changeToSADWaypoint 

*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_group","_wp","_index","_pattern","_mode","_arc","_dis","_wpPos"];

private _group = group _this;
private _leader = _this;
private _pos = _group getVariable "patrolCenter";  			//  Center of the area to be patroleld.
private _minDis = _group getVariable "minDis";			//  minimum distance between waypoints
private _maxDis = _group getVariable "maxDis";  				// maximum distance between waypoints
private _patrolRadius = _group getVariable "patrolRadius";	// radius of the area to be patrolled
private _wpMode = _group getVariable "wpMode";					//  The default mode used when the waypoint becomes active  https://community.bistudio.com/wiki/AI_Behaviour
private _wpTimeout = _group getVariable "wpTimeout";			//  Here to alow you to have the game engine pause before advancing to the next waypoing. a timout of 10-20 sec is recommended for infantry and land vehicles, and 1 sec for aircraft
private _wpDir = _group getVariable "wpDir";						//  Used to note the degrees along the circumference of the patrol area at which the last waypoint was positioned.
private _arc = _group getVariable "wpArc";					// Increment in degrees to be used when advancing the position of the patrol to the next position along the patrol perimeter
private _wp = [_group,0];
private _nearestEnemy = _leader findNearestEnemy (getPosATL _leader);
private _maxTime = _group getVariable["maxTime",300];

//  Extricate stuck group.
if (diag_tickTime > (_group getVariable "timeStamp") + _maxTime) exitWith 
{  // try to get unit to move and do antiStuck actions
	_group setBehaviour "CARELESS";  //  We need them to forget about enemies and move
	_group setCombatMode "BLUE";  //  We need them to disengage and move
	private _vector = _wpDir + _arc + 180;  // this should force  units to cross back and forth across the zone being patrolled
	_group setVariable["wpDir",_vector,true];
	private _newWPPos = _pos getPos[_patrolRadius,_vector];
	_wp setWaypointPosition [_newWPPos,0];
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointCompletionRadius 0;
	_wp setWaypointTimeout _wpTimeout;
	_wp setWaypointType "MOVE";
	_group setCurrentWaypoint _wp;	
	//diag_log format["_fnc_setNextWaypoint[antiSticking]: _group = %1 | _newPos = %2 | waypointStatements = %3",_group,_newWPPos,waypointStatements _wp];
};

//  Move when no enemies are nearby
if (isNull _nearestEnemy) then 
{
	// Use standard waypoint algorythms
	/*
		Have groups zig-zag back and forth their patrol area
		Setting more relaxed criteria for movement and rules of engagement
	*/
	private _vector = _wpDir + _arc + 180;  // this should force  units to cross back and forth across the zone being patrolled
	_group setVariable["wpDir",_vector,true];
	_group setCombatMode "YELLOW";
	private _newWPPos = _pos getPos[_patrolRadius,_vector];
	_wp setWaypointPosition [_newWPPos,0];
	_group setBehaviour "SAFE";  //  no enemies detected so lets put the group in a relaxed mode
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointCombatMode "YELLOW";
	_wp setWaypointCompletionRadius 0;
	_wp setWaypointTimeout _wpTimeout;
	_group setCurrentWaypoint _wp;
	//diag_log format["_fnc_setNextWaypoint[no enemies]: _group = %1 | _newPos = %2 | waypointStatements = %3",_group,_newWPPos,waypointStatements _wp];
} else {
	// move toward nearest enemy using hunting logic
	// set mode to SAD / COMBAT
	/*
		_vector set to relative direction from leader to enemy +/- random adjustment of up to 33 degrees
		_distance can be up to one patrol radius outside of the normal perimeter closer to enemy 
		_timout set to longer period 
		when coupled with SAD behavior should cause interesting behaviors
	*/
	//  [point1, point2] call BIS_fnc_relativeDirTo
	private _vector = ([_leader,_nearestEnemy] call BIS_fnc_relativeDirTo) + (random(33)*selectRandom[-1,1]);
	_group setVariable["wpDir",_vector];
	private ["_huntDistance"];

	if ((leader _group) distance _nearestEnemy > (_patrolRadius * 2)) then 
	{
		if (((leader _group) distance _pos) > (2 * _patrolRadius)) then 
		{
			_huntdistance = 0;
		} else {
			_huntDistance = _patrolRadius;
		};
	} else {
		_huntDistance = ((leader _group) distance _nearestEnemy) / 2;
	};
	
	private _newWPPos = _pos getPos[_huntDistance,_vector];
	//diag_log format["_fnc_setextWaypoint:  _pos = %1 | _patrolRadius = %5 |  _newWPPos = %2 | _huntDistance = %3 | _vector = %4",_pos,_newWPPos,_huntDistance,_vector,_patrolRadius];
	_wp setWaypointPosition [_newWPPos,0];
	_wp setWaypointBehaviour"COMBAT";
	_group setBehaviour "COMBAT";
	_group setCombatMode "RED";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointType "SAD";
	_wp setWaypointTimeout[30,45,60];
	_wp setWaypointCompletionRadius 0;
	_group setCurrentWaypoint _wp;	
	//  Assume the same waypoint statement will be available
	//diag_log format["_fnc_setNextWaypoint[enemies]t: _group = %1 | _newPos = %2 | _nearestEnemy = 54 | waypointStatements = %3",_group,_newWPPos,waypointStatements _wp,_nearestEnemy];
};



