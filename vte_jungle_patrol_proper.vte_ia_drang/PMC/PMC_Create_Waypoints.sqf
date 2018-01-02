/*

Syntax:
call compile preprocessFileLineNumbers "PMC\PMC_Create_Waypoints.sqf";

Example:
[group, targetpoint, waypoint_random_radius] call PMC_Create_Waypoints;

*/
PMC_Create_Waypoints =
{
        private ["_grp","_targetpoint","_waypointRanPosit"];
/*
this waypoint setup is completely different from the good old OFP version,
where groups were recycled after arriving to objective, they were then tasked
into another objective and this was looped endlessly.

However as you can see below, this only sends them into the target objective and
then they will stay there in guard mode. This will most likely resulting a long
mission ending up being quite random as the groups are running around after fights.
*/
	// waypoints, we add couple to make patrol area.
	// first waypoint
	_grp = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;
        
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 1] setWaypointBehaviour "SAFE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "LIMITED";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "MOVE";
	[_grp, 1] setWaypointTimeout [60*2, 0, 60*20];

	// second waypoint
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 2] setWaypointType "MOVE";
	[_grp, 2] setWaypointTimeout [60*2, 0, 60*20];

	// guard waypoint, this was cycle before
	_grp addWaypoint [_targetpoint, 0];
	[_grp, 3] setWaypointType "GUARD";
};
