
private
[
	"_tmp"
];

// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

pmc_cu = 0;

// run killed script, 300 corpses max on the battlefield.
// this needs to be global??
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";

_tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil {scriptDone _tmp};
[] execVM "PMC\PMC_war.sqf";
// [] exec "medic-tent.sqs";
