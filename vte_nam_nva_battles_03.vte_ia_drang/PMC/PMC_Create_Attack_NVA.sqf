/*

Syntax:
[starting location, target location] execVM "PMC\PMC_Create_Attack_NVA.sqf";

*/
private
[
	"_grp",
	"_respawnpoint",
	"_targetpoint",
	"_waypointRanPosit",
	"_wp"
];

_targetpoint = _this select 0;
_respawnpoint = _this select 1;
_waypointRanPosit = 50;

_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

"VTE_NVAofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"VTE_NVAat" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_NVAaa" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_x allowFleeing 0;
} forEach units _grp;

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "FULL";
_grp setFormation "WEDGE";

_wp = 1;

_grp addWaypoint [_targetpoint, _waypointRanPosit];
[_grp, _wp] setWaypointBehaviour "AWARE";
[_grp, _wp] setWaypointCombatMode "RED";
[_grp, _wp] setWaypointSpeed "FULL";
[_grp, _wp] setWaypointFormation "WEDGE";
[_grp, _wp] setWaypointType "GUARD";
