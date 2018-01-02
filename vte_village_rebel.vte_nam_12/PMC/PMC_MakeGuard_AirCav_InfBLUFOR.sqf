private ["_respawnpoint","_targetpoint","_grp","_waypointRanPosit"];
_respawnpoint = _this select 0;
_targetpoint = _this select 1;
_waypointRanPosit = _this select 2;
_grp = objNull;
_grp = createGroup west;
waitUntil {!(isNull _grp)};

// AirCav squad
"VTE_acofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"VTE_acsoldierrto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_acsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_acsoldiermg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"VTE_acsoldierlaw" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_acsoldierm79" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_acsoldierlaw" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_acsoldiermg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_acsoldiermedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

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
