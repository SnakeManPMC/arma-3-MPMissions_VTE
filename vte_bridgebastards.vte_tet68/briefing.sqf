waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission", "Your mission objective is to get into the other side of the <marker name='bridge'>bridge</marker>."]];
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission", "Your mission objective is to get into the other side of the <marker name='bridge'>bridge</marker>."]];
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
