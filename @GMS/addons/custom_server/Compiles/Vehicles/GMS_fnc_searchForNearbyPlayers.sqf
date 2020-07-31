/*
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
params["_vehicle","_group","searchRadius","_detectionOdds"];
private["_nearbyPlayers","_groupLeader","_knowsAbout","_cansee"];
_groupLeader = leader _group;
_nearbyPlayers = [position _vehicle, _vehicle getVariable["blck_vehicleSearchRange",500]] call blck_fnc_nearestPlayers;
{
	_player = _x;
	if (random(1) < _detectionOdds) then 
	{
		_cansee = [objNull, "VIEW"] checkVisibility [eyePos _x, _player];
			if (_cansee > 0) then
			{
				_knowledgeGained = (_searchRadius  - (_x distance _groupLeader))/_searchRadius;
				_knowsAbout = _x knowsAbout _player;
				_groupLeader reveal [_x, _knowsAbout + _knowledgeGained];
			};
		}foreEach crew _vehicle;
	};
}forEach _nearbyPlayers;