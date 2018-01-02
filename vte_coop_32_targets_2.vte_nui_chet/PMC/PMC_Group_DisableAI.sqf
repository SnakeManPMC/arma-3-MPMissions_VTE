
/*

	Disables AI for all group members
	
	mostly used for disabling civilian AI whom are mainly eyecandy

*/
private
[
	"_grp"
];

_grp = _this select 0;

{
	_x disableAI "TARGET";
	_x disableAI "AUTOTARGET";
} forEach units _grp;
