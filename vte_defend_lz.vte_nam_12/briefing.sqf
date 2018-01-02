waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture landing zone."]];
		PMC_objective1 = player createSimpleTask ["Capture LZ"];
		PMC_objective1 setSimpleTaskDescription ["Capture <marker name='lz'>LZ</marker>","Capture LZ","Capture LZ"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "lz");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Defend land patch."]];
		PMC_objective_opfor1 = player createSimpleTask ["Defend land patch"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Defend <marker name='lz'>land patch</marker>","Defend land patch","Defend land patch"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "lz");
		player setCurrentTask PMC_objective_opfor1;
		"aircav" setMarkerTypeLocal "empty";
		"aircav_1" setMarkerTypeLocal "empty";
		"aircav_2" setMarkerTypeLocal "empty";
		"aircav_3" setMarkerTypeLocal "empty";
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
