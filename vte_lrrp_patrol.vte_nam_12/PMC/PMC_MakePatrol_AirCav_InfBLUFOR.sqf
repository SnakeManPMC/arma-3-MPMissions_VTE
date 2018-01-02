private ["_respawnpoint","_targetpoint","_waypointRanPosit","_grp"];
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
} foreach units _grp;

_grp setbehaviour "safe";
_grp setcombatmode "red";
_grp setspeedmode "limited";
_grp setformation "wedge";

// waypoints, we add couple to make patrol area
// first
_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
[_grp, 1] setWaypointBehaviour "SAFE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "LIMITED";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "MOVE";
[_grp, 1] setWaypointTimeout [60*2, 0, 60*20];

// second
_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
[_grp, 2] setWaypointType "MOVE";
[_grp, 2] setWaypointTimeout [60*2, 0, 60*20];

// cycle
_grp addWaypoint [_targetpoint, 0];
[_grp, 3] setWaypointType "CYCLE";

PMC_cu = PMC_cu + 9;
publicVariable "PMC_cu";
