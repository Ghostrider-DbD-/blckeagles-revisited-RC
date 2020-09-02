/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

params[["_message","Unknown Message"],["_code",""]];

switch (toLower _code) do 
{
	case "error": {_message = format["[blckeagls]  <ERROR>  %1",_message]};
	case "warning": {_message = format["[blckeagls] <WARNING>  %1",_message]};
	default {_message = format["[blckeagls] :: %1",_message]};
};
diag_log _message;