/*
if (!isNil PMC_arty_81mm_on_call) exitWith { player sideChat "81mm mortar's busy, try again later."; };
*/

private ["_myBattery","_heTemplate","_pos"];
PMC_arty_81mm_on_call = true;
publicVariable "PMC_arty_81mm_on_call";
diag_log "ok pmc_arty_fire_81mm.sqf called";

private
[
	"_myBattery",
	"_heTemplate"
];

_myBattery = pmc_artillery_81mm;
_heTemplate = ["IMMEDIATE", "HE", 0, 4];

player sidechat format ["Mortar support on: %1", PMC_arty_81mm_target_pos];
diag_log format ["PMC_artillery _pos: %1, _myBattery: %2", _pos, _myBattery];

// dispersion, 35m or?
[_myBattery, 35] call BIS_ARTY_F_SetDispersion;

[_myBattery, PMC_arty_81mm_target_pos, _heTemplate] call BIS_ARTY_F_ExecuteTemplateMission;

waitUntil {_myBattery getVariable "ARTY_ONMISSION"};
player sidechat "The battery is on a mission.";

waitUntil {_myBattery getVariable "ARTY_SPLASH"};
player sidechat "Splash!";

waitUntil {_myBattery getVariable "ARTY_COMPLETE"};
player sidechat "Artillery is rounds complete.";

PMC_arty_81mm_on_call = false;
publicVariable "PMC_arty_81mm_on_call";
