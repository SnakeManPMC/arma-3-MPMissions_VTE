/*

	Created at 2021-08-03T07:33:10Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Objective 2 completed. Over.";
["t2", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target2" setMarkerColor "colorgreen";
"target2" setMarkerType "mil_dot";
opfordead2 = true;
publicVariable "opfordead2";
