PMC_debug = false;
publicVariable "PMC_debug";
PMC_killedNum = 0;
publicVariable "PMC\PMC_killedNum";
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";

[] execVM "PMC\PMC_weather.sqf";
