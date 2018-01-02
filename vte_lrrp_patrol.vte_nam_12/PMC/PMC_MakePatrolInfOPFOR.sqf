private ["_respawnpoint","_targetpoint","_waypointRanPosit","_grp"];
_respawnpoint = _this select 0;
_targetpoint = _this select 1;
_waypointRanPosit = _this select 2;
_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

"VTE_NVAofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"VTE_NVArto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"VTE_NVArpg" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_NVAmedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;

_grp setbehaviour "SAFE";
_grp setcombatmode "RED";
_grp setspeedmode "LIMITED";
_grp setformation "WEDGE";

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
