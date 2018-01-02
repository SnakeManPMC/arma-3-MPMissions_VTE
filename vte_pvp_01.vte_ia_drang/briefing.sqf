waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Defend Plei Me SF base."]];
		PMC_objective1 = player createSimpleTask ["Defend Plei Me SF base"];
		PMC_objective1 setSimpleTaskDescription ["Defend <marker name='start'>US Base</marker>","Defend Plei Me SF base","Defend Plei Me SF base"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "start");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture Plei Me SF base."]];
		PMC_objective_opfor1 = player createSimpleTask ["Capture Plei Me SF base"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Capture <marker name='start'>Plei Me</marker>","Capture Plei Me SF base","Capture Plei Me SF base"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "start");
		player setCurrentTask PMC_objective_opfor1;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
