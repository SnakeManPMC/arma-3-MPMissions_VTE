waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture Plei Me SF base before the NVA does."]];
		PMC_objective1 = player createSimpleTask ["Capture Plei Me SF base"];
		PMC_objective1 setSimpleTaskDescription ["Capture <marker name='target1'>Plei Me SF base</marker>", "Capture Plei Me SF base", "Capture Plei Me SF base"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission", "Capture Plei Me SF base before AirCav does."]];
		PMC_objective_opfor1 = player createSimpleTask ["Capture Plei Me SF base"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Capture <marker name='target1'>Plei Me SF base</marker>", "Capture Plei Me SF base", "Capture Plei Me SF base"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective_opfor1;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
