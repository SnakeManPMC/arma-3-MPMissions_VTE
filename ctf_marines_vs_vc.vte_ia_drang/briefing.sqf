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
				"Welcome to Vietnam CTF<br/>VC and Marine base are here:<br/><br/><marker name='Respawn_West'>Marine Base</marker><br/><marker name='Respawn_east'>VC Base</marker><br/><br/>The flags are here:<br/><br/><marker name='FlagW'>Marine Flag</marker><br/><marker name='FlagE'>VC Flag</marker><br/><br/>Beware of the VC and Marine safezones!!<br/><br/><marker name='SafeW'>Marine safezone</marker><br/><marker name='SafeE'>VietCong safezone</marker><br/><br/>Good luck!"
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
				"Welcome to Vietnam CTF<br/>VC and Marine base are here:<br/><br/><marker name='Respawn_West'>Marine Base</marker><br/><marker name='Respawn_east'>VC Base</marker><br/><br/>The flags are here:<br/><br/><marker name='FlagW'>Marine Flag</marker><br/><marker name='FlagE'>VC Flag</marker><br/><br/>Beware of the VC and Marine safezones!!<br/><br/><marker name='SafeW'>Marine safezone</marker><br/><marker name='SafeE'>VietCong safezone</marker><br/><br/>Good luck!"
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

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
