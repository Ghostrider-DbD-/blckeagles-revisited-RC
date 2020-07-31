/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_aiDifficultyLevel"];  //[["_aiDifficultyLevel",selectRandom["Red","Green"]]];

private["_sideArms"];
switch (toLower (_aiDifficultyLevel)) do
{
	case "blue": 	{_sideArms = blck_Pistols_blue};
	case "red": 	{_sideArms = blck_Pistols_red};
	case "green": 	{_sideArms = blck_Pistols_green};
	case "orange": 	{_sideArms = blck_Pistols_orange};
	default 		{_sideArms = blck_Pistols};
};
_sideArms