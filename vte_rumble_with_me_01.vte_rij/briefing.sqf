waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture village."]];
		PMC_objective1 = player createSimpleTask ["Capture village"];
		PMC_objective1 setSimpleTaskDescription ["SF forces and NVA/VC forces try to <marker name='target1'>capture</marker> village.","Capture village","Capture village"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture village."]];
		PMC_objective_opfor1 = player createSimpleTask ["Capture village"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Your NVA main force try to <marker name='target1'>capture</marker> village.","Capture village","Capture village"];
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
