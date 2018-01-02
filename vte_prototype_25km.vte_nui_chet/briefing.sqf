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
				"You <marker name='start'>start</marker> in the airbase, browse around the terrain and get a feel to it. REMEMBER THAT THIS IS A PROTOTYPE, NOT ALPHA, NOT BETA, NOT NOTHING, A MERE PROTOTYPE OF THINGS TO COME!<br/>
<marker name='target1'>Objective 1</marker><br/>
<marker name='target2'>Objective 2</marker><br/>
<marker name='target3'>Objective 3</marker><br/>
<marker name='target4'>Objective 4</marker><br/>
<marker name='target5'>Objective 5</marker><br/>
<marker name='target6'>Objective 6</marker><br/>
<marker name='target7'>Objective 7</marker><br/>
<marker name='target8'>Objective 8</marker><br/>
<marker name='target9'>Objective 9</marker><br/>
<marker name='target10'>Objective 10</marker>
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
<p><a name = "OBJ_1'></marker>Clear the objective 1
<p><a name = "OBJ_2'></marker>Clear the objective 2
<p><a name = "OBJ_3'></marker>Clear the objective 3
<p><a name = "OBJ_4'></marker>Clear the objective 4
<p><a name = "OBJ_5'></marker>Clear the objective 5
<p><a name = "OBJ_6'></marker>Clear the objective 6
<p><a name = "OBJ_7'></marker>Clear the objective 7
<p><a name = "OBJ_8'></marker>Clear the objective 8
<p><a name = "OBJ_9'></marker>Clear the objective 9
<p><a name = "OBJ_10'></marker>Clear the objective 10
*/
