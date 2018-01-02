waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
// 6
		player createDiaryRecord
		[
			"Diary",
			[
  				"DIARY",
  				""
			]
		];

// 5
		player createDiaryRecord
		[
			"Diary",
			[
				"SUPPORT",
				""
			]
		];
// 4
		player createDiaryRecord
		[
			"Diary",
			[
				"ORDERS",
				"Clear the island <br/>This is a new mission in vienam to destroy the enemy radio .and clear the enemy from this island<br/>Your base camp is a short march through the valley to the well defended enemy encampment in thick  jungle near the beach<br/>The village has many troops gaurding it and the radio tower.When you get there you must find the ammo crates near the radio shack and take from it the satchell charges and place one or two on or close to the ammo crate<br/>After setting the charges you must get clear and detonate it.If you have been successful then a message will tell you and then you can push on to the next village.<br/>You will need to clear all enemy from the island for the game to end.<br/>You will respawn at your camp when killed and it is here where you will find the ammo needed for the job  .Good luck and as allways enjoy the game <br/>RedRum"
			]
		];

// 3
		player createDiaryRecord
		[
			"Diary",
			[
				"TACTICAL",
				""
			]
		];

// 2
		player createDiaryRecord
		[
			"Diary",
			[
				"INTEL",
				""
			]
		];

// 1
		player createDiaryRecord
		[
			"Diary",
			[
				"GEN SITREP",
				""
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
