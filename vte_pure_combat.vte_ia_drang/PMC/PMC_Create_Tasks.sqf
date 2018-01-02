
private
[
	"_markerobj",
	"_targetpoint",
	"_triggerArea",
	"_triggerTimeout",
	"_z"
];

// waits until server gives go ahead to create objective for client.
waitUntil
{
	PMC_create_objectives
};

// size of trigger area
_triggerArea = 100;
// timeout for trigger to activate
_triggerTimeout = 240;

// create tasks in reverse order :)

// objective 2

if (!PMC_target2) then
{
	// select 1 doesn't work if you only have one (1) objective :)
	_targetpoint = getPosASL (PMC_Objectives_Array select 1);

	_z = createTrigger ["EmptyDetector", _targetpoint];
// trigger setTriggerActivation [by, type, repeating]
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", false];
	_z setTriggerArea [_triggerArea, _triggerArea, 0, true];
// trigger setTriggerTimeout [min, mid, max, interruptable]
	_z setTriggerTimeout [(_triggerTimeout/4), (_triggerTimeout/2), _triggerTimeout, false];
	_z setTriggerStatements ["this && player in thisList", "this = ['PMC_target2', PMC_objective2] execVM ""PMC\PMC_Objective_Completed.sqf"";", ""];
	
	_markerobj = createMarkerLocal ["PMC_target2", _targetpoint];
	_markerobj setMarkerShapeLocal "ELLIPSE";
	_markerobj setMarkerColorLocal "ColorRed";
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [_triggerArea, _triggerArea];
	
	PMC_objective2 = player createSimpleTask ["Clear objective 2"];
	PMC_objective2 setSimpleTaskDescription ["Clear <marker name='PMC_target2'>objective 2</marker>","Clear objective 2","Clear objective 2"];
	PMC_objective2 setSimpleTaskDestination (getMarkerPos "PMC_target2");
}
// objective 2 has been completed!
else
{
	_targetpoint = getPosASL (PMC_Objectives_Array select 1);
	_markerobj = createMarkerLocal ["PMC_target2", _targetpoint];
	_markerobj setMarkerShapeLocal "dot";
	_markerobj setMarkerColorLocal "ColorGreen";
	
	PMC_objective2 = player createSimpleTask ["Clear objective 2"];
	PMC_objective2 setSimpleTaskDescription ["Clear <marker name='PMC_target2'>objective 2</marker>","Clear objective 2","Clear objective 2"];
	PMC_objective2 setSimpleTaskDestination (getMarkerPos "PMC_target2");
	PMC_objective2 setTaskState "succeeded";
};


// objective 1

if (!PMC_target1) then
{
	_targetpoint = getPosASL (PMC_Objectives_Array select 0);
	
	_z = createTrigger ["EmptyDetector", _targetpoint];
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", false];
	_z setTriggerArea [_triggerArea, _triggerArea, 0, true];
	_z setTriggerTimeout [(_triggerTimeout/4), (_triggerTimeout/2), _triggerTimeout, false];
	_z setTriggerStatements ["this && player in thisList", "this = ['PMC_target1', PMC_objective1] execVM ""PMC\PMC_Objective_Completed.sqf"";", ""];
	
	_markerobj = createMarkerLocal ["PMC_target1", _targetpoint];
	_markerobj setMarkerShapeLocal "ELLIPSE";
	_markerobj setMarkerColorLocal "ColorRed";
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [_triggerArea, _triggerArea];
	
	PMC_objective1 = player createSimpleTask ["Clear objective 1"];
	PMC_objective1 setSimpleTaskDescription ["Clear <marker name='PMC_target1'>objective 1</marker>","Clear objective 1","Clear objective 1"];
	PMC_objective1 setSimpleTaskDestination (getMarkerPos "PMC_target1");
	player setCurrentTask PMC_objective1;
}
// objective 1 has been completed!
else
{
	_targetpoint = getPosASL (PMC_Objectives_Array select 0);
	_markerobj = createMarkerLocal ["PMC_target1", _targetpoint];
	_markerobj setMarkerShapeLocal "dot";
	_markerobj setMarkerColorLocal "ColorGreen";
	
	PMC_objective1 = player createSimpleTask ["Clear objective 1"];
	PMC_objective1 setSimpleTaskDescription ["Clear <marker name='PMC_target1'>objective 1</marker>","Clear objective 1","Clear objective 1"];
	PMC_objective1 setSimpleTaskDestination (getMarkerPos "PMC_target1");
	PMC_objective1 setTaskState "succeeded";
};
