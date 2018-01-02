/*

	PMC Count Group Units

Syntax:
_countUnits = compile preprocessFileLineNumbers "PMC\PMC_Count_Group_Units.sqf";

Requires:
-

Returns:
number of units in a group

*/

private
[
	"_grp",
	"_units"
];

_grp = _this select 0;

_units = ({alive _x} count units _grp);

_units
