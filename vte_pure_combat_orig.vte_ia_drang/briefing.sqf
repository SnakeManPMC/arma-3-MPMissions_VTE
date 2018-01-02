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
				"1000 KIA's huh, cool..."
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
				"Army units are defending the SF base, NVA/VC forces are assaulting.<br/><br/>Mission ends when 1000 KIA's have reached (all sides).<br/><br/>Reinforcements are sent to the mainland from the airbase close by using helicopters.<br/><br/>You can capture the 5 target locations, then reinforcements can land on these locations. You lose their control if you left then unoccupied."
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

		pmc_briefing_text = "Reach 1000 KIA's";
		PMC_objective10 = player createSimpleTask [ pmc_briefing_text ];
		PMC_objective10 setSimpleTaskDescription [ pmc_briefing_text, pmc_briefing_text, pmc_briefing_text ];
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
