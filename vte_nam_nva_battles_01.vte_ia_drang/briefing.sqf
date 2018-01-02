waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Attack NVA and destroy them on Plei The village."]];
		PMC_objective1 = player createSimpleTask ["Clear village"];
		PMC_objective1 setSimpleTaskDescription ["Clear <marker name='nva'>village</marker>","Clear village","Clear village"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "nva");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","US forces are approaching from the north east, be careful and defend yourself."]];
		PMC_objective_opfor1 = player createSimpleTask ["Clear area"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Clear <marker name='usa'>area</marker>","Clear area","Clear area"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "usa");
		player setCurrentTask PMC_objective_opfor1;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
