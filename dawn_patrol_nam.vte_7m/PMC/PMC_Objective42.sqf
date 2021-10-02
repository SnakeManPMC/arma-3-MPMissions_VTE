// 0 = [] execVM "PMC\PMC_Objective42.sqf";

deletevehicle obj42;
"marker M4-2" setMarkerColor "ColorGreen";
"M4-2" setMarkerColor "ColorGreen";
["t42", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint "Phum Kok Romei Clear";
