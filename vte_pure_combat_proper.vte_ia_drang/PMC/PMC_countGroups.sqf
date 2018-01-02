/*

	Count all groups in the provided list

Syntax:
[sideList] execVM "PMC\PMC_countGroups.sqf";

Requires:
trigger per side, covering whole mission area

Returns:
number of grups

*/

private ["_groups","_list"];

_list = _this select 0;

_groups = [];
{
	if (!(group _x in _groups)) then
	{
		_groups = _groups + [group _x];
	};
} ForEach _list;

count _groups;
