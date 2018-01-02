waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Intel","Intelligence suggests that there are ZU-23 Anti Air units operating in the area."]];
		player createDiaryRecord ["Diary",["Mission","Your based in <marker name='us'>Airbase</marker>, proceed to clear the 4 targets marked on the map. Good luck."]];
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
