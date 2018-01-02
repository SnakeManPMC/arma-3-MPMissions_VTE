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
				"Lot of KIA's huh, cool..."
			]
		];

// 5
		player createDiaryRecord
		[
			"Diary",
			[
				"SUPPORT",
				"You have 81mm mortars located in Plei Me SF base, use Radio (0-0-1) to call them up.<br/><br/>M101 artillery is on airbase, use Radio (0-0-2) to call them up. <br/><br/>Airsupport is also available on radio (0-0-3).<br/><br/>Usage: use radio, then map click."
			]
		];
// 4
		player createDiaryRecord
		[
			"Diary",
			[
				"ORDERS",
				"You need to capture LZ Columbus, LZ X-Ray, LZ Albany and Hilltop 460, then reinforcements can land on these locations.<br/><br/>Try to gain control of the area, neutralize all NVA/VC presence."
			]
		];

// 3
		player createDiaryRecord
		[
			"Diary",
			[
				"TACTICAL",
				"Reinforcements are sent to the mainland from the airbase close by using helicopters.<br/><br/>Use your support assets to your advantage."
			]
		];

// 2
		player createDiaryRecord
		[
			"Diary",
			[
				"INTEL",
				"NVA doesn't seem to have any armor in the area or heavy machine gun emplacements. But, they are often wrong..."
			]
		];

// 1
		player createDiaryRecord
		[
			"Diary",
			[
				"GEN SITREP",
				"Army units are manning Plei Me SF base, NVA/VC forces are operating in the area.<br/><br/>Mission ends when specificed number of KIA's have reached (all sides).<br/><br/>Mission date: Nov 3rd, time: up to squad leader.<br/><br/>Sunrise 0530hrs, sunset 1830hrs."
			]
		];

		pmc_briefing_text = format["Reach %1 KIA's", PMC_VictoryCondition];
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
