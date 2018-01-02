waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission", "Operation: Fire Thrust<br/>Pleiku 1965<br/>Destroy two objectives. US forces <marker name='base'>start</marker at the base.<br/><br/>You have two LZ's selected, <marker name='lz'>LZ 1</marker> and <marker name='2'>LZ 2</marker>"]];

// 2
		PMC_objective_blufor2 = player createSimpleTask ["Destroy obj 2"];
		PMC_objective_blufor2 setSimpleTaskDescription ["Seek and destroy <marker name='3'>obj 2</marker>", "Destroy obj 2", "Destroy obj 2"];
		PMC_objective_blufor2 setSimpleTaskDestination (getMarkerPos "1");

// 1
		PMC_objective_blufor1 = player createSimpleTask ["Destroy obj 1"];
		PMC_objective_blufor1 setSimpleTaskDescription ["Seek and destroy <marker name='1'>obj 1</marker>", "Destroy obj 1", "Destroy obj 1"];
		PMC_objective_blufor1 setSimpleTaskDestination (getMarkerPos "1");
		player setCurrentTask PMC_objective_blufor1;
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
