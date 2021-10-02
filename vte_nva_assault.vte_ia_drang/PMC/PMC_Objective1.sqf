// 0 = [] execVM "PMC\PMC_Objective1.sqf";

PAPABEAR sideChat "Radio traffic indicates that enemy forces have been repelled, they are bugging out. Good job. Mission is over. HQ out.";
mcomplete = true;
["t1", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
