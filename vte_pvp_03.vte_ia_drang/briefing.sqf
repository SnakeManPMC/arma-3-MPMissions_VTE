waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture LZ Columbus."]];
		PMC_objective1 = player createSimpleTask ["Capture LZ Columbus"];
		PMC_objective1 setSimpleTaskDescription ["USMC squads start just east of main target <marker name='target1'>LZ Columbus</marker>. It is your goal to capture LZ Columbus from NVA/VC hands.","Capture LZ Columbus","Capture LZ Columbus"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Defend LZ Columbus."]];
		PMC_objective_opfor1 = player createSimpleTask ["Defend LZ Columbus"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Your NVA main force starts at <marker name='target1'>LZ Columbus</marker>. It is your task to defend LZ Columbus from US attack at any cost.","Defend LZ Columbus","Defend LZ Columbus"];
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
