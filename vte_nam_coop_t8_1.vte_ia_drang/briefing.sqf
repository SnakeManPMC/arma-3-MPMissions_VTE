waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Intel","There could be few hardened anti aircraft sites located in our area of operations. Aircafts should use extreme caution."]];
		player createDiaryRecord ["Diary",["Mission","Your mission orders are to clear out the 8 targets marked on the map. Good luck."]];

		PMC_objective8 = player createSimpleTask ["Clear objective 8"];
		PMC_objective8 setSimpleTaskDescription ["Clear <marker name='target8'>objective 8</marker>","Clear objective 8","Clear objective 8"];
		PMC_objective8 setSimpleTaskDestination (getMarkerPos "target8");

		PMC_objective7 = player createSimpleTask ["Clear objective 7"];
		PMC_objective7 setSimpleTaskDescription ["Clear <marker name='target7'>objective 7</marker>","Clear objective 7","Clear objective 7"];
		PMC_objective7 setSimpleTaskDestination (getMarkerPos "target7");

		PMC_objective6 = player createSimpleTask ["Clear objective 6"];
		PMC_objective6 setSimpleTaskDescription ["Clear <marker name='target6'>objective 6</marker>","Clear objective 6","Clear objective 6"];
		PMC_objective6 setSimpleTaskDestination (getMarkerPos "target6");

		PMC_objective5 = player createSimpleTask ["Clear objective 5"];
		PMC_objective5 setSimpleTaskDescription ["Clear <marker name='target5'>objective 5</marker>","Clear objective 5","Clear objective 5"];
		PMC_objective5 setSimpleTaskDestination (getMarkerPos "target5");

		PMC_objective4 = player createSimpleTask ["Clear objective 4"];
		PMC_objective4 setSimpleTaskDescription ["Clear <marker name='target4'>objective 4</marker>","Clear objective 4","Clear objective 4"];
		PMC_objective4 setSimpleTaskDestination (getMarkerPos "target4");

		PMC_objective3 = player createSimpleTask ["Clear objective 3"];
		PMC_objective3 setSimpleTaskDescription ["Clear <marker name='target3'>objective 3</marker>","Clear objective 3","Clear objective 3"];
		PMC_objective3 setSimpleTaskDestination (getMarkerPos "target3");

		PMC_objective2 = player createSimpleTask ["Clear objective 2"];
		PMC_objective2 setSimpleTaskDescription ["Clear <marker name='target2'>objective 2</marker>","Clear objective 2","Clear objective 2"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target2");

		PMC_objective1 = player createSimpleTask ["Clear objective 1"];
		PMC_objective1 setSimpleTaskDescription ["Clear <marker name='target1'>objective 1</marker>","Clear objective 1","Clear objective 1"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
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
