////////////////////////////////////////////
// Delete and change Mission Markers
// 7/10/15
// by Ghostrider-DbD-
//////////////////////////////////////////
// delete a marker

private["_markerName"];
_markerName = _this select 0;
deleteMarker _markerName;
_markerName = "label" + _markerName;
deleteMarker _markerName;
