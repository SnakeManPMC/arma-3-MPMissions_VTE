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
				"VC At The Door<br/>A little mission set in the new terrain of Parrots Beak VTE.<br/>This Is a AI Commanded mission to Hold the Base from Attack by VC troops.<br/>As usual the commanders are invincible and so are the medics.<br/>Because of the enemy numbers involved you also have Fixed MG support soldiers.<br/>The ending comes when you defeat the enemy attacking the base .<br/>BUT if they manage to enter the capture point near the Main area then you will lose.<br/>This mission uses selective respawn so you can select a spawnpoint after being killed.<br/>Please enjoy the mission .<br/>RedRum"
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
				"Defend The Base Against Attack"
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
