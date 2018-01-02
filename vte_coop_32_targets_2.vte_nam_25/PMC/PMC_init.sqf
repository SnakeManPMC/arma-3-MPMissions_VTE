private ["_PMC_tmp_array","_ran","_respawnpoint","_targetpoint","_tlogic","_tmp","_x","_grp"];

// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

// set our enemy occupy numbers (paramsarray select 3)
[] execVM "PMC\PMC_ObjectivesOccupiedByEnemy.sqf";

// set our enemy sam sites alive or not (paramsarray select 4)
[] execVM "PMC\PMC_SAMSitesDisabledSetting.sqf";

// set our civilians disabled or not
[] execVM "PMC\PMC_CiviliansDisabledSetting.sqf";

PMC_debug = false;
publicVariable "PMC_debug";
pmc_cu = 0;
pmc_grp_opfor = 0;
pmc_opfor = 0;
PMC_killedNum = 0;
publicVariable "PMC_killedNum";
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";

PMC_grpNum = 0;
publicVariable "PMC_grpNum";

_tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil
{
	scriptDone _tmp;
};

// PMC_Patrol_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";

// PMC_Sentry_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Sentry_Inf_Waypoints.sqf";

// PMC_Create_Squad_NVA
call compile preProcessFileLineNumbers "PMC\PMC_Create_Squad_NVA.sqf";

// PMC_Create_Squad_VC
call compile preProcessFileLineNumbers "PMC\PMC_Create_Squad_VC.sqf";

// PMC_Create_Squad_Villagers
call compile preProcessFileLineNumbers "PMC\PMC_Create_Squad_Villagers.sqf";

// create temp array from PMC_targets
_PMC_tmp_array = PMC_targets;

// create enemies to description.ext chosen number of random targets :)
for [{_x = 1}, {_x <= PMC_EnemyOccupy}, {_x = _x + 1}] do
{
	// randomize the targets and choose one for the array removing it so it wont be chosen again
	_ran = (floor random (count _PMC_tmp_array));
	_tlogic = (_PMC_tmp_array select _ran);
	_PMC_tmp_array = _PMC_tmp_array - [_tlogic];

	_respawnpoint = _tlogic;
	
	// create 1st squad of OPFOR, patrol
	_grp = [_respawnpoint] call PMC_Create_Squad_VC;
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	if (PMC_debug) then
	{
		diag_log format ["_grp: %1, getPosASL leader _grp: %2", _grp, getPosASL leader _grp];
	};

	// select target
	_targetpoint = _respawnpoint;
	
	// create waypoints
	[_grp, _targetpoint, 100] call PMC_Patrol_Inf_Waypoints;

	if (PMC_debug) then
	{
		diag_log format["PMC_Create_OPFOR_Objective_Defenses.sqf: Created group: %1 for %2", _grp];
	};
	
	// create 2nd squad of OPFOR, sentry
	_grp = [_respawnpoint] call PMC_Create_Squad_NVA;
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	if (PMC_debug) then
	{
		diag_log format ["_grp: %1, getPosASL leader _grp: %2", _grp, getPosASL leader _grp];
	};
	
	// select target
	_targetpoint = _respawnpoint;
	
	// create waypoints
	[_grp, _targetpoint, 0] call PMC_Sentry_Inf_Waypoints;

	if (PMC_debug) then
	{
		diag_log format["PMC_Create_OPFOR_Objective_Defenses.sqf: Created group: %1 for %2", _grp];
	};
	
	// create weapon
	[getPosASL _respawnpoint] execVM "PMC\PMC_Create_NVA_static_weapon.sqf";

	// create vehicle
	[getPosASL _respawnpoint] execVM "PMC\PMC_Create_Vehicle_OPFOR.sqf";

	// create SAM site and add some randomness to it as we don't want sam sites to EVERY objective.
	if (!PMC_DisableSAMSites && (random 100 < 50)) then
	{
		[getPosASL _respawnpoint] execVM "PMC\PMC_Create_SAMSite.sqf";
	};

	// add our created enemies
	PMC_opfor = PMC_opfor + 22;

	// civilians
	//(count (nearestObjects [_respawnpoint, ["house"], 200]) > 0)
	//if (count (_respawnpoint nearObjects ["house", 100]) > 0) then
	if (!PMC_DisableCivilians && (random 100 < 50)) then
	{
		_grp = [_respawnpoint] call PMC_Create_Squad_Villagers;
	
		// disable their AI
		[_grp] execVM "PMC\PMC_Group_DisableAI.sqf";
	
		// create waypoints
		[_grp, _targetpoint, 0] call PMC_Sentry_Inf_Waypoints;
	};

	// add one group created.
	PMC_grp_opfor = PMC_grp_opfor + 3;
	publicVariable "PMC_grp_opfor";
};

// show new amount of untis to clients
publicVariable "PMC_opfor";

diag_log "Enemy forces creation is complete, mission is ready get going :)";
