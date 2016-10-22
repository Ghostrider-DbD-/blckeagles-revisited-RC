// time.sqf
// by CRE4MPIE
// GamersInc.NET 2015
// Creds to AWOL, A3W, LouD for inspiration

private["_startTime"];
_startTime = diag_tickTime;
if (!isServer) exitWith {};
diag_log "[blckeagls] Time Acceleration Begun ----- >>>>>";
_world = toLower format ["%1", worldName];
private["_nightAccel","_dayAccel","_duskAccel"];
switch (_world) do {
	case "altis":{_nightAccel = 3;_dayAccel=0.5; _duskAccel = 3;};
	case "napf":{_nightAccel = 12; _dayAccel = 2;_duskAccel = 6;};
	case "namalsk":{_nightAccel = 12; _dayAccel = 2;_duskAccel = 6;};
	case "tanoa":{_nightAccel = 12; _dayAccel = 3.2;_duskAccel = 6;};
};

while {true} do
{
	switch (sunOrMoon) do {
		case {sunOrMoon < 0.1}: {setTimeMultiplier _nightAccel; diag_log format["time accel updated to %1; sunOrMoon = %2; time of day = %3",_nightAccel,sunOrMoon,dayTime];};
		case {sunOrMoon > 0.5}: {setTimeMultiplier _dayAccel;diag_log format["time accel updated to %1; sunOrMoon = %2; time of day = %3",_dayAccel,sunOrMoon,dayTime];};
		default {setTimeMultiplier _duskAccel;diag_log format["time accel updated to %1; sunOrMoon = %2; time of day = %3",_duskAccel,sunOrMoon,dayTime];};
	};
	uiSleep 300;
};
diag_log format["Time Acceleration Module Loaded in %1 seconds",(diag_tickTime - _startTime)];

