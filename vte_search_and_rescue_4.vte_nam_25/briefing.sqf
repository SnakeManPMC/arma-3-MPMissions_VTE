waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord
		[
			"Diary",
			[
				"Intel",
				"Enemy has several SA-2 Surface To Air Missile sites and ZU-23 anti air gun sites. These are marked to the map by red circles (larger ones are SA2's)."
			]
		];

		player createDiaryRecord
		[
			"Diary",
			[
				"Mission",
				"Downed pilot is held captive (POW) by the enemy, bring him back home. Secondary objective is to destroy as many of these enemy SA-2 and Anti Air sites as possible. You should and frankly need, to destroy some of these sites to clear a path for rescue helicopters to fly our downed pilot out of the POW camp."
			]
		];

		PMC_objective1 = player createSimpleTask
		[
			"Bring POW back home"
		];
		PMC_objective1 setSimpleTaskDescription
		[
			"Rescue force starts at <marker name='start'>US Airbase</marker>, assault the <marker name='pow'>POW camp</marker>, rescue downed pilot help captive by the NVA and bring him home.",
			"Bring POW back home",
			"Bring POW back home"
		];

		PMC_objective1 setSimpleTaskDestination (getMarkerPos "pow");
		player setCurrentTask PMC_objective1;
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
