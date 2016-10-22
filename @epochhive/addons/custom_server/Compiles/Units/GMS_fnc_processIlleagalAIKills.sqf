/*
	by Ghostrider
	9-20-15
	Because this is precompiled there is less concern about keeping comments in.
*/

private["_missionType","_wasRunover","_launcher","_legal"];
params["_unit","_killer"];
//diag_log format["##-processIlleagalAIKills.sqf-## processing illeagal kills for unit %1",_unit];
_launcher = _unit getVariable ["Launcher",""];
_legal = true;

 fn_targetVehicle = {  // force AI to fire on the vehicle with launchers if equiped
	params["_vk","_unit"];
	{
		if (((position _x) distance (position _unit)) <= 350) then 
		{
			_x reveal [_vk, 4];
			_x dowatch _vk; 
			_x doTarget _vk; 
			if (_launcher != "") then 
			{	
				_x selectWeapon (secondaryWeapon _unit);
				x fireAtTarget [_vk,_launcher];
			} else {
				_x doFire _vk;		
			};
		};
	} forEach allUnits;
};

fn_applyVehicleDamage = {  // apply a bit of damage 
	private["_vd"];
	params["_vk"];
	_vk = _this select 0;
	_vd = getDammage _vk;
	_vk setDamage (_vd + blck_RunGearDamage);
};

fn_deleteAIGear = {
	params["_ai"];
	{deleteVehicle _x}forEach nearestObjects [(getPosATL _ai), ['GroundWeaponHolder','WeaponHolderSimulated','WeaponHolder'], 3];   //Adapted from the AI cleanup logic by KiloSwiss
	[_ai] call blck_fnc_removeGear;
};

fn_msgIED = {
	params["_killer"];
	blck_Message = ["IED","",0,0];
	diag_log format["fn_msgIED:: -- >> msg = %1 and owner _killer = %2",blck_Message, (owner _killer)];
	(owner _killer) publicVariableClient "blck_Message";
};

if (typeOf _killer != typeOf (vehicle _killer)) then  // AI was killed by a vehicle
{
	if(_killer == driver(vehicle _killer))then{  // The AI was runover
		if(blck_RunGear) then {  // If we are supposed to delete gear from AI that were run over then lets do it. 
			[_unit] call fn_deleteAIGear;
			if (blck_debugON) then
			{
				diag_log format["<<--->> Unit %1 was run over by %2",_unit,_killer];
			};
		};
		if (blck_VK_RunoverDamage) then {//apply vehicle damage
			[vehicle _killer] call fn_applyVehicleDamage;
			if (blck_debugON) then{diag_log format[">>---<< %1's vehicle has had damage applied",_killer];};			
			[_killer] call fn_msgIED;
		};
		[_unit, vehicle _killer] call fn_targetVehicle;
		
		_legal = false;
	};
};

if ( blck_VK_GunnerDamage &&((typeOf vehicle _killer) in blck_forbidenVehicles or (currentWeapon _killer) in blck_forbidenVehicleGuns) ) then {
	if (blck_debugON) then
	{
		diag_log format["!!---!! Unit was killed by a forbidden vehicle or gun",_unit];
	};
	
	if (blck_VK_Gear) then {[_unit] call fn_deleteAIGear;};
	[_unit, vehicle _killer] call fn_targetVehicle;
	[vehicle _killer] call fn_applyVehicleDamage;
	
	[_killer] call fn_msgIED;
	
	_legal = false;
};

_legal
