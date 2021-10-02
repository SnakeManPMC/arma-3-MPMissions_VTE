// 0 = [] execVM "PMC\PMC_Objective23.sqf";

deletevehicle obj23;
"Marker2-3" setMarkerColor "ColorGreen";
"M2-3" setMarkerColor "ColorGreen";
["t23", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"Man Ro Villa Clear";
