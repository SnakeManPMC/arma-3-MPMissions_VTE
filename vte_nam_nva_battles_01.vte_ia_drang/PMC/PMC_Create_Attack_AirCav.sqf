/*

parameters: starting location, target location

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
_waypointRanPosit = _this select 2;

//player sidechat format["Create US _targetpoint: %1", _targetpoint];

_grp = objNull;
_grp = createGroup west;
waitUntil {!(isNull _grp)};

"VTE_acofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"VTE_acsquadleader" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_acsoldierrto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_acsoldiermg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"VTE_acsoldiermg_assistant" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_acfireteamleader" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_acsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_acsoldiermg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_acsoldiermg_assistant" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_acsoldiermedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "NORMAL";
_grp setFormation "WEDGE";

_wp = 1;

_grp addWaypoint [_targetpoint, _waypointRanPosit];
[_grp, _wp] setWaypointBehaviour "AWARE";
[_grp, _wp] setWaypointCombatMode "RED";
[_grp, _wp] setWaypointSpeed "NORMAL";
[_grp, _wp] setWaypointFormation "WEDGE";
[_grp, _wp] setWaypointType "GUARD";
