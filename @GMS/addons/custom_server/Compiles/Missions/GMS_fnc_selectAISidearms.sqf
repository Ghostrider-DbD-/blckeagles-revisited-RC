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

private _sideArms = missionNamespace getVariable[format["blck_Pistols_%1",_aiDifficultyLevel],[]];
_sideArms
