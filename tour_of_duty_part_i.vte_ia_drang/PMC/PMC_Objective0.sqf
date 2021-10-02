// 0 = [] execVM "PMC\PMC_Objective0.sqf";

["tskDestroyMortars", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
obj0_done=true;
"obj1_marker" setmarkersize[0,0];
HQ sideChat "Mortar positions destroyed.";
