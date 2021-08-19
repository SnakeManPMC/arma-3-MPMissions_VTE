
// 0 = [] execVM "PMC\PMC_Objective4.sqf";

"target4" setMarkerColorLocal "colorgreen";
"target4" setMarkerTypeLocal "dot";
["pmc_objective4", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
