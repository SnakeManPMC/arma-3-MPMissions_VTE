waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission", "Search The Old Lng Vei Village For Any Traces Of Charlie.<br/><br/>Mission By ANZAC SAS Boys."]];
		PMC_objective_blufor1 = player createSimpleTask ["Search Lng Vei"];
		PMC_objective_blufor1 setSimpleTaskDescription ["Search <marker name='zone1'>Lng Vei</marker> village.", "Search Lng Vei", "Search Lng Vei"];
		PMC_objective_blufor1 setSimpleTaskDestination (getMarkerPos "zone1");
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
