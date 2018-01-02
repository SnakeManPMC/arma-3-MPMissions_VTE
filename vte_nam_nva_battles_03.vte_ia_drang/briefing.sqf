waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord
		[
			"Diary",
			[
				"Mission",
				"NVA <marker name='attack'>Attack</marker> is under way for <marker name='usa'>Plei Me</marker>. Defend it at all costs!"
			]
		];
		PMC_objective1 = player createSimpleTask ["Defend Plei Me"];
		PMC_objective1 setSimpleTaskDescription
		[
			"Defend <marker name='usa'>Plei Me</marker>",
			"Defend Plei Me",
			"Defend Plei Me"
		];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "usa");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
