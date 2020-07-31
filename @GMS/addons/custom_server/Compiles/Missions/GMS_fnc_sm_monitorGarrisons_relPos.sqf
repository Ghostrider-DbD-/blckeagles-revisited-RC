/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
private["_mode","_sm_groups","_pos","_element"];
if (blck_fnc_sm_spawnBuildingGarrison_relPos isEqualTo []) exitWith {};
_sm_groups = +blck_sm_garrisonBuilding_relPos;
 
{
	_x params["_groupParameters","_group","_groupSpawned","_timesSpawned","_respawnAt"];
	//  [_building,_aiDifficulty,_noStatics,_typesStatics,_noUnits,_respawn]
	_groupParameters params['_building','_aiDifficulty','_noStatics','_typesStatics','_noUnits','_respawnTime','_maxRespawns'];	
	_element = +_x;//
	_pos = position _building;
	if (!(isNull _group) && {alive _x} count (units _group) == 0) then
	{
		deleteGroup _group;
		_group = grpNull;
	};
	if (isNull _group) then
	{
		_mode = -1;
		if ((_timesSpawned == 0) && (_groupSpawned == 0)) then {_mode = 1};  // spawn-respawn
		if (_timesSpawned > 0) then
		{
			if ((_groupSpawned == 1) && (_respawnTime == 0)) then {_mode = 0}; // remove patrol from further evaluation
			if ((_timesSpawned > _maxRespawns) && (_maxRespawns != -1)) then {_mode = 0}; 			
			if ((_groupSpawned == 1) && (_respawnTime > 0)) then {_mode = 2}; // set up for respawn at a later time 
			if ((_groupSpawned == 0) && (diag_tickTime > _respawnAt)) then {_mode = 1};
		};
		switch (_mode) do
		{
			case 0: {blcl_sm_garrisonBuilding_relPos deleteAt (blcl_sm_garrisonBuilding_relPos find _x)};
			case 1: {
						
						if (true /*[_pos,staticPatrolTriggerRange] call blck_fnc_playerInRange*/) then
						{
							// ["_building","_skillLevel","_noStatics","_typesStatics","_noUnits"];
							private _group = [_building,_aiDifficulty,_noStatics,_typesStatics,_noUnits] call blck_fnc_sm_spawnBuildingGarrison_relPos;
							_timesSpawned = _timesSpawned + 1;
							_groupSpawned = 1;
							_respawnAt = 0;
							_element set[patrolGroup,_group];
							_element set[groupSpawned,1];
							_element set[timesSpawned,_timesSpawned];
							_element set[respawnAt,_respawnAt];	
							blcl_sm_garrisonBuilding_relPos set[blcl_sm_garrisonBuilding_relPos find _x,_element];
						};
					};
			case 2: {
						_groupSpawned = 0;
						_respawnAt = diag_tickTime + _respawnTime;
						_element set[respawnAt,_respawnAt];	
						_element set[groupSpawned,_groupSpawned];
						blcl_sm_garrisonBuilding_relPos set[blcl_sm_garrisonBuilding_relPos find _x,_element];
				
					};
			default {};
		};
		
	} else {
		
		if ([_pos,staticPatrolTriggerRange] call blck_fnc_playerInRange) then
		{
			_group setVariable["playerNearAt",diag_tickTime];
			
		} else {
			if (diag_tickTime > (_group getVariable["playerNearAt",diag_tickTime]) + blck_sm_groupDespawnTime) then
			{

				_groupParameters set [2, {alive _x} count (units _group)];
				private _veh = vehicle (leader _group);
				[_veh] call blck_fnc_destroyVehicleAndCrew;
				_element set[groupParameters,_groupParameters];
				_element set[patrolGroup ,grpNull];
				_element set[timesSpawned,(_timesSpawned - 1)];
				_element set[groupSpawned,0];
				blcl_sm_garrisonBuilding_relPos set[(blcl_sm_garrisonBuilding_relPos find _x), _element];
			};
		};
	};
}forEach _sm_groups;