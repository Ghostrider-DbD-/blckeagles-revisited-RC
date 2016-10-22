// Protect Vehicles from being cleaned up by the server
// Last modified 2/26/16 by Ghostrider-DBD-

params["_Vehicle"];

private["_modType"];
_modType = call blck_getModType;
switch (_ModType) do {
	case "_modType":
				{
					diag_log format["GMS_fnc_protectVehicle::  Tokens set for vehicle %1",_Vehicle];
					//_Vehicle call EPOCH_server_vehicleInit;
					_Vehicle call EPOCH_server_setVToken;
				};
};


