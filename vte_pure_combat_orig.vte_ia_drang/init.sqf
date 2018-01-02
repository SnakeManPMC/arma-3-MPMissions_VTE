
[] execVM "briefing.sqf";

enableSaving [ false, false ];

// if not on server, exit.
if (!isServer) exitWith{};

private ["_tmp"];

// debug
PMC_debug = true;
publicVariable "PMC_debug";
pmc_grpnum = 0;
pmc_blufor = 0;
pmc_grp_blufor = 0;

// run killed script, 300 corpses max on the battlefield.
// this needs to be global??
PMC_killedNum = 0;
publicVariable "PMC\PMC_killedNum";
PMC_corpses = [];
[150] execVM "PMC\PMC_corpses.sqf";

PMC_scriptsDone = 0;
PMC_cu = 0;
PMC_helo_cv = 0;
publicVariable "PMC_scriptsDone";
publicVariable "PMC_cu";
publicVariable "PMC_helo_cv";
// how many helos are in the air now?
PMC_InfTransport = 0;
publicVariable "PMC_InfTransport";
// mission completion
PMC_Mission_Complete = false;
publicVariable "PMC_Mission_Complete";

PMC_loc = call compile preprocessFileLineNumbers "PMC\PMC_locationFinder.sqf";

_tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil {scriptDone _tmp};
[] execVM "PMC_war.sqf";
[(getPosASL pmc_homebase)] execVM "PMC\PMC_Helo_VTE_BLUFOR.sqf";
