/*
	Update the parameters for a mission in the list of missions running at that time.
	Call with the name of the marker associated with the mission and either "Active" or "Completed"
	by Ghostrider [GRG]
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_mission","_status",["_coords",[0,0,0]] ];

//  _mission is the name used to identify the marker associated with that particular mission. it is a unique identifier.
#ifdef blck_debugMode
if (blck_debugLevel > 3) then {diag_log format["_fnc_updateMissionQue :: _mission = %1 | _status = %2 | _coords = %3",_mission,_status,_coords];};
#endif
_index = -1;
private["_index","_element","_waitTime"];
{
	if (_mission isEqualTo (_x select 1)) exitWith 
	{
		_index = _forEachIndex;
	};
}forEach blck_pendingMissions;

//_index = blck_pendingMissions find _mission;
if (_index > -1) then
{	
	_element = blck_pendingMissions select _index;

	if (toLower(_status) isEqualTo "active") then {
		_element set[5, -1];
		_element set[6,_coords];
	};
	if (toLower(_status) isEqualTo "inactive") then 
	{
		_waitTime = (_element select 3) + random((_element select 4) - (_element select 3));
		_element set[5, diag_tickTime + _waitTime];
		_element set [6,[0,0,0]];
	};

	blck_pendingMissions set [_index, _element];
}; 


