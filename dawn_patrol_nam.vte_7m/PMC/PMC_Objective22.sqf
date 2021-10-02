// 0 = [] execVM "PMC\PMC_Objective22.sqf";

deletevehicle obj22;
"marker 2-2" setmarkerColor "ColorGreen";
"M2-2" setMarkerColor "ColorGreen";
["t22", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint "Small Villa Cleared";
