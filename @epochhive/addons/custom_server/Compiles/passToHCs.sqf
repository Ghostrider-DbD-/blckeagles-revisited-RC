/*
 * passToHCs.sqf
 *
 * In the mission editor, name the Headless Clients "HC", "HC2", "HC3" without the quotes
 *
 * In the mission init.sqf, call passToHCs.sqf with:
 * execVM "passToHCs.sqf";
 *
 * It seems that the dedicated server and headless client processes never use more than 20-22% CPU each.
 * With a dedicated server and 3 headless clients, that's about 88% CPU with 10-12% left over.  Far more efficient use of your processing power.
 *
 */

if (!isServer) exitWith {};

diag_log "passToHCs: Started";

//waitUntil {!isNil "HC"};
//waitUntil {!isNull HC};
_wait = true;
while {_wait} do{
	if (isNil "HC") then
	{
		diag_log "passToHCs:  HC not connected";} else 
	{
		diag_log format["passToHCs:  owner HC = %1", owner HC];
		_wait = false;
	};
	sleep 5;
};


_HC_ID = -1; // Will become the Client ID of HC
_HC2_ID = -1; // Will become the Client ID of HC2
_HC3_ID = -1; // Will become the Client ID of HC3
rebalanceTimer = 60;  // Rebalance sleep timer in seconds
cleanUpThreshold = 200; // Threshold of number of dead bodies + destroyed vehicles before forcing a clean up

diag_log format["passToHCs: First pass will begin in %1 seconds", rebalanceTimer];

while {true} do {
  // Rebalance every rebalanceTimer seconds to avoid hammering the server
  uisleep rebalanceTimer;

  // Do not enable load balancing unless more than one HC is present
  // Leave this variable false, we'll enable it automatically under the right conditions  
  _loadBalance = false;

   // Get HC Client ID else set variables to null
   try {
    _HC_ID = owner HC;

    if (_HC_ID > 2) then {
      //diag_log format ["passToHCs: Found HC with Client ID %1", _HC_ID];
    } else { 
      //diag_log "passToHCs: [WARN] HC disconnected";

      HC = objNull;
      _HC_ID = -1;
    };
  } catch { diag_log format ["passToHCs: [ERROR] [HC] %1", _exception]; HC = objNull; _HC_ID = -1; };

  // Get HC2 Client ID else set variables to null
  if (!isNil "HC2") then {
    try {
      _HC2_ID = owner HC2;

      if (_HC2_ID > 2) then {
        //diag_log format ["passToHCs: Found HC2 with Client ID %1", _HC2_ID];
      } else { 
        //diag_log "passToHCs: [WARN] HC2 disconnected";

        HC2 = objNull;
        _HC2_ID = -1;
      };
    } catch { diag_log format ["passToHCs: [ERROR] [HC2] %1", _exception]; HC2 = objNull; _HC2_ID = -1; };
  };

  // Get HC3 Client ID else set variables to null
  if (!isNil "HC3") then {
    try {
      _HC3_ID = owner HC3;

      if (_HC3_ID > 2) then {
        //diag_log format ["passToHCs: Found HC2 with Client ID %1", _HC3_ID];
      } else { 
        //diag_log "passToHCs: [WARN] HC3 disconnected";

        HC3 = objNull;
        _HC3_ID = -1;
      };
    } catch { diag_log format ["passToHCs: [ERROR] [HC3] %1", _exception]; HC3 = objNull; _HC3_ID = -1; };
  };

  // If no HCs present, wait for HC to rejoin
  //if ( (isNull HC) && (isNull HC2) && (isNull HC3) ) then { waitUntil {!isNull HC}; };  

  // Check to auto enable Round-Robin load balancing strategy
  //if ( (!isNull HC && !isNull HC2) || (!isNull HC && !isNull HC3) || (!isNull HC2 && !isNull HC3) ) then { _loadBalance = true; };

  if ( _loadBalance ) then {
    //diag_log "passToHCs: Starting load-balanced transfer of AI groups to HCs";
  } else {
    // No load balancing
    //diag_log "passToHCs: Starting transfer of AI groups to HC";
  };

  // Determine first HC to start with
  _currentHC = 0;

  if (!isNull HC) then { _currentHC = 1; } else { 
    if (!isNull HC2) then { _currentHC = 2; } else { _currentHC = 3; };
  };

  // Pass the AI
  _numTransfered = 0;
  {
    _swap = false;

    // If a player is in this group, don't swap to an HC
	
	// If the group belongs to the blckeagls mission system then transfer it to the HC

	if (_x getVariable["blck_group",false]) then {
		//diag_log format["group belongs to blckeagls mission system so time to transfer it"];
		_id = groupOwner _x;
		//diag_log format["Owner of group %1 is %2",_x,_id];
		if (_id > 2) then 
		{
			//diag_log format["group %1 is already assigned to an HC with _id of %2",_x,_id];
			_swap = false;
		} else {
			//diag_log format["group %1 should be moved to an HC",_x];
			_swap = true;
		};
		
	} else {
		//diag_log format["group %1 does not belong to blckeagls mission system",_x];
	};
    // If load balance enabled, round robin between the HCs - else pass all to HC
    if ( _swap ) then {
      _rc = false;

      if ( _loadBalance ) then {
        switch (_currentHC) do {
          case 1: { _rc = _x setGroupOwner _HC_ID; if (!isNull HC2) then { _currentHC = 2; } else { _currentHC = 3; }; };
          case 2: { _rc = _x setGroupOwner _HC2_ID; if (!isNull HC3) then { _currentHC = 3; } else { _currentHC = 1; }; };
          case 3: { _rc = _x setGroupOwner _HC3_ID; if (!isNull HC) then { _currentHC = 1; } else { _currentHC = 2; }; };
          default { diag_log format["passToHCs: [ERROR] No Valid HC to pass to.  _currentHC = %1", _currentHC]; };
        };
      } else {
        switch (_currentHC) do {
          case 1: { _rc = _x setGroupOwner _HC_ID; };
          case 2: { _rc = _x setGroupOwner _HC2_ID; };
          case 3: { _rc = _x setGroupOwner _HC3_ID; };
          default { diag_log format["passToHCs: [ERROR] No Valid HC to pass to.  _currentHC = %1", _currentHC]; };
        };
      };

      // If the transfer was successful, count it for accounting and diagnostic information
      if ( _rc ) then { _numTransfered = _numTransfered + 1; };
    };
  } forEach (allGroups);

  if (_numTransfered > 0) then {
    // More accounting and diagnostic information

    diag_log format ["passToHCs: Transfered %1 AI groups to HC(s)", _numTransfered];

    _numHC = 0;
    _numHC2 = 0;
    _numHC3 = 0;

    {
      switch (owner ((units _x) select 0)) do {
        case _HC_ID: { _numHC = _numHC + 1; };
        case _HC2_ID: { _numHC2 = _numHC2 + 1; };
        case _HC3_ID: { _numHC3 = _numHC3+ 1; };
      };
    } forEach (allGroups);

    if (_numHC > 0) then { diag_log format ["passToHCs: %1 AI groups currently on HC", _numHC]; };
    if (_numHC2 > 0) then { diag_log format ["passToHCs: %1 AI groups currently on HC2", _numHC2]; };
    if (_numHC3 > 0) then { diag_log format ["passToHCs: %1 AI groups currently on HC3", _numHC3]; };

    diag_log format ["passToHCs: %1 AI groups total across all HC(s)", (_numHC + _numHC2 + _numHC3)];
  } else {
    diag_log "passToHCs: No rebalance or transfers required this round";
  };

};