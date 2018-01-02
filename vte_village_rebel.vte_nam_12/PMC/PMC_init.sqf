private
[
	"_tmp"
];
// debug on
PMC_debug = true;

PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";

PMC_cu = 0;
publicVariable "PMC_cu";
PMC_helo_cv = 0;
publicVariable "PMC_helo_cv";
pmc_grpnum = 0;
pmc_blufor = 0;
pmc_grp_blufor = 0;

PMC_loc = call compile preprocessFileLineNumbers "PMC\PMC_locationFinder.sqf";

_tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil
{
	scriptDone _tmp;
};
[] execVM "PMC\PMC_war.sqf";
[(getPosASL cv_helopad)] execVM "PMC\PMC_Helo_VTE_BLUFOR.sqf";
