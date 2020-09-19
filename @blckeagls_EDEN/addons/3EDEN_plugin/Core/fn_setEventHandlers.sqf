/*
	blckeagls 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
params["_object"];

_object removeAllEventHandlers "UnregisteredFromWorld3DEN";
_object removeAllEventHandlers "RegisteredToWorld3DEN";
_object removeAllEventHandlers "Dragged3DEN";
_object addEventHandler ["Dragged3DEN",{_this call blck3DEN_fnc_onDrag;}];
_object addEventHandler ["UnregisteredFromWorld3DEN",{_this call blck3DEN_fnc_onUnregister;}];	
_object addEventHandler ["RegisteredToWorld3DEN", {_this call blck3DEN_fnc_onRegistered;}];	