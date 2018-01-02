waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Diary","Lot of VC to kill...<br/><br/>Original OFP VTE mission, ported to ArmA in April 2008."]];

		player createDiaryRecord ["Diary",["Mission","Capture the objectives."]];

// nva hq
		PMC_objective11 = player createSimpleTask ["Destroy NVA HQ"];
		PMC_objective11 setSimpleTaskDescription ["Destroy NVA HQ somewhere on the field.", "Destroy NVA HQ", "Destroy NVA HQ"];

// 10
		PMC_objective10 = player createSimpleTask ["Capture village 10"];
		PMC_objective10 setSimpleTaskDescription ["Capture <marker name='target10'>village #10</marker>", "Capture village 10", "Capture village 10"];
		PMC_objective10 setSimpleTaskDestination (getMarkerPos "target10");

// 9
		PMC_objective9 = player createSimpleTask ["Capture village 9"];
		PMC_objective9 setSimpleTaskDescription ["Capture <marker name='target9'>village #2</marker>", "Capture village 9", "Capture village 9"];
		PMC_objective9 setSimpleTaskDestination (getMarkerPos "target9");

// 8
		PMC_objective8 = player createSimpleTask ["Capture village 8"];
		PMC_objective8 setSimpleTaskDescription ["Capture <marker name='target8'>village #8</marker>", "Capture village 8", "Capture village 8"];
		PMC_objective8 setSimpleTaskDestination (getMarkerPos "target8");

// 7
		PMC_objective7 = player createSimpleTask ["Capture village 7"];
		PMC_objective7 setSimpleTaskDescription ["Capture <marker name='target7'>village #7</marker>", "Capture village 7", "Capture village 7"];
		PMC_objective7 setSimpleTaskDestination (getMarkerPos "target7");

// 6
		PMC_objective6 = player createSimpleTask ["Capture village 6"];
		PMC_objective6 setSimpleTaskDescription ["Capture <marker name='target6'>village #6</marker>", "Capture village 6", "Capture village 6"];
		PMC_objective6 setSimpleTaskDestination (getMarkerPos "target6");

// 5
		PMC_objective5 = player createSimpleTask ["Capture village 5"];
		PMC_objective5 setSimpleTaskDescription ["Capture <marker name='target5'>village #5</marker>", "Capture village 5", "Capture village 5"];
		PMC_objective5 setSimpleTaskDestination (getMarkerPos "target5");

// 4
		PMC_objective4 = player createSimpleTask ["Capture village 4"];
		PMC_objective4 setSimpleTaskDescription ["Capture <marker name='target4'>village #4</marker>", "Capture village 4", "Capture village 4"];
		PMC_objective4 setSimpleTaskDestination (getMarkerPos "target4");

// 3
		PMC_objective3 = player createSimpleTask ["Capture village 3"];
		PMC_objective3 setSimpleTaskDescription ["Capture <marker name='target3'>village #3</marker>", "Capture village 3", "Capture village 3"];
		PMC_objective3 setSimpleTaskDestination (getMarkerPos "target3");

// 2
		PMC_objective2 = player createSimpleTask ["Capture village 2"];
		PMC_objective2 setSimpleTaskDescription ["Capture <marker name='target2'>village #2</marker>", "Capture village 2", "Capture village 2"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target2");

// 1
		PMC_objective1 = player createSimpleTask ["Capture village 1"];
		PMC_objective1 setSimpleTaskDescription ["Capture <marker name='target1'>village #1</marker>", "Capture village 1", "Capture village 1"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
