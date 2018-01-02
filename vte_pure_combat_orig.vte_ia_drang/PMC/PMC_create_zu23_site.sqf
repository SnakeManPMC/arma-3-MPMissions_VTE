/*

	Create ZU23 anti aircraft cannon site

Pick the position randomly from out PMC_targets gamelogic's array

Syntax:
[] execVM "PMC\PMC_create_zu23_site.sqf";

Requires:
PMC_targets[] array with the gamelogics info.
PMC\PMC_killed.sqf

Returns:
-

*/
private
[
	"_grp",
	"_r",
	"_t",
	"_tn",
	"_tp",
	"_vcl"
];

// choose random posit for our site
_tn = count PMC_targets;
_r = (floor random _tn);
_t = (PMC_targets select _r);
_tp = getPosASL _t;

_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

// zu23 cannon
_vcl = "vte_zu23" createVehicle _tp;
_vcl setDir random 360;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInGunner _vcl;

// zsu57 shilka thing
_vcl = "vte_zsu57" createVehicle [(_tp select 0)+100,(_tp select 1),0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "CORPORAL"];
(units _grp select 1) moveInCommander _vcl;
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "PRIVATE"];
(units _grp select 2) moveInGunner _vcl;
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "PRIVATE"];
(units _grp select 3) moveInDriver _vcl;

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;

_grp setbehaviour "COMBAT";
_grp setcombatmode "RED";

// debug :)
if (PMC_debug) then
{
	player sideChat format["ZU23 site created to: %1",_tp];
};
