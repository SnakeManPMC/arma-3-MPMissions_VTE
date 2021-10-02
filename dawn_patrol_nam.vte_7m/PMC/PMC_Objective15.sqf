// 0 = [] execVM "PMC\PMC_Objective15.sqf";

deletevehicle obj15;
"marker M1-5" setMarkerColor "ColorGreen";
"M1-5" setMarkerColor "ColorGreen";
["t15", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint "Air Defences Down";
