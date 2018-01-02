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
				"n/a"
			]
		];
// 4
		player createDiaryRecord
		[
			"Diary",
			[
				"ORDERS",
				"PRIMARY OBJ: Seek and destroy the enemy ammo supplies at the <marker name='ied1'>VC Camp</marker>.<br/>SECONDARY OBJ: Search for intel about the location of the enemy air base.<br/>PRIMARY OBJ: Destroy the enemy <marker name='com1'>air-field</marker> assets and communitation equipment.<br/>PRIMARY OBJ: Disable the enemy air defence units along the river bank.  CODNAME: <marker name='aaaa'>4REDCIRCLES</marker><br/>PRIMARY OBJ: Recover the US flag at <marker name='emb'>Leghorn</marker> then return it to <marker name='HQ'>HQ </marker>.<br/>SECONDARY OBJ: Search the base for intel about the location of a nearby enemy camp."
			]
		];

// 3
		player createDiaryRecord
		[
			"Diary",
			[
				"TACTICAL",
				"Friendly air and water units respawn. - BLUFOR <marker name='Respawn_WEST'>RESPAWN</marker> and AMMO available at the HQ."
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
				"Our base at <marker name='emb'>Leghorn</marker> come under heavy aerial bombardment at 2000 hours last night.  We are to move in and clean up the situation.</marker>"
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
