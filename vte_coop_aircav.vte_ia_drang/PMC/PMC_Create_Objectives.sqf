
private ["_PMC_tmp_array","_ran","_tlogic","_x"];

// WAIT for objective creation for clients
PMC_create_objectives = false;
publicVariable "PMC_create_objectives";
PMC_target1 = false;
PMC_target2 = false;
publicVariable "PMC_target1";
publicVariable "PMC_target2";

// make the array
PMC_Objectives_Array = [];
// create temp array from PMC_targets
_PMC_tmp_array = PMC_targets;

for [{_x = 1}, {_x <= 2}, {_x = _x + 1}] do
{
	// randomize the targets and choose one for the array.
	_ran = (floor random (count _PMC_tmp_array));
	_tlogic = (_PMC_tmp_array select _ran);
	_PMC_tmp_array = _PMC_tmp_array - [_tlogic];
	
	// add it to our public array seen on clients
	PMC_Objectives_Array = PMC_Objectives_Array + [_tlogic];
	
	diag_log "Running PMC_Create_OPFOR_Objective_Defenses.sqf...";

	// launch opfor defense script for created objectives
	[] execVM "PMC\PMC_Create_OPFOR_Objective_Defenses.sqf";
};

// when done, broad cast it to the clients
publicVariable "PMC_Objectives_Array";

// Give green light for objective creation for clients
PMC_create_objectives = true;
publicVariable "PMC_create_objectives";

diag_log format ["PMC_Objectives_Array: %1", PMC_Objectives_Array];
