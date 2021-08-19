
// objective 1 completed!
"PMC_target_marker_1" setMarkerColorLocal "ColorGreen";
"PMC_target_marker_1" setMarkerTypeLocal "mil_dot";
PMC_target1 = true;
publicVariable "PMC_target1";
PMC_objective1 setTaskState "succeeded";

["PMC_objective1", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
