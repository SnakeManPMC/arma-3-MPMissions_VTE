/*

	Create NVA/VC Static weapon (ie small machinegun or mortar)

Pick the position randomly from out PMC_targets gamelogic's array

Syntax:
[] execVM "PMC\PMC_Create_NVA_static_weapon.sqf";

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/
private ["_grp","_myVcl","_myvehiclelist","_pmc_dshkm_sites","_rveh","_tp","_vcl","_vehlist"];

// choose random posit for our site
_pmc_dshkm_sites = [pmc_6, pmc_3, pmc_4];
// just in case all else fails
_tp = getPosASL pmc_6;
/*
_tn = count _pmc_dshkm_sites;
_r = (floor random _tn);
_t = (_pmc_dshkm_sites select _r);
_tp = getPosASL _t;
*/
_tp = getPosASL (_pmc_dshkm_sites select (floor random (count _pmc_dshkm_sites)));

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

_grp setbehaviour "COMBAT";
_grp setcombatmode "RED";
