/*
	by Ghostrider
	8-13-16
*/

private["_launcher","_launcherRounds","_objects","_weapons","_container"];
params["_unit"];  // = _this select 0;
_launcher = _unit getVariable ["Launcher",""];
//diag_log format["#- removeLauncher.sqf -# called for unit %1",_unit];
if (blck_launcherCleanup) then 
{
	if (_launcher != "") then 
	{
		//diag_log format["!----! removing launchers for unit %1",_unit];
		_launcherRounds = getArray (configFile >> "CfgWeapons" >> _Launcher >> "magazines"); //0;
		_unit removeWeapon _Launcher;
		 removeBackpack _unit;
		 /*
		{
			if(_x in _launcherRounds) then {
				_unit removeMagazine _x;
			};
		} count magazines _unit;
		private["_objects","_weapons","_container"];
		{
			// https://community.bistudio.com/wiki/weaponsItems
			if (_launcher in (weaponsItems _x select 1) then {deleteVehicle _x};
		}forEach nearestObjects [getPos _unit,["WeaponHolderSimulated", "GroundWeaponHolder"],7];
		*/
	};
}
else
{
	if (_launcher != "") then 
	{
		{
			deleteVehicle _x;
		}forEach nearestObjects [getPos _unit,["WeaponHolderSimulated", "GroundWeaponHolder"],7];
		_unit addWeaponGlobal _launcher;
	};
};

