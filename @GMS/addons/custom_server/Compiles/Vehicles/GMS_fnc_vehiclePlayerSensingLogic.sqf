/*
	By Ghostrider [GRG]
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
// GMS_fnc_vehiclePlayerSensingLogic.sqf
// No params

{
	_group = group driver _vehicle;
	_searchRadius = _vehicle getVariable["blck_vehicleSearchRadius",800];
	_detectionOdds = _vehicle getVariable["blck_vehiclePlayerDetectionOds",0.5];
	[_vehicle,_group,_searchRadius,_detectionOdds] call blck_fnc_senseNearbyPlayers;
}forEach blck_monitoredVehicles;