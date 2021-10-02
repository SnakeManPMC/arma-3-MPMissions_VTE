// 0 = [] execVM "PMC\PMC_Objective24.sqf";

deletevehicle obj24;
"marker 2-4" setMarkerColor "ColorGreen";
"M2-4" setMarkerColor "ColorGreen";
["t24", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"Tinh Bien Villa Clear";
