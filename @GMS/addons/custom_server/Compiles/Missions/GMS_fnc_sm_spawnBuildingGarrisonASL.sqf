

params["_building","_aiDifficultyLevel","_statics","_units"];

private _group = [blck_AI_Side,true]  call blck_fnc_createGroup;
if !(isNull _group) then 
{
	[_building,_group,_statics,_units,_aiDifficultyLevel] call blck_fnc_spawnGarrisonInsideBuilding_ATL;
};
_group
