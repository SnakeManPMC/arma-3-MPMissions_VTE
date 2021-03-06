
call compile preProcessFileLineNumbers "PMC\time_used_update.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_weather_to_string.sqf";

hintSilent format
[
	"OPFOR: %1, BLUFOR: %2, PMC_cu: %3, PMC_killedNum: %4, PMC_helo_cv: %5, PMC_InfTransport: %6, VictoryCondition: %7, PMC_grpNum: %8, PMC_corpses: %9, PMC_InfTransportUsed: %10\n\n%11\n\n%12",
	(count PMC_opfor_list),
	(count PMC_blufor_list),
	PMC_cu,
	PMC_killedNum,
	PMC_helo_cv,
	PMC_InfTransport,
	PMC_VictoryCondition,
	PMC_grpNum,
	(count PMC_corpses),
	PMC_InfTransportUsed,
	call PMC_Time_Used_Update,
	[overCast] call PMC_weather_to_string
];
