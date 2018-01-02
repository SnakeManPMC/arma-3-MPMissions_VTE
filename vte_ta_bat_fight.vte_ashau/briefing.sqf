waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission", "Defend base"]];
		PMC_objective_blufor1 = player createSimpleTask ["Defend base"];
		PMC_objective_blufor1 setSimpleTaskDescription ["US <marker name='start'>start</marker> in SF base, NVA/VC attacks the base.", "Defend base", "Defend base"];
		PMC_objective_blufor1 setSimpleTaskDestination (getMarkerPos "start");
		player setCurrentTask PMC_objective_blufor1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission", "Capture base"]];
		PMC_objective_opfor1 = player createSimpleTask ["Capture base"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Your NVA main force starts around the <marker name='start'>US base</marker>. It is your task to Capture base from US at any cost.", "Capture base", "Capture base"];
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
