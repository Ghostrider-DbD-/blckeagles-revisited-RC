/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";


for "_i" from 1 to (count blck_hiddenTerrainObjects) do 
{
	if (_i > (count blck_hiddenTerrainObjects)) exitWith {};
	private _el = blck_hiddenTerrainObjects deleteAt 0;
	diag_log format["_restoreHiddenObjects: _el = %1 | blck_hiddenTerrainObjects = %2",_el,blck_hiddenTerrainObjects];
	_el params["_obj","_timeout"];
	diag_log format["_restoreHiddenObjects: _timeOut = %1 | _obj = %2",_timeout,_obj];
	if (diag_tickTime > _timeOut) then 
	{
		{_x hideObjectGlobal false} forEach _obj;
	} else {
		blck_hiddenTerrainObjects pushBack _el;
	};
};