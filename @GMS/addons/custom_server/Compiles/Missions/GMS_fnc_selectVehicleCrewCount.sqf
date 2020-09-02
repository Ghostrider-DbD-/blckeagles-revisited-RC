/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params["_diff"];
private ["_count"];
switch (toLower(_diff)) do
{
	case "blue": {_count = blck_vehCrew_blue};
	case "red": {_count = blck_vehCrew_red};
	case "green": {_count = blck_vehCrew_green};
	case "orange": {_count = blck_vehCrew_orange};
};

_count
