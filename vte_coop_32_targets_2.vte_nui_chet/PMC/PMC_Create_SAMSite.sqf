/*

THIS IS UNIQUE FOR PMC COOP 32 TARGETS 2, DO NOT OVERWRITE, DO NOT USE ELSEWHERE!

	Create NVA/VC SAM Site

Syntax:
[pos] execVM "PMC\PMC_Create_SAMSite.sqf";

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/
private
[
	"_grp",
	"_tp",
	"_vcl"
];

// location
_tp = _this select 0;

_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

if (PMC_debug) then
{
	diag_log format ["NVA SAM Site _grp: %1, posit: %2", _grp, _tp];
};

/* the radar in the middle.
something wrong with this fansong unit, the unit is NOT placed in the vehicle,
he stays outside but tries to continuously mount the vehicle but cannot.
*/
_vcl = "vte_sa2fansong" createVehicle _tp;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInGunner _vcl;

// first launcher.
_vcl = "vte_sa2launcher" createVehicle [(_tp select 0)+100,(_tp select 1),0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "CORPORAL"];
(units _grp select 1) moveInGunner _vcl;

// second launcher.
_vcl = "vte_sa2launcher" createVehicle [(_tp select 0)+100,(_tp select 1)+100,0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "CORPORAL"];
(units _grp select 2) moveInGunner _vcl;

// third launcher.
_vcl = "vte_sa2launcher" createVehicle [(_tp select 0),(_tp select 1)+100,0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "CORPORAL"];
(units _grp select 3) moveInGunner _vcl;

// fourth launcher.
_vcl = "vte_sa2launcher" createVehicle [(_tp select 0)-100,(_tp select 1)+100,0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "PRIVATE"];
(units _grp select 4) moveInGunner _vcl;

// fifth launcher.
_vcl = "vte_sa2launcher" createVehicle [(_tp select 0)-100,(_tp select 1),0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "PRIVATE"];
(units _grp select 5) moveInGunner _vcl;

// sixth launcher.
_vcl = "vte_sa2launcher" createVehicle [(_tp select 0)-100,(_tp select 1)-100,0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"vte_nvacrew" createUnit [_tp, _grp, "", 1, "PRIVATE"];
(units _grp select 6) moveInGunner _vcl;

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;

_grp setbehaviour "COMBAT";
_grp setcombatmode "RED";
