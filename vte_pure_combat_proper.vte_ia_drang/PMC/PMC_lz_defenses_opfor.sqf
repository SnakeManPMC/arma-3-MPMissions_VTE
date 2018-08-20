/*

	PMC Pure Combat "LZ Grabbing" defense guys.

*/

private ["_grp","_pos","_x"];

_pos = (_this select 0);

call compile preProcessFileLineNumbers "PMC\PMC_Create_Squad_VC.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Squad_NVA.sqf";

for [{_x = 1}, {_x <= 2}, {_x = _x + 1}] do
{
	_grp = [_pos] call PMC_Create_Squad_NVA;
	[_grp, getPos _pos] call BIS_fnc_taskDefend;

	_grp = [_pos] call PMC_Create_Squad_VC;
	[_grp, getPos _pos] call BIS_fnc_taskDefend;
};
