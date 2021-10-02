// 0 = [] execVM "PMC\PMC_Objective1.sqf";

["EAST_1", "FAILED", true] spawn BIS_fnc_taskSetState;
["WEST_1", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
mcomplete = true;
