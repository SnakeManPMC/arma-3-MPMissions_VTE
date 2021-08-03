/*

	Created at 2021-08-03T07:33:10Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Objective 4 completed. Over.";
["t4", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target4" setMarkerColor "colorgreen";
"target4" setMarkerType "mil_dot";
opfordead4 = true;
publicVariable "opfordead4";
