
// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

private ["_grp"];

waitUntil { !isnil "bis_fnc_init" };

// create triggers for our unit sides
[] execVM "PMC\Triggers_For_Sides.sqf";

pmc_grpnum = 0;
pmc_grp_ind = 0;
pmc_grp_opfor = 0;
PMC_killedNum = 0;
publicVariable "PMC_killedNum";
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";

// unit creation for NVA Colonel
[] execVM "PMC\PMC_war_OPFOR.sqf";
[] execVM "PMC\War_IND.sqf";
