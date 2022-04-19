private
[
	"_targetpoint",
	"_triggerArea",
	"_centerPos",
	"_worldSize"
];

_worldSize = _this select 0;
_centerPos = _worldSize / 2;

// center of the terrain
_targetpoint = [_centerPos, _centerPos, 0];
_triggerArea = _worldSize;

// BLUFOR
pmc_blufor_list = createTrigger ["EmptyDetector", _targetpoint];
pmc_blufor_list setTriggerActivation ["WEST", "PRESENT", true];
pmc_blufor_list setTriggerArea [_triggerArea, _triggerArea, 0, true];
pmc_blufor_list setTriggerTimeout [0, 0, 0, false];
pmc_blufor_list setTriggerStatements ["this", "", ""];

// OPFOR
pmc_opfor_list = createTrigger ["EmptyDetector", _targetpoint];
pmc_opfor_list setTriggerActivation ["EAST", "PRESENT", true];
pmc_opfor_list setTriggerArea [_triggerArea, _triggerArea, 0, true];
pmc_opfor_list setTriggerTimeout [0, 0, 0, false];
pmc_opfor_list setTriggerStatements ["this", "", ""];

// IND / Guer / Resistance
pmc_ind_list = createTrigger ["EmptyDetector", _targetpoint];
pmc_ind_list setTriggerActivation ["Guer", "PRESENT", true]; // resistance didn't work??
pmc_ind_list setTriggerArea [_triggerArea, _triggerArea, 0, true];
pmc_ind_list setTriggerTimeout [0, 0, 0, false];
pmc_ind_list setTriggerStatements ["this", "", ""];

// Anybody, DEBUG!
pmc_list = createTrigger ["EmptyDetector", _targetpoint];
pmc_list setTriggerActivation ["ANY", "PRESENT", true];
pmc_list setTriggerArea [_triggerArea, _triggerArea, 0, true];
pmc_list setTriggerTimeout [0, 0, 0, false];
pmc_list setTriggerStatements ["this", "", ""];
