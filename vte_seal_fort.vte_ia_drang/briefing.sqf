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
  				"Okay guys, this is it. Intel says bunch of VC is charging this way."
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
				"SEAL teams <marker name='start'>US start</marker> from Plei Me. Each team can click once to select the squad and then shift-click map position to order the squad to move there.<br/><br/>Each teams sees only their own markers, enemy markers are hidden. No reporting from the squadsare implemented in this version. You cant really tell if they have died on the field.<br/><br/>SEALs objective is to defend <marker name='start'>Plei Me</marker> SF base, VC objective is tocapture it by killing all the SEALs in the base. SEALs can call in M252 Mortars, grab radiofrom the table and use it."
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
  				"We must kill the evil seals in the bastard base."
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
				"NVA squad <marker name='nvastart'>start</marker> from west of Plei Me. Each team can click once to select the squad and then shift-click map position to order the squad to move there.<br/><br/>Each teams sees only their own markers, enemy markers are hidden. No reporting from the squadsare implemented in this version. You cant really tell if they have died on the field.<br/><br/>SEALs objective is to defend <marker name='start'>Plei Me</marker> SF base, VC/NVA objective is to capture it by killing all the SEALs in the base."
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
