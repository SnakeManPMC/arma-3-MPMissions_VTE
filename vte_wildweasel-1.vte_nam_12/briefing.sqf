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
				""
			]
		];
// 4
		player createDiaryRecord
		[
			"Diary",
			[
				"ORDERS",
				"US <marker name='start'>start</marker> in airbase, use the aircrafts to search and destroy the SA-2 sites.<br/><br/>
SAM <marker name='target1'>site 1</marker><br/><br/>
SAM <marker name='target2'>site 2</marker><br/><br/>
SAM <marker name='target3'>site 3</marker><br/><br/>
SAM <marker name='target4'>site 4</marker>
"
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
/*
<p><a name = "OBJ_1'></marker>Destroy SAM site 1
<p><a name = "OBJ_2'></marker>Destroy SAM site 2
<p><a name = "OBJ_3'></marker>Destroy SAM site 3
<p><a name = "OBJ_4'></marker>Destroy SAM site 4
*/
