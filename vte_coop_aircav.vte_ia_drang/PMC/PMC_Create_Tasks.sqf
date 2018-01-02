
private ["_targetpoint","_triggerArea","_triggerTimeout","_z"];

// waits until server gives go ahead to create objective for client.
waitUntil
{
	PMC_create_objectives
};

// size of trigger area
_triggerArea = 100;
// timeout for trigger to activate
_triggerTimeout = 0;

diag_log format
[
	"PMC_Create_Tasks: PMC_target1: %1, PMC_target2: %2, PMC_Objectives_Array: %3",
	PMC_target1,
	PMC_target2,
	PMC_Objectives_Array
];

// create tasks in reverse order :)

// objective 2

if (PMC_target2) then
{
/*
	_targetpoint = getPosASL (PMC_Objectives_Array select 1);
	_markerobj = createMarkerLocal ["PMC_target_marker_2", _targetpoint];
	_markerobj setMarkerShapeLocal "mil_dot";
	_markerobj setMarkerColorLocal "ColorGreen";
	
	PMC_objective2 = player createSimpleTask ["Clear objective 2"];
	PMC_objective2 setSimpleTaskDescription ["Clear <marker name='PMC_target_marker_2'>objective 2</marker>", "Clear objective 2", "Clear objective 2"];
	PMC_objective2 setSimpleTaskDestination (getMarkerPos "PMC_target_marker_2");
	PMC_objective2 setTaskState "succeeded";

	diag_log format ["PMC_Create_Tasks created marker only for PMC_target2, _targetpoint: %1", _targetpoint];
*/
}
else
{
	// select 1 doesn't work if you only have one (1) objective :)
	_targetpoint = getPosASL (PMC_Objectives_Array select 1);

	_z = createTrigger ["EmptyDetector", _targetpoint];
// trigger setTriggerActivation [by, type, repeating]
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", false];
	_z setTriggerArea [_triggerArea, _triggerArea, 0, true];
// trigger setTriggerTimeout [min, mid, max, interruptable]
	_z setTriggerTimeout [_triggerTimeout, _triggerTimeout, _triggerTimeout, false];
// old	_z setTriggerStatements ["this && player in thisList", "diag_log 'pmc_target2 trigger activated'; hint 'pmc_target2 trigger activated!'; this = [] execVM 'PMC\PMC_Obj2.sqf';", ""];
	_z setTriggerStatements ["this && player in thisList", "diag_log 'pmc_target2 trigger activated'; hint 'pmc_target2 trigger activated!'; [""PMC_objective2"", ""succeeded""] call SHK_Taskmaster_Upd;", ""];

/*	
	_markerobj = createMarkerLocal ["PMC_target_marker_2", _targetpoint];
	_markerobj setMarkerShapeLocal "ELLIPSE";
	_markerobj setMarkerColorLocal "ColorRed";
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [_triggerArea, _triggerArea];
	
	PMC_objective2 = player createSimpleTask ["Clear objective 2"];
	PMC_objective2 setSimpleTaskDescription ["Clear <marker name='PMC_target_marker_2'>objective 2</marker>", "Clear objective 2", "Clear objective 2"];
	PMC_objective2 setSimpleTaskDestination (getMarkerPos "PMC_target_marker_2");

	diag_log format ["PMC_Create_Tasks created trigger + marker for PMC_target2, _targetpoint: %1, _z: %2", _targetpoint, (getPosASL _z)];
*/
};


// objective 1

if (PMC_target1) then
{
/*
	_targetpoint = getPosASL (PMC_Objectives_Array select 0);
	_markerobj = createMarkerLocal ["PMC_target_marker_1", _targetpoint];
	_markerobj setMarkerShapeLocal "mil_dot";
	_markerobj setMarkerColorLocal "ColorGreen";
	
	PMC_objective1 = player createSimpleTask ["Clear objective 1"];
	PMC_objective1 setSimpleTaskDescription ["Clear <marker name='PMC_target_marker_1'>objective 1</marker>", "Clear objective 1", "Clear objective 1"];
	PMC_objective1 setSimpleTaskDestination (getMarkerPos "PMC_target_marker_1");
	PMC_objective1 setTaskState "succeeded";

	diag_log format ["PMC_Create_Tasks created marker only for PMC_target1, _targetpoint: %1", _targetpoint];
*/
}
else
{
	_targetpoint = getPosASL (PMC_Objectives_Array select 0);
	
	_z = createTrigger ["EmptyDetector", _targetpoint];
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", false];
	_z setTriggerArea [_triggerArea, _triggerArea, 0, true];
	_z setTriggerTimeout [0, 0, 0, false];
//old	_z setTriggerStatements ["this && player in thisList", "diag_log 'pmc_target1 trigger activated'; hint 'pmc_target1 trigger activated!'; this = [] execVM 'PMC\PMC_Obj1.sqf';", ""];
	_z setTriggerStatements ["this && player in thisList", "diag_log 'pmc_target1 trigger activated'; hint 'pmc_target1 trigger activated!'; [""PMC_objective1"", ""succeeded""] call SHK_Taskmaster_Upd;", ""];
/*	
	_markerobj = createMarkerLocal ["PMC_target_marker_1", _targetpoint];
	_markerobj setMarkerShapeLocal "ELLIPSE";
	_markerobj setMarkerColorLocal "ColorRed";
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [_triggerArea, _triggerArea];
	
	PMC_objective1 = player createSimpleTask ["Clear objective 1"];
	PMC_objective1 setSimpleTaskDescription ["Clear <marker name='PMC_target_marker_1'>objective 1</marker>","Clear objective 1","Clear objective 1"];
	PMC_objective1 setSimpleTaskDestination (getMarkerPos "PMC_target_marker_1");
	player setCurrentTask PMC_objective1;
*/
	diag_log format ["PMC_Create_Tasks created trigger + marker for PMC_target1, _targetpoint: %1, _z: %2", _targetpoint, (getPosASL _z)];
};
