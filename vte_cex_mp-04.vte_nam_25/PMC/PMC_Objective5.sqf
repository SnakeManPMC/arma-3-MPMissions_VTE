/*

	Created at 2021-08-03T07:33:10Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Objective 5 completed. Over.";
["t5", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target5" setMarkerColor "colorgreen";
"target5" setMarkerType "mil_dot";
opfordead5 = true;
publicVariable "opfordead5";
