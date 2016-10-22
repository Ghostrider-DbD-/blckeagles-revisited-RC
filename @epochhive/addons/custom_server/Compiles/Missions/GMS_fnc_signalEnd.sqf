//////////////////////////////////////////////////////
// Attach a marker of type _marker to an object _crate
// by Ghostrider-DBD- based on code from Wicked AI for Arma 2 Dayz Epoch 
// Last modified 8/2/15
/////////////////////////////////////////////////////

	private ["_start","_bbr","_p1","_p2","_maxHeight","_signalCrate","_smokeShell","_light","_lightSource"];
	params["_crate",["_time",60]]; 
	_start = diag_tickTime;
	//diag_log format["signalEnd.sqf: _this = %1, _crate = %2",_this, _crate];
	_smokeShell = selectRandom ["SmokeShellOrange","SmokeShellBlue","SmokeShellPurple","SmokeShellRed","SmokeShellGreen","SmokeShellYellow"];
	_lightSource = selectRandom ["Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"];
	//diag_log format["signalEnd.sqf:  _smokeShell = %1",_smokeShell];
	// Determine crate height. Method is from:
	// https://community.bistudio.com/wiki/boundingBoxReal
	_bbr = boundingBoxReal _crate;
	_p1 = _bbr select 0;
	_p2 = _bbr select 1;
	_maxHeight = abs ((_p2 select 2) - (_p1 select 2));	
	
	while {diag_tickTime - _start < (_time)} do  // loop for 5 min accounting for the fact that smoke grenades do not last very long
	{
		_smoke = _smokeShell createVehicle getPosATL _crate;
		_smoke setPosATL (getPosATL _crate);
		_smoke attachTo [_crate,[0,0,(_maxHeight + 0.35)]]; // put the smoke a fixed distance above the top of any object to make it as visible as possible
		if(sunOrMoon < 0.2) then
		{
			_light = _lightSource createVehicle getPosATL _crate;
			_light setPosATL (getPosATL _crate);
			_light attachTo [_crate,[0,0,(_maxHeight + 0.35)]];
		};
		uiSleep 120;
		detach _smoke;
		deleteVehicle _smoke;
		if(sunOrMoon < 0.2) then
		{
			detach _light;
			deleteVehicle _light;
		};
	};
