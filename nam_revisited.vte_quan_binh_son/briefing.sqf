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
				""
			]
		];
// 4
		player createDiaryRecord
		[
			"Diary",
			[
				"ORDERS",
				"Nam ReVisted<br/>As the tittle says its back to Nam with modernday weapons.<br/>The mission is to get to a downed chopper and its crew in the north west of the island before the enemy do. <br/>They are being hunted by two groups of enemy forces one from the north east and another from the south west both are supported by heavy armor.<br/>In between us at our base and the downed chopper stand two enemy camps and numerous Anti Air Craft defences.<br/>The two camps form part of your mission objectives and have to be destroyed.As to the AA emplacements it will probably be easier to destroy them so remove the nuisance that they are.<br/>When you have cleared the camps and found the chopper you must setup the three perimiter places around the crew.The markers will change color and a message will advise you when done.<br/>If the enemy get to the crew before you do then the marker will turn Red and a message will inform you that you lose and the game will end .<br/>The game uses group respawn and recruitable troops so remember to take troops with you,<br/>The troops are recruited from the recruiting soldier near the flag and the flag allow you to Reset the view distance and terrain detail at any time,<br/>Please Enjoy the game <br/>RedRum<br/><br/>Clear the two enemy camps.<br/><br/>Setup the Thre perimiters around the downed chopper."
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
