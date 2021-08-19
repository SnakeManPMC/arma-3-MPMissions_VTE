
// 0 = [] execVM "PMC\PMC_Objective5.sqf";

"target5" setMarkerColorLocal "colorgreen";
"target5" setMarkerTypeLocal "dot";
["pmc_objective5", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
