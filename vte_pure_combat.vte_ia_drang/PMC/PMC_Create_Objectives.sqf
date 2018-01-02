
private
[
	"_PMC_tmp_array",
	"_ran",
	"_tlogic"
];

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

// special pmc pure combat fiddle, our own bases.
_PMC_tmp_array = _PMC_tmp_array - [pmc_1, pmc_7];

// randomize the targets and choose one for the array.
_ran = (floor random (count _PMC_tmp_array));
_tlogic = (_PMC_tmp_array select _ran);
_PMC_tmp_array = _PMC_tmp_array - [_tlogic];

// add it to our public array seen on clients
PMC_Objectives_Array = PMC_Objectives_Array + [_tlogic];

// do it again :)
_ran = (floor random (count _PMC_tmp_array));
_tlogic = (_PMC_tmp_array select _ran);
_PMC_tmp_array = _PMC_tmp_array - [_tlogic];

// add it to our public array seen on clients
PMC_Objectives_Array = PMC_Objectives_Array + [_tlogic];

// when done, broad cast it to the clients
publicVariable "PMC_Objectives_Array";

// Give green light for objective creation for clients
PMC_create_objectives = true;
publicVariable "PMC_create_objectives";
