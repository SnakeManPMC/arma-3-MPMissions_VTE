
// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

// Create location array from all class names entries (few in pmc 51km desert hehe)
PMC_loc = call compile preprocessFileLineNumbers "PMC\PMC_locationFinder.sqf";

diag_log PMC_loc;

// players random starting location
//[] execVM "PMC\Starting_Location.sqf";

// the actual sides (except west as our mission editor placed player is west guy).
[] execVM "PMC\Create_Sides.sqf";

// create trigger for each side
// pmc_all_units - anybody
[] execVM "PMC\Triggers_For_Sides.sqf";

// create gamelogic's for our stupid old script use ;)
[] execVM "PMC\Gamelogics_For_Old_Scripts.sqf";

// replace player randomly
[] execVM "PMC\Player_Identity_Crisis.sqf";

PMC_debug = false;
// corpse removal script
PMC_corpses = [];
PMC_killedNum = 0;
publicVariable "PMC_killedNum";
[100] execVM "PMC\PMC_corpses.sqf";

// number for created groups.
PMC_grp_blufor = 0;
publicVariable "PMC_grp_blufor";
PMC_grp_opfor = 0;
publicVariable "PMC_grp_opfor";
PMC_grpNum = 0;
publicVariable "PMC_grpNum";
PMC_grp_ind = 0;
publicVariable "PMC_grp_ind";
PMC_blufor = 0;
publicVariable "PMC_blufor";
PMC_opfor = 0;
publicVariable "PMC_opfor";
PMC_ind = 0;
publicVariable "PMC_ind";

// for infantry transport
PMC_InfTransport = 0;
publicVariable "PMC_InfTransport";

// waypoint creation
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Inf_Waypoints.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Vehicle_Waypoints.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Sentry_Inf_Waypoints.sqf";

// BLUFOR
//call compile preProcessFileLineNumbers "PMC\PMC_Create_US_Army.sqf";

// OPFOR
//call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Army.sqf";

waitUntil { !isnil "bis_fnc_init" };

// initial unit creation already in place all over the terrain (not just starting looper from the edges).
//_tmp = [] execVM "PMC\Initial_Unit_Creation.sqf";
//waitUntil { scriptDone _tmp; };

// small wait...
sleep 1;

// war unit creation system
[] execVM "PMC\War_BLUFOR.sqf";
// so that our stupid scripts wont conflict ;)
sleep 2;
[] execVM "PMC\War_OPFOR.sqf";
sleep 2;
[] execVM "PMC\War_IND.sqf";

// vehicles only
[] execVM "PMC\War_Vehicles.sqf";

// aircrafts
[(getPosASL pmc_blufor_start_1)] execVM "PMC\PMC_Aircraft_VTE_BLUFOR.sqf";
//[] execVM "PMC\PMC_Aircraft_OPFOR_MODIFIED.sqf";

// helicopters
[(getPosASL pmc_blufor_start_1)] execVM "PMC\PMC_Helo_VTE_BLUFOR.sqf";
//[] execVM "PMC\PMC_HeloOPFOR_MODIFIED.sqf";
