// 0 = [] execVM "PMC\PMC_Objective43.sqf";

deletevehicle obj43;
"Marker M4-3" setMarkerColor "ColorGreen";
"M4-3" setMarkerColor "ColorGreen";
["t43", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"Paddy Field Clear";
