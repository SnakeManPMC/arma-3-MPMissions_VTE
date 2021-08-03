/*

	Created at 2021-08-03T07:33:10Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Objective 8 completed. Over.";
["t8", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target8" setMarkerColor "colorgreen";
"target8" setMarkerType "mil_dot";
opfordead8 = true;
publicVariable "opfordead8";
