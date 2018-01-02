waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","US <marker name='respawn_west'>start</marker> in street. Capture the bridge."]];

		PMC_objective1 = player createSimpleTask ["Capture bridge"];
		PMC_objective1 setSimpleTaskDescription ["US <marker name='respawn_west'>start</marker> in street. Capture the <marker name='target'>bridge</marker>.", "Capture bridge", "Capture bridge"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","NVA <marker name='respawn_east'>start</marker> in street. Capture the bridge."]];

		PMC_objective_opfor1 = player createSimpleTask ["Capture bridge"];
		PMC_objective_opfor1 setSimpleTaskDescription ["NVA <marker name='respawn_east'>start</marker> in street. Capture the <marker name='target'>bridge</marker>.", "Capture the bridge", "Capture the bridge"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "target");
		player setCurrentTask PMC_objective_opfor1;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
