/*

	PMC Plot Waypoints, long distance waypoint plotting.

Syntax:
_PMC_plotwaypoints = compile preprocessFileLineNumbers "PMC\PMC_plotWaypoints.sqf";
_wp = [group, start, end, waypoint completion radius, max distance between waypoints] call _PMC_plotwaypoints;

Returns:
last waypoint number

Requires:
-

*/

private
[
	"_ActStep",
	"_dX",
	"_dY",
	"_grp",
	"_lastWaypoint",
	"_maxDistance",
	"_posX",
	"_posY",
	"_startingPoint",
	"_SubSteps",
	"_targetpoint",
	"_waypointCompletionRadius",
	"_Xend",
	"_Xstart",
	"_Yend",
	"_Ystart"
];

_grp = _this select 0;
_startingPoint = _this select 1;
_targetpoint = _this select 2;
_waypointCompletionRadius = _this select 3;
_maxDistance = _this select 4;

// how many meters is the minimum needed to start plot waypoints
// 6km is roughly the decent amount, in desert terrain even this is short
// but more dense vegetated terrains it is cool amount.

// if we are too close to plot any waypoints, exit and return 0.
if (_startingPoint distance _targetpoint < _maxDistance) exitWith
{
	diag_log format["PMC_plotWaypoints early exit, distance only: %1 m. Returning waypoints 0.", (_targetpoint distance _startingPoint)];
	_lastWaypoint = 0;
	_lastWaypoint
};

_Xend = _targetpoint select 0;
_Yend = _targetpoint select 1;
_Xstart = _startingPoint select 0;
_Ystart = _startingPoint select 1;

// umm this tries to make the substeps little less, 
// but still dynamic according to the distance to travel.
_SubSteps = floor ( (_startingPoint distance _targetpoint) / _maxDistance );

_dX = _Xend - _Xstart;
_dY = _Yend - _Ystart;
_ActStep = 0;
_posX = 0;
_posY = 0;

while { _ActStep < _SubSteps } do
{
	_ActStep = _ActStep + 1;
	_posX = _Xstart + (_dX * _ActStep / _SubSteps);
	_posY = _Ystart + (_dY * _ActStep / _SubSteps);
	_grp addWaypoint [[_posX, _posY], 0];
	// not sure if this MOVE part is necessary, at least after the initial waypoint?
	[_grp, _ActStep] setWaypointType "MOVE";
	[_grp, _ActStep] setWaypointCompletionRadius _waypointCompletionRadius;
};

diag_log format
[
	"PMC_plotWaypoints _grp: %1, _targetpoint: %2, _startingPoint: %3, _waypointCompletionRadius: %4, distance: %5 m and %6 WPs created.",
	_grp,
	_targetpoint,
	_startingPoint,
	_waypointCompletionRadius,
	(_targetpoint distance _startingPoint),
	_ActStep
];

// return how many waypoints we did, which should be the 
// latest correct waypoint number?
_ActStep
