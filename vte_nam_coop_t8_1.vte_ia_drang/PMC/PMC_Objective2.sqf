
// 0 = [] execVM "PMC\PMC_Objective2.sqf";

"target2" setMarkerColorLocal "colorgreen";
"target2" setMarkerTypeLocal "dot";
["pmc_objective2", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
