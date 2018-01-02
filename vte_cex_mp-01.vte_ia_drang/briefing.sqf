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
				"US <marker name='start'>start</marker> in base, NVA/VC attacks the base."
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
				"Out there somewhere is several NVA platoons with bad intentions."
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
