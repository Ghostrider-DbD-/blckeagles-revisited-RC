//////////////////////////////////////////////////////
// Attach a marker of type _marker to an object _crate
// by Ghostrider [GRG] based on code from Wicked AI for Arma 2 Dayz Epoch 
/////////////////////////////////////////////////////
/*
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_start","_maxHeight","_smokeShell","_light","_lightSource"];
params[["_crate",objNull],["_time",60]]; 

_smokeShell = selectRandom ["SmokeShellOrange","SmokeShellBlue","SmokeShellPurple","SmokeShellRed","SmokeShellGreen","SmokeShellYellow"];
_lightSource = selectRandom ["Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"];
_light  = objNull;
_smoke = _smokeShell createVehicle getPosATL _crate;
_smoke setPosATL (getPosATL _crate);
_smoke attachTo [_crate,[0,0,(0.5)]]; // put the smoke a fixed distance above the top of any object to make it as visible as possible
if(sunOrMoon < 0.2) then
{
	_light = _lightSource createVehicle getPosATL _crate;
	_light setPosATL (getPosATL _crate);
	_light attachTo [_crate,[0,0,(0.55)]];
};

blck_illuminatedCrates  pushBack [_crate,_smoke,_light,_smokeShell,_lightSource,diag_tickTime + 120, diag_tickTime + 300];	
