waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","You are tasked to defend <marker name='target1'>Plei Me SF base</marker>. We have recon forces indicating massive NVA assault on the way. Prepare to defend yourself!"]];
		PMC_objective1 = player createSimpleTask ["Defend Plei Me SF base"];
		PMC_objective1 setSimpleTaskDescription ["Defend <marker name='target1'>Plei Me SF base</marker>","Defend Plei Me SF base","Defend Plei Me SF base"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","You must attack and seize Plei Me SF base from the US bastards."]];
		PMC_objective2 = player createSimpleTask ["Capture Plei Me SF base"];
		PMC_objective2 setSimpleTaskDescription ["Capture <marker name='target1'>Plei Me SF base</marker>","Capture Plei Me SF base","Capture Plei Me SF base"];
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
