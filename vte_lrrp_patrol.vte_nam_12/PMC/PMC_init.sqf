private ["_rc","_tc","_tpo","_tmp"];

// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

PMC_loc = call compile preprocessFileLineNumbers "PMC\PMC_locationFinder.sqf";

PAPABEAR = ["WEST", "HQ"];
// debug
PMC_debug = true;
publicVariable "PMC_debug";
pmc_grpnum = 0;
pmc_blufor = 0;
pmc_grp_blufor = 0;
pmc_inftransport = 0;

// run killed script, 300 corpses max on the battlefield.
// this needs to be global??
PMC_killedNum = 0;
publicVariable "PMC_killedNum";
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";

PMC_scriptsDone = 0;
PMC_cu = 0;
PMC_helo_cv = 0;
publicVariable "PMC_scriptsDone";
publicVariable "PMC_cu";
publicVariable "PMC_helo_cv";

_tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil
{
	scriptDone _tmp
};

// enemy SAM site
[] execVM "PMC\PMC_create_VTE_sa2_site.sqf";

// enemy ZU23 site
[] execVM "PMC\PMC_create_zu23_site.sqf";

// convoy of trucks
[] execVM "PMC\PMC_VTE_gook_convoy.sqf";

// main war creation
[] execVM "PMC\PMC_war.sqf";
sleep 5;

// blufor patrolling helicopter.
[(getPosASL CV_helopad_2)] execVM "PMC\PMC_Helo_VTE_BLUFOR.sqf";

// troop transport ferry script. [group, pickup, dropoff]
_rc = (floor random (count PMC_targets));
_tc = (PMC_targets select _rc);
_tpo = getPosASL _tc;
[usinf1, (getPosASL CV_helopad_2), _tpo] execVM "PMC\PMC_Nam_infTransport.sqf";

// recon plane birddog script
PMC_birddog_cv = 0;
[(getPosASL pmc_birddog_start)] execVM "PMC\PMC_recon_birddog.sqf";
