// enemy patrol waypoint guys, NVA
private ["_grp","_respawnpoint","_targetpoint","_waypointRanPosit"];
_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

// choose random respawn location
_respawnpoint = [] call PMC_Choose_Respawn_Posit;
_targetpoint = _this select 0;
_waypointRanPosit = _this select 1;

"VTE_NVAofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"VTE_NVArto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"VTE_NVArpg" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_NVAmedic" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_x allowFleeing 0;
} foreach units _grp;
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "FULL";
_grp setFormation "WEDGE";

// waypoints, we add couple to make patrol area
// first
_grp addWaypoint [_targetpoint, _waypointRanPosit * 2];
[_grp, 1] setWaypointBehaviour "SAFE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "LIMITED";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "MOVE";
[_grp, 1] setWaypointCompletionRadius 50;
[_grp, 1] setWaypointTimeout [60 * 2, 0, 60 * 20];

// second
_grp addWaypoint [_targetpoint, _waypointRanPosit * 2];
[_grp, 2] setWaypointType "MOVE";
[_grp, 2] setWaypointCompletionRadius 50;
[_grp, 2] setWaypointTimeout [60 * 2, 0, 60 * 20];

// cycle
_grp addWaypoint [_targetpoint, 0];
[_grp, 3] setWaypointType "CYCLE";
[_grp, 3] setWaypointCompletionRadius 50;
