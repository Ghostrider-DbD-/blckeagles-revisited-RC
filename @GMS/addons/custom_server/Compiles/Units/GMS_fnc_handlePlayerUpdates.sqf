/*
	calculate a reward player for AI Kills in crypto.
	Code fragment adapted from VEMF
	call as [_unit,_killer] call blck_fnc_handlePlayerUpdates;
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

_fn_doUpdates = {
	params["_player"];
	private _lastkill = _player getVariable["blck_lastkill",diag_tickTime];
	_player setVariable["blck_lastkill",diag_tickTime];
	private _kills = (_player getVariable["blck_kills",0]) + 1;
	if ((diag_tickTime - _lastkill) < 240) then
	{
		_player setVariable["blck_kills",_kills];
	} else {
		_player setVariable["blck_kills",0];
	};

	if (toLower(blck_modType) isEqualTo "epoch") then
	{
		#define maxReward 2500
		private _distanceBonus = floor((_unit distance _player)/100);
		private _killstreakBonus = 3 * (_player getVariable["blck_kills",0]);
		private _reward = 25 + _distanceBonus + _killstreakBonus;
		[_player,_reward ] call blck_fnc_giveTakeCrypto;
		if (blck_useKillScoreMessage) then
		{
			[["showScore",[_reward,"",_kills],""],[_player]] call blck_fnc_messageplayers;
		};

		// SUggestion to update Epoch player stats from He-Man
		[_killer, "AIKills", 1, true] call EPOCH_server_updatePlayerStats;		
	};
	if (toLower(blck_modType) isEqualTo "exile") then
	{
		private _distanceBonus = floor((_unit distance _player)/100);
		private _killstreakBonus = 3 * (_player getVariable["blck_kills",0]);
		private _respectGained = 25 + _distanceBonus + _killstreakBonus;
		private _score = _player getVariable ["ExileScore", 0];
		_score = _score + (_respectGained);
		_player setVariable ["ExileScore", _score];
		format["setAccountScore:%1:%2", _score,getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
		private _newKillerFrags = _player getVariable ["ExileKills", 0];
		_newKillerFrags = _newKillerFrags + 1;
		_player setVariable ["ExileKills", _newKillerFrags];
		format["addAccountKill:%1", getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
		_player call ExileServer_object_player_sendStatsUpdate;
		if (blck_useKillScoreMessage) then
		{
			[["showScore",[_respectGained,_distanceBonus,_kills]], [_player]] call blck_fnc_messageplayers;
		};
	};
	if (toLower(blck_modType) isEqualTo "default") then 
	{
		private _newKillerFrags = _player getVariable ["ExileKills", 0];
		_newKillerFrags = _newKillerFrags + 1;
		_player setVariable ["ExileKills", _newKillerFrags,true];
		if (blck_useKillScoreMessage) then
		{
			[["showScore",[_respectGained,_distanceBonus,_kills]], [_player]] call blck_fnc_messageplayers;
		};
	};
	if (blck_useKillMessages) then
	{
		private _weapon = currentWeapon _player;
		_killstreakMsg = format[" %1X KILLSTREAK",_kills];
		private["_message"];
		if (blck_useKilledAIName) then
		{
			_message = format["[blck] %2: killed by %1 from %3m",name _player,name _unit,round(_unit distance _player)];
		}else{
			_message = format["[blck] %1 killed with %2 from %3 meters",name _player,getText(configFile >> "CfgWeapons" >> _weapon >> "DisplayName"), round(_unit distance _player)];
		};
		_message =_message + _killstreakMsg;
		[["aikilled",_message,"victory"],allPlayers] call blck_fnc_messageplayers;
	};	
	
};

params["_unit","_killer"];
private _killerType = _killer call BIS_fnc_objectType; //     anObject call BIS_fnc_objectType 

if ((_killerType select 0 )isEqualTo "Vehicle") then 
{
	{
		_player = _killer;
		if (getPlayerUID(_x) isEqualTo getPlayerUID(_killer)) exitWith {
			[_x] call _fn_doUpdates;
		};

	}forEach (crew (vehicle _killer));
} else {
	[_killer] call _fn_doUpdates;
};

