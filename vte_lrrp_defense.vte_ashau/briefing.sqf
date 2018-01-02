waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["TACTICAL",""]];

		player createDiaryRecord ["Diary",["ORDERS","Your team <marker name='start'>start</marker> in base thats under attack. Defend it until you have repelled the full enemy force. HQ will monitor the situation from the air and will report in when the enemy is retreating."]];

		player createDiaryRecord ["Diary",["INTEL",""]];

		player createDiaryRecord ["Diary",["GEN SITREP",""]];

		player createDiaryRecord ["Diary",["Diary","Damn VC. I'll blew all them to hell."]];

		PMC_objective_blufor1 = player createSimpleTask ["Defend base"];
		PMC_objective_blufor1 setSimpleTaskDescription ["Your team <marker name='start'>start</marker> in base thats under attack. Defend it until you have repelled the full enemy force. HQ will monitor the situation from the air and will report in when the enemy is retreating.", "Defend base", "Defend base"];
		PMC_objective_blufor1 setSimpleTaskDestination (getMarkerPos "start");
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
