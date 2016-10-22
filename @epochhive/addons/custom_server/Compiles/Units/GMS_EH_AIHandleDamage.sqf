/*


    unit: Object - Object the event handler is assigned to.
    selectionName: String - Name of the selection where the unit was damaged. "" for over-all structural damage, "?" for unknown selections.
    damage: Number - Resulting level of damage for the selection.
    source: Object - The source unit that caused the damage.
    projectile: String - Classname of the projectile that caused inflicted the damage. ("" for unknown, such as falling damage.)

(Since Arma 3 v 1.49.131802)

    hitPartIndex: Number - Hit part index of the hit point, -1 otherwise.
*/

private ["_unit","_killer","_group","_deleteAI_At"];
_unit = _this select 0;
_source = _this select 3;

if (isPlayer _source) then {
	[_unit,_source] call GRMS_fnc_alertGroup;
};
