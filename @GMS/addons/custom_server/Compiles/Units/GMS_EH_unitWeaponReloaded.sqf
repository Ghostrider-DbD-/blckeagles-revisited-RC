/*

    Handle case where a unit reloads weapon.
    This was used in place of fired event handlers to add realism and deal with issues with the arma engine post v1.64
    By Ghostrider [GRG]

	https://community.bistudio.com/wiki/Arma_3:_Event_Handlers/Reloaded
	
        this addEventHandler ["Reloaded", {
            params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
        }];
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#define unit _this select 0
#define newMagazine _this select 3 select 0
(unit) addMagazine (newMagazine);


