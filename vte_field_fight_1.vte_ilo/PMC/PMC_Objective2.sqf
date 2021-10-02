// 0 = [] execVM "PMC\PMC_Objective2.sqf";

["t1", "FAILED", true] spawn BIS_fnc_taskSetState;
["t2", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
mcomplete = true;
