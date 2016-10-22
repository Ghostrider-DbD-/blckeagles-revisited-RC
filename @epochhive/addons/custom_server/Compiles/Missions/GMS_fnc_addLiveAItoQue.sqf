/*
	Adds a list of live AI associated with a mission to a que of live AI that will be deleted at a later time by the main thread
	call as [ [list of AI], time] call blck_fnc_addLiveAItoQue; where time is the time delay before deletion occurs
	
	by Ghostrider-DbD-
	Last modified 10-14-16
*/

params["_aiList","_timeDelay"];

blck_liveMissionAI pushback [_aiList, (diag_tickTime + _timeDelay)];

