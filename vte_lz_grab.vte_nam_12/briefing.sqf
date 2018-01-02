waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Secure 4 LZ's"]];

		PMC_objective_blufor1 = player createSimpleTask ["Secure 4 LZ's"];
		PMC_objective_blufor1 setSimpleTaskDescription ["Your team <marker name='start'>start</marker> from base. Setup 4 Landing Zones (LZ's) by going into the location and calling radio 0-0-1.<br/><br/>Initially use the boat on the eastern shore of the base to get into the mainland.<br/><br/>When the LZ is set, respawn is moved there.", "Secure 4 LZ's", "Secure 4 LZ's"];
		//PMC_objective1 setSimpleTaskDestination (getMarkerPos "start");
		player setCurrentTask PMC_objective_blufor1;
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
