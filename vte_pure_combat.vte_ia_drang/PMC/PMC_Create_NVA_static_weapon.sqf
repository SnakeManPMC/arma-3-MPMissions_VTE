/*

	Create NVA/VC Static weapon (ie small machinegun or mortar)

Pick the position randomly from out PMC_targets gamelogic's array

Syntax:
[_pos] execVM "PMC\PMC_Create_NVA_static_weapon.sqf";

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

diag_log format ["NVA static WPN _grp: %1, posit: %2", _grp, _tp];

_myvehiclelist =
[
	"VTE_120mm_mortar_nva",
	"VTE_60mortarnva",
	"VTE_60mortarvc",
	"VTE_82mm_mortar_nva",
	"VTE_dshkm",
	"VTE_dshkm",
	"VTE_dshkmvc",
	"VTE_dshkmvc",
	"VTE_dshkmvc"
];

_vehlist = count _myvehiclelist;
_rveh = (floor random _vehlist);
_myVcl = (_myvehiclelist select _rveh);

diag_log format ["NVA static WPN _myVcl: %1", _myVcl];

// dshkm
_vcl = objNull;
_vcl = _myVcl createVehicle _tp;
_vcl setDir random 360;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInGunner _vcl;

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

_grp setbehaviour "COMBAT";
_grp setcombatmode "RED";
