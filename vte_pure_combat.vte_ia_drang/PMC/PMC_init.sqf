/*

	PMC Pure Combat
	init script, run only on server

*/
private ["_tmp","_pmc_dshkm_sites","_tp"];

// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

// debug
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

// ending cutscene is no no
PMC_launch_ending_cutscene = false;
publicVariable "PMC_launch_ending_cutscene";

// mission completion
PMC_Mission_Complete = false;
publicVariable "PMC_Mission_Complete";

PMC_unitMarker = 0;
publicVariable "PMC_unitMarker";

// gather list of targets from "pmc_1" etc gamelogicks
_tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil {scriptDone _tmp};

// gather list of zone names from "pmc_zone_1" etc gamelogicks
_tmp = [] execVM "PMC\PMC_zones.sqf";
waitUntil {scriptDone _tmp};
publicVariable "PMC_zones";

// disabled because they are GAY, replace with something useful using taskmaster.
// create some extra objectives. this is accompanied by PMC_Create_Tasks.sqf for clients.
//[] execVM "PMC\PMC_Create_Objectives.sqf";

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

[] execVM "PMC\PMC_war.sqf";

[] execVM "PMC\PMC_Helo_purecombat_BLUFOR.sqf";

// dshkm for couple of spots.
// choose random posit for our site
_pmc_dshkm_sites = [pmc_6, pmc_3, pmc_4];
// just in case all else fails
//_tp = getPosASL pmc_6;
//_tp = getPosASL (_pmc_dshkm_sites select (floor random (count _pmc_dshkm_sites)));
_tp = (_pmc_dshkm_sites select (floor random (count _pmc_dshkm_sites)));
[_tp] execVM "PMC\PMC_Create_NVA_static_weapon.sqf";

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

// this was on init.sqf earlier and apparently working?
"PMC_CSAR_mission" addPublicVariableEventhandler
{
	private
	[
		"_tmp1"
	];
	_tmp1 = _this select 1;
	/*
	diag_log format ["_tmp0: %1, _tmp1: %2", _tmp0, _tmp1];
	
	diag_log "addPublicVariableEventhandler PMC_CSAR_mission is HERE!";
	player sideChat "addPublicVariableEventhandler PMC_CSAR_mission is HERE!";
	hint "addPublicVariableEventhandler PMC_CSAR_mission is HERE!";
	
	diag_log format ["addPubicHair PMC_CSAR_mission: %1", PMC_CSAR_mission];
	player sidechat format ["addPubicHair PMC_CSAR_mission: %1", PMC_CSAR_mission];
	
	diag_log format ["PMC_CSAR_marker_%1", PMC_helo_cv];
	player sidechat format ["PMC_CSAR_marker_%1", PMC_helo_cv];
	
	diag_log format ["deleteMarkerLocal 'PMC_CSAR_marker_%1'; hint 'You have rescued the pilot!';", PMC_helo_cv];
	player sidechat format ["deleteMarkerLocal 'PMC_CSAR_marker_%1'; hint 'You have rescued the pilot!';", PMC_helo_cv];
	*/
	// grab marker name from number of CV helos
	_m = format ["PMC_CSAR_marker_%1", PMC_helo_cv];
	_markerobj = createMarkerLocal [_m, getPosASL _tmp1];
	_markerobj setMarkerTypeLocal "mil_pickup";
	_markerobj setMarkerColorLocal "ColorBlue";
	_markerobj setMarkerTextLocal format ["DOWNED PILOT %1", PMC_helo_cv];
	
	// triggers
	_z = createTrigger ["EmptyDetector", getPosASL _tmp1];
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", true];
	_z setTriggerArea [50, 50, 0, true];
	_z setTriggerTimeout [0, 0, 0, true];
	_z setTriggerStatements ["this && player in thisList", format ["deleteMarkerLocal 'PMC_CSAR_marker_%1'; hint 'You have rescued the pilot!';", PMC_helo_cv], ""];
};

// these two artillery EH's were on PMC\PMC_init.sqf before, that was wrong?
// but when these were moved to init.sqf ... not working anymore?
// 81mm mortars
"PMC_arty_81mm_target_pos" addPublicVariableEventhandler
{
	diag_log "launching PMC_arty_fire_81mm.sqf";
	[] execVM "PMC\PMC_arty_fire_81mm.sqf";
};

// m101 artillery
"PMC_arty_m101_target_pos" addPublicVariableEventhandler
{
	diag_log "launching PMC_arty_fire_m101.sqf";
	[] execVM "PMC\PMC_arty_fire_m101.sqf";
};

// LZ opening fiddle
"PMC_LZ_opened" addPublicVariableEventhandler
{
	private
	[
		"_m",
		"_markerobj",
		"_pos",
		"_tmp"
	];
	_tmp = _this select 1;
	_pos = _this select 2;

	//however this doesnt work on clients...
	"pmc_blufor_start_6" setMarkerPosLocal _pos;
	
	// set respawn to this location
	"respawn_west" setMarkerPosLocal _pos;
	
	// create marker for this LZ
	_m = format ["PMC_LZ_opened_marker_%1", _tmp];
	_markerobj = createMarkerLocal [_m, _pos];
	_markerobj setMarkerShapeLocal "ELLIPSE";
	_markerobj setMarkerColorLocal "ColorBlue";
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [50, 50];
	hint "LZ has been opened, thank you.";
};
