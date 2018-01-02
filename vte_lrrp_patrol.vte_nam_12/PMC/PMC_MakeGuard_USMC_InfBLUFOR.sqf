private ["_respawnpoint","_targetpoint","_waypointRanPosit","_grp"];
_respawnpoint = _this select 0;
_targetpoint = _this select 1;
_waypointRanPosit = _this select 2;
_grp = objNull;
_grp = createGroup west;
waitUntil {!(isNull _grp)};

// USMC squad
"VTE_soldierwo" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"VTE_soldierwrto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_soldierw" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_soldierwmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"VTE_soldierwlaw" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_soldierwgl" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_soldierwat" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_soldierwmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_soldierwmedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;

_grp setbehaviour "aware";
_grp setcombatmode "red";
_grp setspeedmode "full";
_grp setformation "wedge";

_grp addWaypoint [_targetpoint, _waypointRanPosit];
[_grp, 1] setWaypointBehaviour "AWARE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "FULL";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "GUARD";

PMC_cu = PMC_cu + 9;
publicVariable "PMC_cu";
