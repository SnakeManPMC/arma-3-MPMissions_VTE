
// objective 2 completed!
"PMC_target_marker_2" setMarkerColorLocal "ColorGreen";
"PMC_target_marker_2" setMarkerTypeLocal "mil_dot";
PMC_target2 = true;
publicVariable "PMC_target2";
PMC_objective1 setTaskState "succeeded";

["PMC_objective2", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
