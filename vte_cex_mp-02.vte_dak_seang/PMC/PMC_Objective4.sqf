/*

	Created at 2021-08-03T06:54:26Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Village captured. Over.";
["t5", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
opfordead4 = true;
publicVariable "opfordead4";
"target4" setMarkerColor "colorgreen";
"target4" setMarkerType "mil_dot";
