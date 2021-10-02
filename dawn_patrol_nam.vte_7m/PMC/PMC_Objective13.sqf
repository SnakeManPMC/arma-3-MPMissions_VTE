// 0 = [] execVM "PMC\PMC_Objective13.sqf";

deletevehicle obj13;
"marker 1-3" setMarkerColor "ColorGreen";
"M1-3" setMarkerColor "ColorGreen";
["t13", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"Phum Pong Toel Clear";
