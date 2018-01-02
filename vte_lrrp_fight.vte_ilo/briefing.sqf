waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Defend field HQ"]];

		player createDiaryRecord ["Diary",["Diary","That was so long patrol... and now the gooks attack, what next?"]];

		PMC_objective1 = player createSimpleTask ["Defend field HQ"];
		PMC_objective1 setSimpleTaskDescription ["You have just returned from long patrol, but the enemy is attacking your field HQ. Defend the <marker name='start'>village</marker> at all cost.", "Defend field HQ", "Defend field HQ"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "start");
		player setCurrentTask PMC_objective1;
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
