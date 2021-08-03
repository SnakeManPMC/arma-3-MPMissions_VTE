/*

	Created at 2021-08-03T07:33:10Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Objective 3 completed. Over.";
["t3", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target3" setMarkerColor "colorgreen";
"target3" setMarkerType "mil_dot";
opfordead3 = true;
publicVariable "opfordead3";
