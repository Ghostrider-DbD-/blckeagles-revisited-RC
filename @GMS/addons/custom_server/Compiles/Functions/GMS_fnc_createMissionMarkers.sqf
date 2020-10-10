/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
//#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private "_markers";
 params[
	"_markerName",  // the name used when creating the marker. Must be unique.
	"_markerPos",
	"_markerLabel",  //  Text used to label the marker
	"_markerColor",
	"_markerType",	// Use either the name of the icon or "ELLIPSE" or "RECTANGLE" where non-icon markers are used
	["_markerSize",[0,0]],
	["_markerBrush","GRID"]
 ];

if (blck_debugLevel >= 3) then 
{
	private _pList =[
		"_markerName",  // the name used when creating the marker. Must be unique.
		"_markerPos",
		"_markerLabel",
		"_markerColor",
		"_markerType",	// Use either the name of the icon or "ELLIPSE" or "RECTANGLE" where non-icon markers are used
		"_markerSize",
		"_markerBrush"
	];
	for "_i" from 0 to ((count _this) - 1) do
	{
		diag_log format["_fnc_createMarker: parameter %1 = %2",_pList select _i,_this select _i];
	}; 
};

if (toUpper(_markerType) in ["ELLIPSE","RECTANGLE"]) then // not an Icon .... 
{
	private _m = createMarker [blck_missionMarkerRootName + _markerName,_markerPos];
	_m setMarkerShape _markerType;
	_m setMarkerColor _markerColor;
	_m setMarkerBrush _markerBrush;
	_m setMarkerSize _markerSize;
	private _m2 = createMarker [blck_missionMarkerRootName + _markerName + "label", _markerPos];
	_m2 setMarkerType "mil_dot";
	_m2 setMarkerColor "ColorBlack";
	_m2 setMarkerText _markerLabel;	
	_markers = [_m,_m2];	
	//diag_log format["_fnc_createMarkers: case of ELLIPSE/RECTANGLE: _markers = %1",_markers];
} else {
	private _m = "";
	private _m2 = createMarker [blck_missionMarkerRootName + _markerName + "label", _markerPos];
	_m2 setMarkerType _markerType;
	_m2 setMarkerColor _markerColor;
	_m2 setMarkerText _markerLabel;
	_markers = [_m,_m2];
	//diag_log format["_fnc_createMarkers: case of ICON: _markers = %1",_markers];		
};

_markers