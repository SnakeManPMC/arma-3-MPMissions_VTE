// 0 = [] execVM "PMC\PMC_Objective12.sqf";

deletevehicle obj12;
"marker 1-2" setMarkerColor "ColorGreen";
"M1-2" setMarkerColor "ColorGreen";
["t12", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"Phum Tunloap Clear";
