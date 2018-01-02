waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","American AirCav squads are approaching from <marker name='arrow'>east</marker> along the trail. Ambush and kill them!"]];
		PMC_objective1 = player createSimpleTask ["Kill amerikans"];
		PMC_objective1 setSimpleTaskDescription ["Kill <marker name='target1'>amerikans</marker>","Kill amerikans","Kill amerikans"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
