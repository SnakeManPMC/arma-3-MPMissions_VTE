private ["_respawnpoint","_targetpoint","_grp","_waypointRanPosit"];
_respawnpoint = _this select 0;
_targetpoint = _this select 1;
_waypointRanPosit = _this select 2;
_grp = objNull;
_grp = createGroup west;
waitUntil {!(isNull _grp)};

// US Army squad
"VTE_armyofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"VTE_armywrto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_armysoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_armywmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"VTE_armywlaw" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_armywgl" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_armywlaw" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_armywmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_armywmedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _grp;

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "FULL";
_grp setFormation "WEDGE";

_grp addWaypoint [_targetpoint, _waypointRanPosit];
[_grp, 1] setWaypointBehaviour "AWARE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "FULL";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "GUARD";

PMC_cu = PMC_cu + 9;
publicVariable "PMC_cu";
