
[] execVM "PMC\PMC_Tasks.sqf";

skiptime (((paramsarray select 0) - daytime + 24) % 24);

[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

PMC_debug = true;
publicVariable "PMC_debug";

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
PMC_grpNum = 0;
publicVariable "PMC_grpNum";
// how many helos are in the air now?
PMC_InfTransport = 0;
publicVariable "PMC_InfTransport";
PMC_InfTransportUsed = 0;
publicVariable "PMC_InfTransportUsed";

PMC_launch_ending_cutscene = false;
publicVariable "PMC_launch_ending_cutscene";

PMC_Mission_Complete = false;
publicVariable "PMC_Mission_Complete";

PMC_unitMarker = 0;
publicVariable "PMC_unitMarker";

// gather list of targets from "pmc_1" etc gamelogicks
private _tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil {scriptDone _tmp};

// gather list of zone names from "pmc_zone_1" etc gamelogicks
_tmp = [] execVM "PMC\PMC_zones.sqf";
waitUntil {scriptDone _tmp};
publicVariable "PMC_zones";

//_PMC_MakeGuardInfOPFOR =
call compile preProcessFileLineNumbers "PMC\PMC_MakeGuardInfOPFOR.sqf";
//_PMC_MakePatrolInfOPFOR =
call compile preProcessFileLineNumbers "PMC\PMC_MakePatrolInfOPFOR.sqf";
//_PMC_MakeGuardInfBLUFOR =
call compile preProcessFileLineNumbers "PMC\PMC_MakeGuardInfBLUFOR.sqf";
//_PMC_MakePatrolInfBLUFOR =
call compile preProcessFileLineNumbers "PMC\PMC_MakePatrolInfBLUFOR.sqf";
//_PMC_SelectOPFORStartPosit =
call compile preProcessFileLineNumbers "PMC\PMC_SelectOPFORStartPosit.sqf";
// PMC_Create_NVA_Sniper =
call compile preProcessFileLineNumbers "PMC\PMC_Create_NVA_Sniper.sqf";
// PMC_Create_NVA_Recon =
call compile preProcessFileLineNumbers "PMC\PMC_Create_NVA_Recon.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Select_Target.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Select_BLUFOR_starts.sqf";

// waypoint plotter
PMC_plotWaypoints = compile preprocessFileLineNumbers "PMC\PMC_plotWaypoints.sqf";

PMC_countGroups = compile preprocessFileLineNumbers "PMC\PMC_countGroups.sqf";
PMC_debug_rpt = compile preprocessFileLineNumbers "PMC\PMC_debug_rpt.sqf";

[] execVM "PMC\PMC_war.sqf";
[] execVM "PMC\PMC_Helo_purecombat_BLUFOR.sqf";

// dshkm for couple of spots.
[] execVM "PMC\PMC_Create_NVA_static_weapon.sqf";
[] execVM "PMC\PMC_Create_Vehicle_BLUFOR.sqf";
[] execVM "PMC\PMC_Create_Vehicle_OPFOR.sqf";

/*
human player lz grabbing opfor
pmc_2 = lz columbus
pmc_32 = lz x-ray
pmc_27 = lz albany
pmc_49 = hill 460
*/
[pmc_2] execVM "PMC\PMC_lz_defenses_opfor.sqf";
[pmc_32] execVM "PMC\PMC_lz_defenses_opfor.sqf";
[pmc_27] execVM "PMC\PMC_lz_defenses_opfor.sqf";
[pmc_49] execVM "PMC\PMC_lz_defenses_opfor.sqf";

PMC_lz_columbus_opened = false;
publicVariable "PMC_lz_columbus_opened";

PMC_lz_xray_opened = false;
publicVariable "PMC_lz_xray_opened";

PMC_lz_albany_opened = false;
publicVariable "PMC_lz_ablany_opened";

PMC_lz_hill460_opened = false;
publicVariable "PMC_lz_hill460_opened";

[] execVM "PMC\PMC_addPublicVariableEventhandlers.sqf";
