
// 0 = [] execVM "PMC\PMC_Objective3.sqf";

"target3" setMarkerColorLocal "colorgreen";
"target3" setMarkerTypeLocal "dot";
["pmc_objective3", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
