
call compile preProcessFileLineNumbers "PMC\time_used_update.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_weather_to_string.sqf";

hintSilent format
[
	"OPFOR: %1, BLUFOR: %2, PMC_cu: %3, PMC_killedNum: %4, PMC_helo_cv: %5, PMC_InfTransport: %6, VictoryCondition: %7, PMC_grpNum: %8, PMC_InfTransportUsed: %9\n\n%10\n\n%11",
	(count list PMC_opfor_list),
	(count list PMC_blufor_list),
	PMC_cu,
	PMC_killedNum,
	PMC_helo_cv,
	PMC_InfTransport,
	PMC_VictoryCondition,
	PMC_grpNum,
	PMC_InfTransportUsed,
	call PMC_Time_Used_Update,
	[overCast] call PMC_weather_to_string
];
