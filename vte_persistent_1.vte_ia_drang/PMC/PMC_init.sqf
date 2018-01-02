
// debug on
PMC_debug = true;
publicVariable "PMC_debug";

// mission end variable
PMC_mcomplete = false;
publicVariable "PMC_mcomplete";

// initialized variables and settings
PMC_killedNum = 0;
publicVariable "PMC_killedNum";

// corpse removal script
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";
publicVariable "PMC_corpses";

// count for opfor
PMC_opfor = 0;
publicVariable "PMC_opfor";

// count for blufor
PMC_blufor = 0;
publicVariable "PMC_blufor";

// collect targets from pmc_? gamelogics
[] execVM "PMC\PMC_targets.sqf";

// NVA war
[] execVM "PMC\PMC_war_nva.sqf";

// US war
[] execVM "PMC\PMC_war_us.sqf";
