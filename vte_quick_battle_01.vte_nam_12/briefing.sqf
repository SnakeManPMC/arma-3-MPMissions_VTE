waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture field."]];
		PMC_objective1 = player createSimpleTask ["Capture field"];
		PMC_objective1 setSimpleTaskDescription ["Australian forces <marker name='start'>start</marker> next to a field. Your task is to capture the field.","Capture field","Capture field"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "start");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture field."]];
		PMC_objective_opfor1 = player createSimpleTask ["Capture field"];
		PMC_objective_opfor1 setSimpleTaskDescription ["NVA/VC forces <marker name='start'>start</marker> next to a field. Your task is to capture the field.","Capture field","Capture field"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "start");
		player setCurrentTask PMC_objective_opfor1;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
