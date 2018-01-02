/*

	PMC COOP AirCav
	init script, run only on server

*/
private ["_tmp"];

// debug
PMC_debug = true;
publicVariable "PMC_debug";

// run killed script, 300 corpses max on the battlefield.
// this needs to be global??
PMC_killedNum = 0;
publicVariable "PMC\PMC_killedNum";
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";

pmc_opfor = 0;
pmc_grp_opfor = 0;
PMC_cu = 0;
publicVariable "PMC_cu";
PMC_grpNum = 0;
publicVariable "PMC_grpNum";

// mission completion
PMC_Mission_Complete = false;
publicVariable "PMC_Mission_Complete";

[] execVM "PMC\PMC_weather.sqf";

// gather list of targets from "pmc_1" etc gamelogicks
_tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil {scriptDone _tmp};

// create some extra objectives. this is accompanied by PMC_Create_Tasks.sqf for clients.
[] execVM "PMC\PMC_Create_Objectives.sqf";
