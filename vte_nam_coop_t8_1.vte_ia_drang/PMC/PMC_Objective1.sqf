
// 0 = [] execVM "PMC\PMC_Objective1.sqf";

"target1" setMarkerColorLocal "colorgreen";
"target1" setMarkerTypeLocal "dot";
["pmc_objective1", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
