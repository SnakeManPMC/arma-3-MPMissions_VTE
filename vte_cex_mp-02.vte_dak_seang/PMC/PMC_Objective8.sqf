/*

	Created at 2021-08-03T06:54:26Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Town captured. Over.";
["t9", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
opfordead8 = true;
publicVariable "opfordead8";
"target8" setMarkerColor "colorgreen";
"target8" setMarkerType "mil_dot";
