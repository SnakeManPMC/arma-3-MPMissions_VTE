// 0 = [] execVM "PMC\PMC_Objective1.sqf";

leader hqteam sidechat "Plei Bi Yot village cleared.";
["t11", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
"target11" setMarkerColor "colorgreen";
ed11=true;
