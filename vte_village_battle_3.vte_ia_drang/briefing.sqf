waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Neutralize all enemies in Plei Lao Tchin village."]];
		PMC_objective1 = player createSimpleTask ["Clear village"];
		PMC_objective1 setSimpleTaskDescription ["Clear <marker name='target1'>village</marker>","Clear village","Clear village"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Enemy soldiers approaching from the south east, kill them all!"]];
		PMC_objective2 = player createSimpleTask ["Defend village"];
		PMC_objective2 setSimpleTaskDescription ["Defend <marker name='target1'>village</marker>","Defend village","Defend village"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective2;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
