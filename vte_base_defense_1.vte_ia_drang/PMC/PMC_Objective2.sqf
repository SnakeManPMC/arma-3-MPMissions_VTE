// 0 = [] execVM "PMC\PMC_Objective2.sqf";

["PMC_objective1", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
["PMC_objective_opfor1", "FAILED", true] spawn BIS_fnc_taskSetState;
mcomplete = true; 
publicVariable "mcomplete";
