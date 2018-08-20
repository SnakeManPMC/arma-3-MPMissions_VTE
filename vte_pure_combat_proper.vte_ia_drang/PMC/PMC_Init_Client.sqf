
[] execVM "PMC\PMC_Briefing.sqf";

// create the actual zone markers and triggers
[500, 120] execVM "PMC\PMC_Create_Zones.sqf";

[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

[player, "PMC_Check_Stats", nil, nil, ""] call BIS_fnc_addCommMenuItem;
[player, "PMC_Call_Artillery_M101", nil, nil, ""] call BIS_fnc_addCommMenuItem;
[player, "PMC_Call_81mm_Mortars", nil, nil, ""] call BIS_fnc_addCommMenuItem;
[player, "PMC_Call_Airstrike", nil, nil, ""] call BIS_fnc_addCommMenuItem;
[player, "PMC_Call_Evac", nil, nil, ""] call BIS_fnc_addCommMenuItem;
