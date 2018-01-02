/*

	Create NVA/VC vehicle

Pick the position randomly from out PMC_targets gamelogic's array

Syntax:
[_pos] execVM "PMC\PMC_Create_Vehicle_OPFOR.sqf";

Requires:
PMC\PMC_killed.sqf
PMC\PMC_groupRecycle.sqf

Returns:
-

*/
private ["_grp","_myVcl","_myvehiclelist","_rveh","_tp","_vcl","_vehlist"];

// location for our weapon
_tp = getPosASL (_this select 0);

_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

diag_log format ["NVA Vehicle _grp: %1, posit: %2", _grp, _tp];

_myvehiclelist =
[
	"vte_btr50",
	"vte_nvauazmg",
	"vte_pt76",
	"vte_su76",
	"vte_t34_85",
	"vte_t55",
	"vte_zsu37",
	"vte_zsu57"
];

_vehlist = count _myvehiclelist;
_rveh = (floor random _vehlist);
_myVcl = (_myvehiclelist select _rveh);

diag_log format ["NVA vehicle _myVcl: %1", _myVcl];

// dshkm
_vcl = objNull;
_vcl = _myVcl createVehicle _tp;
_vcl setDir random 360;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"VTE_nvacrew" createUnit [_tp, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInDriver _vcl;

[_vcl, _grp] execVM "PMC\PMC_Create_Crew.sqf";

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

// search and destroy waypoint
_grp addWaypoint [_tp, 50];
[_grp, 0] setWaypointBehaviour "AWARE";
[_grp, 0] setWaypointCombatMode "RED";
[_grp, 0] setWaypointSpeed "NORMAL";
[_grp, 0] setWaypointFormation "COLUMN";
[_grp, 0] setWaypointType "SENTRY";
[_grp, 0] setWaypointCompletionRadius 100;
