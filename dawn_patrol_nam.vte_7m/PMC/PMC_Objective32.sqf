// 0 = [] execVM "PMC\PMC_Objective32.sqf";

deletevehicle obj32;
"Marker 3-2" setMarkerColor "ColorGreen";
"M3-2" setMarkerColor "ColorGreen";
["t32", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"Xom Cau Sat Clear";
