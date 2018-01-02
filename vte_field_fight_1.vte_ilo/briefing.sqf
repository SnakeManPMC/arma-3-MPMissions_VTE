waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Defend field"]];

		PMC_objective1 = player createSimpleTask ["Defend field"];
		PMC_objective1 setSimpleTaskDescription ["US <marker name='start'>start</marker> in field, you are tasked to defend this field.", "Defend field", "defend field"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "start");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","US <marker name='start'>start</marker> in field, NVA/VC attacks this field."]];

		PMC_objective_opfor1 = player createSimpleTask ["Kill US troops"];
		PMC_objective_opfor1 setSimpleTaskDescription ["NVA must attack <marker name='start'>field</marker> and kill all US troops.", "Kill US troops", "Kill US troops"];
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
