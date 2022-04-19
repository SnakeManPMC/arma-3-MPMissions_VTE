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
				"Search and Destroy the enemy ammo shipment.  CODENAME: <marker name='ied1'>CO TOO</marker><br/>Destroy the propaganda broadcasting station. CODNAME: <marker name='com1'>NAM QUI</marker><br/>Disable the enemy air defense units.  CODNAME: <marker name='aaaa'>NAPALM</marker></marker><br/>Re-capture our base at <marker name='e_base'>Tri Ton</marker>.<br/>Assasinate the <marker name='officer'>enemy officer</marker> (YELLOW MARKER: Patrol route).<br/>Recover the US flag from the <marker name='emb'>US Base</marker> at Tri Ton and return it to <marker name='HQ'>HQ</marker>.<br/>Recover the US flag from the <marker name='emb2'>US Base</marker> at An Binh and return it to <marker name='HQ'>HQ</marker>."
			]
		];

// 3
		player createDiaryRecord
		[
			"Diary",
			[
				"TACTICAL",
				"Friendly air units respawn. Land assets DO NOT respawn. - BLUFOR <marker name='Respawn_WEST'>Respawn</marker> and ammo available at the air field."
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
				"We lost contact with our base at <marker name='e_base'>Tri Ton.</marker> Our nearest units are the Aussie SAS troops, who just finished their patrol mission near <marker name='land'>here.</marker> The rest of are reinforcments will be inserted via air from <marker name='Respawn_WEST'>the air field</marker>."
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
