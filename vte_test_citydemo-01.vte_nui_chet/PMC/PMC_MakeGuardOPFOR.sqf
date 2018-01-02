
private ["_grp","_respawnpoint","_targetpoint"];

_respawnpoint = _this select 0;
_targetpoint = _this select 1;

_grp=objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

"VTE_vcofficer" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_vcsoldier4" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_vcmg" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_vcmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_vcrpg" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_vcmedic" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_vcsoldier3" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_vcsoldier" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_vcsoldier2" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "FULL";
_grp setFormation "WEDGE";

_grp addWaypoint [_targetpoint, 20];
[_grp, 1] setWaypointBehaviour "AWARE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "FULL";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "GUARD";
