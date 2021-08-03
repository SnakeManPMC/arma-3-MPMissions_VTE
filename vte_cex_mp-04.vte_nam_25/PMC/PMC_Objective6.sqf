/*

	Created at 2021-08-03T07:33:10Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Objective 6 completed. Over.";
["t6", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target6" setMarkerColor "colorgreen";
"target6" setMarkerType "mil_dot";
opfordead6 = true;
publicVariable "opfordead6";
