waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture LZ Columbus and hilltop."]];
		player createDiaryRecord ["Diary",["Orders","3 AirCav squads start at <marker name='aircavstart'>AirCav HQ</marker>. Those squads get inserted with Hueys into <marker name='insert'>beach LZ</marker>. Special Forces squad is located in Plei Me <marker name='sfstart'>SF HQ</marker>. Proceed to clear <marker name='target1'>LZ Columbus</marker> and <marker name='target2'>hilltop</marker> objectives."]];
		PMC_objective1 = player createSimpleTask ["Capture LZ Columbus and hilltop"];
		PMC_objective1 setSimpleTaskDescription ["Capture <marker name='target1'>LZ Columbus</marker> and <marker name='target2'>hilltop</marker>","Capture LZ Columbus and hilltop","Capture LZ Columbus and hilltop"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
		"nvastart" setMarkerTypeLocal "empty";
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Defend LZ Columbus and hilltop."]];
		player createDiaryRecord ["Diary",["Orders","Your NVA main force starts at <marker name='nvastart'>jungle</marker>. It is your task to defend <marker name='target1'>LZ Columbus</marker> and <marker name='target2'>hilltop</marker> from US attack at any cost."]];
		PMC_objective_opfor1 = player createSimpleTask ["Defend LZ Columbus and hilltop."];
		PMC_objective_opfor1 setSimpleTaskDescription ["Defend <marker name='target1'>LZ Columbus</marker> and <marker name='target2'>hilltop</marker>.","Defend LZ Columbus and hilltop","Defend LZ Columbus and hilltop"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective_opfor1;
		"insert" setMarkerTypeLocal "empty";
		"sfstart" setMarkerTypeLocal "empty";
		"aircavstart" setMarkerTypeLocal "empty";
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
