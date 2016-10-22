

private["_startTime"];
_startTime = diag_tickTime;
[] spawn {
	while {true} do
	{
		blck_serverFPS = diag_FPS;
		publicVariable "blck_serverFPS";
		uiSleep 3;
	};
};


