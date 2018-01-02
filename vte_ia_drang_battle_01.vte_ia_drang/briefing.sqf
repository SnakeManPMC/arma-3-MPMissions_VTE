waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Attack NVA and destroy them on the hilltop."]];
		PMC_objective1 = player createSimpleTask ["Clear hilltop"];
		PMC_objective1 setSimpleTaskDescription ["Clear <marker name='target1'>hilltop</marker>","Clear hilltop","Clear hilltop"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","US forces are approaching from the valley, be careful and defend yourself."]];
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
