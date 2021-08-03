/*

	Created at 2021-08-03T07:33:10Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Objective 9 completed. Over.";
["t9", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target9" setMarkerColor "colorgreen";
"target9" setMarkerType "mil_dot";
opfordead9 = true;
publicVariable "opfordead9";
