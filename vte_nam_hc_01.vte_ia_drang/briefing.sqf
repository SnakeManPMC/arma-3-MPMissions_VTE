waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Enemy forces are attacking from West and South West. Defend the base at any cost."]];
		PMC_objective1 = player createSimpleTask ["Defend Plei Me SF base"];
		PMC_objective1 setSimpleTaskDescription ["Defend <marker name='target1'>Plei Me SF base</marker>","Defend Plei Me SF base","Defend Plei Me SF base"];
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
