private
[
	"_grp",
	"_targetPoint"
];
_grp = _this select 0;

// send out the editor groups
_targetPoint = call PMC_Select_Target;
_grp setbehaviour "AWARE";
_grp setcombatmode "RED";
_grp setspeedmode "NORMAL";
_grp setformation "WEDGE";
_grp addWaypoint [_targetpoint, 100];
[_grp, 1] setWaypointBehaviour "AWARE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "FULL";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "GUARD";
[_grp, 1] setWaypointCompletionRadius 50;
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;
[_grp] execVM "PMC\PMC_groupRecycle.sqf";
