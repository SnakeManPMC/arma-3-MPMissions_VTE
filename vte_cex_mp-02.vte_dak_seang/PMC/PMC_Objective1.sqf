/*

	Created at 2021-08-03T06:54:26Z with Mission Converter v0.0.1 by PMC

*/
PMCHQ sideChat "Enemy attack repelled. Over.";
["t2", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
opfordead1 = true;
publicVariable "opfordead1";
"target1" setMarkerColor "colorgreen";
"target1" setMarkerType "mil_dot";
