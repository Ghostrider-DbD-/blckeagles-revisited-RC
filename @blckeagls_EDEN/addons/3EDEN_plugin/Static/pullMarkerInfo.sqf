
_cb = "";

//////////////////
//    ***   OPTIONAL  ****
//    Place a marker over your mission and configure it as you would like to to appear in the tame.
//    The marker configuration will be included in the output of this script.
//    Note **  Only the first marker placed will be processed  ** 
// 	  Configure Marker
/////////////////
/*
 _markerType = ["ELIPSE",[175,175],"GRID"];
 _markerType = ["mil_triangle",[0,0]];
*/

diag_log format["<<  ----  START  %1  ----  >>",diag_tickTime];

_allmkr = allMapMarkers;
diag_log format["_allmkr = %1",_allmkr];
if (count _allmkr == 0) then
//if !(typeName _mk isEqualTo "STRING") then 
{
	hint "No Marker Found, no Marker Definitions Will Be generated";
	uiSleep 5;
} else {

	_mk = _allmkr select 0;
	diag_log format["_mk = %1",_mk];
	systemChat format["marker shape = %1",markerShape _mk];
	systemChat format["marker type = %1",markerType _mk];
	systemChat format["marker size = %1",markerSize _mk];
	systemChat format["markerColor = %1",markerColor _mk];
	systemChat format["marker brush = %1",markerBrush _mk];
	//systemChat
	switch (toUpper(markerShape _mk)) do
	{
		case "ELLIPSE": {
			_cb = _cb + format['_markerType = ["%1",%2,"%3"];%4',toUpper(MarkerShape _mk),getMarkerSize _mk,toUpper(markerBrush _mk),endl];
		};
		case "RECTANGLE": {
			_cb = _cb + format['_markerType = ["%1",%2,"%3"];%4',toUpper(MarkerShape _mk),getMarkerSize _mk,toUpper(markerBrush _mk),endl];
		};
		case "ICON": {
			_cb = _cb + format['_markerType = ["%1"];%2',getMarkerType _mk,endl];
		};
	};

	_cb = _cb + format['_markerColor = "%1";%2',markerColor _mk,endl];
	_cb = _cb + format['_markerLabel = "%1";%2',MarkerText _mk,endl];	
	_cb = _cb + format["%1%1",endl];	
};

///////////////////
// All done, notify the user and copy the output to the clipboard
///////////////////
_msg = "Marker Data organzied, formated and copied to the Clipboard";
hint _msg;
systemChat _msg;
systemChat format["_cb has %1 characters",count _cb];
copyToClipboard _cb;
diag_log "DONE";

