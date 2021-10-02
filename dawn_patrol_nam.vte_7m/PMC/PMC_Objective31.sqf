// 0 = [] execVM "PMC\PMC_Objective31.sqf";

deletevehicle obj31;
"marker 3-1" setMarkercolor "ColorGreen";
"M3-1" setMarkerColor "ColorGreen";
["t31", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
Hint "Chi Lang Clear";
