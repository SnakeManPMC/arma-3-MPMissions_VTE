/*

	Single player unit / group removal script

Syntax:
this = [unitname] execVM "PMC\PMC_SP_Group_Remove.sqf";

*/
private [
	"_a","_grp"
];

_a = _this select 0;
_grp = group _a;

if (_a != player) then
{
	{
		// not really necessary to move them lower left hand corner?
		_x setPos [0,0,0];
		// kill him basically, so if he had killed scripts hooked, hes done.
		_x setDamage 1;
	} forEach units _grp;
};

// delete the group.
deleteGroup _grp;
