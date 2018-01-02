waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord
		[
			"Diary",
			[
				"Mission", "Patrol the Ia Drang area and engage all enemies you encounter. Good luck."
			]
		];

		player createDiaryRecord
		[
			"Diary",
			[
				"Tactics", "You have variety of aircrafts and helicopters available in <marker name='airport'>airport</marker> and some helos in Ple Me SF base.<br/><br/>If you get overrun in <marker name='usa'>Plei Me SF base</marker>, your respawn location will automatically shift to airport.<br/><br/>Ammo boxes are located in Plei Me SF base."
			]
		];
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
