/*

	Creates SA-2 site. the main radar vehicle plus
	six launchers around it in about 100m distance.

Pick the position randomly from out PMC_targets gamelogic's array

Syntax:
[] execVM "PMC\PMC_create_VTE_sa2_site.sqf";

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
	"_tp",
	"_vcl"
];

// choose random posit for our site
_r = (round random count PMC_targets);
_t = (PMC_targets select _r);
_tp = getPosASL _t;

_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

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

// debug :)
if (PMC_debug) then
{
	player sideChat format["SA2 site created to: %1",_tp];
};
