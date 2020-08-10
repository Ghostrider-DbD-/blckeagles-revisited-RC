


diag_log format["Dynamic Export called at %1",diag_tickTime];
private _lines = [];
private _lineBreak = toString [10];

_lines pushBack "/*";
_lines pushBack "	Ourput from GRG Plugin for blckeagls";
_lines pushBack "	For Credits and Acknowledgements see the Readme and comments";
_lines pushBack "*/";
_lines pushBack "";
_lines pushBack '#include "\q\addons\custom_server\Configs\blck_defines.hpp";';
_lines pushBack '#include "\q\addons\custom_server\Missions\privateVars.sqf";';

// As found in fn_3DENExportTerrainBuilder.sqf
uiNameSpace setVariable ["Display3DENCopy_data", ["dynamicMission.sqf", _lines joinString _lineBreak]];
(findDisplay 313) createdisplay "Display3DENCopy";


