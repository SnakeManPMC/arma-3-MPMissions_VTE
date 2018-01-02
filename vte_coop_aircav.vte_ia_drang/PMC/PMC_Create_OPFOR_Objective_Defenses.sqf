
private ["_grp","_respawnpoint","_targetpoint"];

diag_log "We are in PMC_Create_OPFOR_Objective_Defenses.sqf !";

// PMC_Patrol_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";

// PMC_Sentry_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Sentry_Inf_Waypoints.sqf";

// PMC_Create_Squad_NVA
call compile preProcessFileLineNumbers "PMC\PMC_Create_Squad_NVA.sqf";

// PMC_Create_Squad_VC
call compile preProcessFileLineNumbers "PMC\PMC_Create_Squad_VC.sqf";

for "_a" from 0 to 1 do
{
	_respawnpoint = PMC_Objectives_Array select _a;
	
	// create 1st squad of OPFOR, patrol
	_grp = [_respawnpoint] call PMC_Create_Squad_VC;
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	diag_log format ["_grp: %1, getPosASL leader _grp: %2", _grp, getPosASL leader _grp];

	// select target
	_targetpoint = _respawnpoint;
	
	// create waypoints
	[_grp, _targetpoint, 100] call PMC_Patrol_Inf_Waypoints;

	// write log to RPT
	diag_log format["PMC_Create_OPFOR_Objective_Defenses.sqf: Created group: %1 for %2", _grp, _a];

	// create 2nd squad of OPFOR, sentry
	_grp = [_respawnpoint] call PMC_Create_Squad_NVA;
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	diag_log format ["_grp: %1, getPosASL leader _grp: %2", _grp, getPosASL leader _grp];
	
	// select target
	_targetpoint = _respawnpoint;
	
	// create waypoints
	[_grp, _targetpoint, 0] call PMC_Sentry_Inf_Waypoints;

	// write log to RPT
	diag_log format["PMC_Create_OPFOR_Objective_Defenses.sqf: Created group: %1 for %2", _grp, _a];

	// create weapon
	[_respawnpoint] execVM "PMC\PMC_Create_NVA_static_weapon.sqf";

	// create vehicle
	[_respawnpoint] execVM "PMC\PMC_Create_Vehicle_OPFOR.sqf";

	// add our created enemies
	PMC_opfor = PMC_opfor + 22;

	// add one group created.
	PMC_grp_opfor = PMC_grp_opfor + 3;
	publicVariable "PMC_grp_opfor";
};

// show new amount of untis to clients
publicVariable "PMC_opfor";
