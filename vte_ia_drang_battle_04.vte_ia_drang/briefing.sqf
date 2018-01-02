waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","You have three targets, LZ 1, LZ 2 and LZ 3. You must clear them all. Use Huey helicopters to fly the objective and take out all enemy forces."]];
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
		player createDiaryRecord ["Diary",["Mission","US forces are operating this area. Keep the open areas (marked as <marker name='lz1'>LZ 1</marker>, <marker name='lz2'>LZ 2</marker> and <marker name='lz3'>LZ 3</marker>) clear and watch out for helicopters."]];
		"start" setMarkerTypeLocal "empty";
		"insert" setMarkerTypeLocal "empty";
		"insert_1" setMarkerTypeLocal "empty";
		"insert_2" setMarkerTypeLocal "empty";
		"insert_3" setMarkerTypeLocal "empty";
		"target1" setMarkerTypeLocal "empty";
		"target2" setMarkerTypeLocal "empty";
		"target3" setMarkerTypeLocal "empty";

		"area" setMarkerSizeLocal [0,0];
		"area_1" setMarkerSizeLocal [0,0];
		"area_2" setMarkerSizeLocal [0,0];
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
