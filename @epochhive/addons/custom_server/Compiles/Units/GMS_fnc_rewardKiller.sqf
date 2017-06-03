
/*
	calculate a reward player for AI Kills in crypto.
	Code fragment adapted from VEMF
	call as [_unit,_killer] call blck_fnc_rewardKiller;
	Last modified 1/22/17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_unit","_killer"];
//diag_log format["rewardKiller::  _unit = %1 and _killer %2",_unit,_killer];

private["_modType","_reward","_maxReward","_dist","_killstreakReward","_distanceBonus","_newKillerScore","_newKillerFrags","_money"];
_modType = call blck_fnc_getModType;

diag_log format["[blckeagles] rewardKiller:: - _modType = %1",_modType];
if (_modType isEqualTo "Epoch") exitWith {};  // Have players pull crypto from AI bodies now that this feature is available.
/*
if (_modType isEqualTo "Epoch") then
{
	//diag_log "calculating reward for Epoch";
	
	if ( (vehicle _killer) in blck_forbidenVehicles || (currentWeapon _killer) in blck_forbidenVehicleGuns ) then 
	{
		_reward = 0;
	}
	else
	{
	// Give the player money for killing an AI
		_maxReward = 50;
		_dist = _unit distance _killer;
		_reward = 0;

		if (_dist < 50) then { _reward = _maxReward - (_maxReward / 1.25); _reward };
		if (_dist < 100) then { _reward = _maxReward - (_maxReward / 1.5); _reward };
		if (_dist < 800) then { _reward = _maxReward - (_maxReward / 2); _reward };
		if (_dist > 800) then { _reward = _maxReward - (_maxReward / 4); _reward };
		
		private _killstreakReward=+(_kills*2);
		//diag_log format["fnd_rewardKiller:: _bonus returned will be %1",_reward];
		if (blck_addAIMoney) then
		{
			[_killer,_reward + _killstreakReward] call blck_fnc_giveTakeCrypto;
		};
		if (blck_useKillScoreMessage) then
		{
			[["showScore",[_reward,"",_kills],""],[_killer]] call blck_fnc_messageplayers;
		};
	};
};
*/
/*
_player setVariable ["ExileHunger", _data select 4];
_player setVariable ["ExileThirst", _data select 5];
_player setVariable ["ExileAlcohol", _data select 6]; 
_player setVariable ["ExileTemperature", _data select 44]; 
_player setVariable ["ExileWetness", _data select 45]; 
*/

if (_modType isEqualTo "Exile") then
{
	private["_distanceBonus","_overallRespectChange","_newKillerScore","_newKillerFrags","_maxReward","_money","_message"];
	/*
	// Temporary fix for the Loss of Respect Bug.
	diag_log format["GMS_fnc_rewardKiller.sqf:: _killer name = %2 | ExileScore = %1  | Kills %3",_killer getVariable [ "ExileScore", 0 ], name _killer, _killer getVariable["ExileKills",0]];
	diag_log format["GMS_fnc_rewardKiller.sqf::  _killer = %1 | vehicle _killer = %2 | objectParent _killer %3",_killer, vehicle _killer, objectParent _killer];
	diag_log format["GMS_fnc_rewardKiller.sqf::  _killer is gunner = %1 | killer is driver = %2",_killer isEqualTo gunner objectParent _killer,_killer isEqualTo driver objectParent _killer];
	diag_log format["GMS_fnc_rewardKiller.sqf::  _killer ExileOwnerUID = %1 ",_killer getVariable["ExileOwnerUID",0]]; //  ExileOwnerUID
	diag_log format["GMS_fnc_rewardKiller.sqf::  _killer ExileHunger = %1 ",_killer getVariable["ExileHunger",0]]; //  ExileOwnerUID
	diag_log format["GMS_fnc_rewardKiller.sqf::  _killer ExileThirst = %1 ",_killer getVariable["ExileThirst",0]]; //  ExileOwnerUID
	diag_log format["GMS_fnc_rewardKiller.sqf::  _killer ExileAlcohol = %1 ",_killer getVariable["ExileAlcohol",0]]; //  ExileOwnerUID
	diag_log format["GMS_fnc_rewardKiller.sqf::  _killer ExileWetness = %1 ",_killer getVariable["ExileWetness",0]]; //  ExileOwnerUID
	*/
	if ( (isPlayer _killer) && (_killer getVariable["ExileHunger",0] > 0) && (_killer getVariable["ExileThirst",0] > 0) ) then  // Temporary fix for the fact that Arma is wonky right now.
	{
		_distanceBonus = floor((_unit distance _killer)/100);
		_killstreakBonus = 3 * (_killer getVariable["blck_kills",0]);
		_respectGained = 25 + _distanceBonus + _killstreakBonus;
		_score = _killer getVariable ["ExileScore", 0];
		//diag_log format["GMS_fnc_rewardKiller.sqf:: ExileScore = %1",_killer getVariable ["ExileScore", 0]];
		_score = _score + (_respectGained);
		//diag_log format["GMS_fnc_rewardKiller.sqf:: _new = %1",_score];	
		_killer setVariable ["ExileScore", _score];
		format["setAccountScore:%1:%2", _score,getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
		_newKillerFrags = _killer getVariable ["ExileKills", 0];
		_newKillerFrags = _newKillerFrags + 1;
		_killer setVariable ["ExileKills", _newKillerFrags];
		format["addAccountKill:%1", getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
		//_message = ["showFragRequest",_respectGained];
		_killer call ExileServer_object_player_sendStatsUpdate;
		if (blck_useKillScoreMessage) then
		{
			[["showScore",[_respectGained,_distanceBonus,_kills]], [_killer]] call blck_fnc_messageplayers;
		};
	};
};


/*
	if (_overallRespectChange > 0) then {
		_score = _killer getVariable ["ExileScore", 0];
		_score = _score + _overallRespectChange;
		_killer setVariable ["ExileScore", _score];
		format["setAccountScore:%1:%2", _score,_killerPlayerUID] call ExileServer_system_database_query_fireAndForget;
		[_killer, "showFragRequest", [_killerRespectPoints]] call A3XAI_sendExileMessage;
	};
	
	//["systemChatRequest", [_killMessage]] call ExileServer_system_network_send_broadcast; //To-do: Non-global version
	_newKillerFrags = _killer getVariable ["ExileKills", 0];
	_killer setVariable ["ExileKills", _newKillerFrags + 1];
	format["addAccountKill:%1", _killerPlayerUID] call ExileServer_system_database_query_fireAndForget;

	_killer call ExileServer_object_player_sendStatsUpdate;
};
