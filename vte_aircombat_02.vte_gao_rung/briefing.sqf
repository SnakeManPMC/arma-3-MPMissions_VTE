waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Skirmish mission in 51km terrain. You are located in <marker name='usa'>combat zone</marker> and there is going to be imminent <marker name='arrow_1'>contact</marker> with NVA."]];
		"nva" setMarkerTypeLocal "empty";
		"arrow" setMarkerTypeLocal "empty";
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Skirmish mission in 51km terrain. You are located in <marker name='nva'>combat zone</marker> and there is going to be imminent <marker name='arrow'>contact</marker> with US forces."]];
		"usa" setMarkerTypeLocal "empty";
		"arrow_1" setMarkerTypeLocal "empty";
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
