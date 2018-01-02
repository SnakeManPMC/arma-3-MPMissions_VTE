// debug stuff for rpt ;)
diag_log format
[
	"OPFOR: %1, BLUFOR: %2, PMC_cu: %3, PMC_killedNum: %4, PMC_helo_cv: %5, PMC_InfTransport: %6, VictoryCondition: %7, PMC_grpNum: %8, PMC_corpses: %9",
	(count list PMC_opfor_list),
	(count list PMC_blufor_list),
	PMC_cu,
	PMC_killedNum,
	PMC_helo_cv,
	PMC_InfTransport,
	PMC_VictoryCondition,
	PMC_grpNum,
	(count PMC_corpses)
];
