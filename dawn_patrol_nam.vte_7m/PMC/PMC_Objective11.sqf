// 0 = [] execVM "PMC\PMC_Objective11.sqf";

deletevehicle obj11;
"marker 1-1" setMarkerColor "ColorGreen";
"M1-1" setMarkerColor "ColorGreen";
["t11", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"Phum Kaoh Koasal Clear";
