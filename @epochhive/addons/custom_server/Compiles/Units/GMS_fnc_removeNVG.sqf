/*
	by Ghostrider
	8-13-16
*/
params["_unit"];
//diag_log format["+--+ removing NVG for unit %1",_unit];

if (blck_useNVG) then
{
	if (_unit getVariable ["hasNVG",false]) then
	{
		
		_unit unassignitem "NVGoggles"; _unit removeweapon "NVGoggles";
	};
};
