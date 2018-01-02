waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","US start in hilltop, NVA/VC attacks the hilltop. Whos left standing is the winner."]];

		PMC_objective1 = player createSimpleTask ["Defend hilltop"];
		PMC_objective1 setSimpleTaskDescription ["US <marker name='start'>start</marker> in hilltop, NVA/VC attacks the hilltop. Whos left standing is the winner.", "Defend hilltop", "Defend hilltop"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "start");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","US <marker name='start'>start</marker> in hilltop, NVA/VC attacks the hilltop. Whos left standing is the winner."]];

		PMC_objective_opfor1 = player createSimpleTask ["Kill US troops"];
		PMC_objective_opfor1 setSimpleTaskDescription ["US start in hilltop, NVA/VC attacks the hilltop. Whos left standing is the winner.", "Kill US troops", "Kill US troops"];
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
