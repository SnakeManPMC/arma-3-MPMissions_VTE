// 0 = [] execVM "PMC\PMC_Objective1.sqf";

obj1_done=true;
"obj2_marker" setmarkersize[0,0];
HQ sideChat "AA guns destroyed.";
["tskDestroyAa", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
