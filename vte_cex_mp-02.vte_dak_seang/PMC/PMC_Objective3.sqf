/*

	Created at 2021-08-03T06:54:26Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Bridge captured. Over.";
["t4", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
opfordead3 = true;
publicVariable "opfordead3";
"target3" setMarkerColor "colorgreen";
"target3" setMarkerType "mil_dot";
