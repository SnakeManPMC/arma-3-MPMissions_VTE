/*

	Created at 2021-08-03T06:54:26Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Hilltop captured. Over.";
["t3", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
opfordead2=true;
publicVariable "opfordead2";
"target2" setMarkerColor "colorgreen";
"target2" setMarkerType "mil_dot";
