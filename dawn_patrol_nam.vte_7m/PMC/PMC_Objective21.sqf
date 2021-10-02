// 0 = [] execVM "PMC\PMC_Objective21.sqf";

deletevehicle obj21;
"marker 2-1" setMarkerColor "ColorGreen";
"M2-1" setMarkerColor "ColorGreen";
["t21", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"Nah Bang Clear";
