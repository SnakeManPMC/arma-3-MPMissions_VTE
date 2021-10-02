// 0 = [] execVM "PMC\PMC_Objective44.sqf";

deletevehicle obj44;
"marker M4-4" setMarkerColor "ColorGreen";
"M4-4" setMarkerColor "ColorGreen";
["t44", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"An Binh Clear";
