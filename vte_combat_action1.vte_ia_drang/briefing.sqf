waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture and clear eight objectives in your region while denying enemy access to these said objectives."]];
		PMC_objective4 = player createSimpleTask ["Clear objective 4"];
		PMC_objective4 setSimpleTaskDescription ["Clear <marker name='target4'>objective 4</marker>","Clear objective 4","Clear objective 4"];
		PMC_objective4 setSimpleTaskDestination (getMarkerPos "target4");

		PMC_objective3 = player createSimpleTask ["Clear objective 3"];
		PMC_objective3 setSimpleTaskDescription ["Clear <marker name='target3'>objective 3</marker>","Clear objective 3","Clear objective 3"];
		PMC_objective3 setSimpleTaskDestination (getMarkerPos "target3");

		PMC_objective2 = player createSimpleTask ["Clear objective 2"];
		PMC_objective2 setSimpleTaskDescription ["Clear <marker name='target2'>objective 2</marker>","Clear objective 2","Clear objective 2"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target2");

		PMC_objective1 = player createSimpleTask ["Clear objective 1"];
		PMC_objective1 setSimpleTaskDescription ["Clear <marker name='target1'>objective 1</marker>","Clear objective 1","Clear objective 1"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;

		// NVA markers to empty for US units
		"opfor_target1" setMarkerTypeLocal "empty";
		"opfor_target2" setMarkerTypeLocal "empty";
		"opfor_target3" setMarkerTypeLocal "empty";
		"opfor_target4" setMarkerTypeLocal "empty";
		"start_nva" setMarkerTypeLocal "empty";
		"respawn_east" setMarkerTypeLocal "empty";
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Capture and clear eight objectives in your region while denying enemy access to these said objectives."]];
		PMC_objective_opfor4 = player createSimpleTask ["Clear objective 4"];
		PMC_objective_opfor4 setSimpleTaskDescription ["Clear <marker name='opfor_target4'>objective 4</marker>","Clear objective 4","Clear objective 4"];
		PMC_objective_opfor4 setSimpleTaskDestination (getMarkerPos "opfor_target4");

		PMC_objective_opfor3 = player createSimpleTask ["Clear objective 3"];
		PMC_objective_opfor3 setSimpleTaskDescription ["Clear <marker name='opfor_target3'>objective 3</marker>","Clear objective 3","Clear objective 3"];
		PMC_objective_opfor3 setSimpleTaskDestination (getMarkerPos "opfor_target3");

		PMC_objective_opfor2 = player createSimpleTask ["Clear objective 2"];
		PMC_objective_opfor2 setSimpleTaskDescription ["Clear <marker name='opfor_target2'>objective 2</marker>","Clear objective 2","Clear objective 2"];
		PMC_objective_opfor2 setSimpleTaskDestination (getMarkerPos "opfor_target2");

		PMC_objective_opfor1 = player createSimpleTask ["Clear objective 1"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Clear <marker name='opfor_target1'>objective 1</marker>","Clear objective 1","Clear objective 1"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective_opfor1;

		// US markers to empty for NVA units
		"target1" setMarkerTypeLocal "empty";
		"target2" setMarkerTypeLocal "empty";
		"target3" setMarkerTypeLocal "empty";
		"target4" setMarkerTypeLocal "empty";
		"start_us" setMarkerTypeLocal "empty";
		"respawn_west" setMarkerTypeLocal "empty";
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
