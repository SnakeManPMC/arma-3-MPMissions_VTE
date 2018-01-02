waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission", "Operation: Swift Fury<br/>Marsh Mellow Island June 1967<br/>"]];

		PMC_objective_blufor1 = player createSimpleTask ["Clear objective 1"];
		PMC_objective_blufor1 setSimpleTaskDescription ["Clear <marker name='target1'>objective 1</marker>", "Clear objective 1", "Clear objective 1"];
		PMC_objective_blufor1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective_blufor1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission", "Operation: Swift Fury<br/>Marsh Mellow Island June 1967<br/>"]];

		PMC_objective_opfor1 = player createSimpleTask ["Defend base"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Defend <marker name='target1'>base</marker> against US <marker name='attack'>attack</marker>.", "Defend base", "Defend base"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "attack");
		player setCurrentTask PMC_objective_opfor1;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
