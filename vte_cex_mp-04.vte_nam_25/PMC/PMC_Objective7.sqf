/*

	Created at 2021-08-03T07:33:10Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Objective 7 completed. Over.";
["t7", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target7" setMarkerColor "colorgreen";
"target7" setMarkerType "mil_dot";
opfordead7 = true;
publicVariable "opfordead7";
