/*

	Created at 2021-08-03T07:33:10Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Objective 1 completed. Over.";
["t1", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target1" setMarkerColor "colorgreen";
"target1" setMarkerType "mil_dot";
opfordead1 = true;
publicVariable "opfordead1";
