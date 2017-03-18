/*
	By Ghostrider-DbD-
	Last Modified 3-12-17
*/
private ["_unit","_instigator"];
//diag_log format["_EH_AIHit::-->> _this = %1",_this];
_unit = _this select 0 select 0;
_instigator = _this select 0 select 3;
//diag_log format["EH_AIHit:: _units = %1 and _instigator = %2 units damage is %3",_unit,_instigator, damage _unit];
if (!(alive _unit)) exitWith {};
if (!(isPlayer _instigator)) exitWith {};
[_unit,_instigator] call blck_fnc_alertNearbyLeader;
if (_unit getVariable ["hasHealed",false]) exitWith {};
if ((damage _unit) > 0.1 ) then
{
		//diag_log format["_EH_AIHit::-->> Healing unit %1",_unit];
		_unit setVariable["hasHealed",true,true];
		_unit  addMagazine "SmokeShellOrange";
		_unit fire "SmokeShellMuzzle";
		_unit addItem "FirstAidKit";
		_unit action ["HealSoldierSelf", soldier1];
};
