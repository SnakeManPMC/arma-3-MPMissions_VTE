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
  				"Vietnam: The Experience"
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
				"US start at <marker name='start'>USMC base</marker> and in <marker name='aircavhq'>AirCav HQ</marker>. You have support vehicles in USMC base, AirCav HQ and in <marker name='fsb'>FSB</marker>. US forces are to clear <marker name='target1'>ruins</marker>, <marker name='target2'>Singha</marker>, <marker name='target3'>city 1</marker>, <marker name='target4'>Kangfang</marker>, <marker name='target5'>Tinman</marker>, <marker name='target6'>Mahky</marker>, <marker name='target7'>POW Camp</marker>, <marker name='target8'>Lay</marker> and <marker name='target9'>Kaung</marker> objectives. US final objective is to find and kill the NVA colonel in the region."
			]
		];

// 3
		player createDiaryRecord
		[
			"Diary",
			[
				"TACTICAL",
				"n/a"
			]
		];

// 2
		player createDiaryRecord
		[
			"Diary",
			[
				"INTEL",
				"n/a."
			]
		];

// 1
		player createDiaryRecord
		[
			"Diary",
			[
				"GEN SITREP",
				"n/a"
			]
		];

/*
		pmc_briefing_text = format["Reach %1 KIA's", PMC_VictoryCondition];
		PMC_objective1 = player createSimpleTask [ pmc_briefing_text ];
		PMC_objective1 setSimpleTaskDescription [ pmc_briefing_text, pmc_briefing_text, pmc_briefing_text ];
		player setCurrentTask PMC_objective1;
*/
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
