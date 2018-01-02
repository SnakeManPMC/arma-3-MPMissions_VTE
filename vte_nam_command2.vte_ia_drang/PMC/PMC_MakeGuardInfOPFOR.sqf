_respawnpoint = _this select 0;
_targetpoint = _this select 1;
_waypointRanPosit = _this select 2;

_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

"VTE_vcofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"VTE_vcsoldier4" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_vcsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_vcmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"VTE_vcrpg" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_vcsoldier2" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_vcat" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_vcmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_vcsoldier3" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

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
