waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","US Navy SEAL Team <marker name='start'>start</marker> at river, patrol the area and clear <marker name='target1'>target 1</marker>, <marker name='target2'>target 2</marker> and <marker name='target3'>target 3</marker> locations."]];

		PMC_objective3 = player createSimpleTask ["Patrol Area 3"];
		PMC_objective3 setSimpleTaskDescription ["Patrol the area and clear <marker name='target3'>target 3</marker>.", "Patrol Area 3", "Patrol Area 3"];
		PMC_objective3 setSimpleTaskDestination (getMarkerPos "target3");

		PMC_objective2 = player createSimpleTask ["Patrol Area 2"];
		PMC_objective2 setSimpleTaskDescription ["Patrol the area and clear <marker name='target2'>target 2</marker>.", "Patrol Area 2", "Patrol Area 2"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target2");

		PMC_objective1 = player createSimpleTask ["Patrol Area 1"];
		PMC_objective1 setSimpleTaskDescription ["Patrol the area and clear <marker name='target1'>target 1</marker>.", "Patrol Area 1", "Patrol Area 1"];
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
