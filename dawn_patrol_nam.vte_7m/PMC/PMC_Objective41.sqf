// 0 = [] execVM "PMC\PMC_Objective41.sqf";

deletevehicle obj41;
"marker M4-1" setMarkerColor "ColorGreen";
"M4-1" setMarkerColor "ColorGreen";
["t41", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
hint"Phum Nang Tor Clear";
