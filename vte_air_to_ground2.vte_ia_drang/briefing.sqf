waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Strike the four targets in your area. There is enemy artillery tubes and ZU-23 vehicles expected."]];

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
