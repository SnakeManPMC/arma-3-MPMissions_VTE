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
  				"by Sgt.Spoetnik For VTE."
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
				"----""Operation helping hands.""----<br/><br/>----We need to clear out the villes and bases on the map to help the villagers get there lifes back and support the south vietnamese army taking back there country from communist Forces. When you die, you respawn back at base. All choppers also respawn back at base when destroyed. The hole Island is under VC and NVA control so it will be a long fight to clear it,Good luck.----<br/><br/>----intel: lots off infantry an static AA guns, Some armor and light vehicles, there are lots off targets,villes,hidden bases,supply lines and patrols,port,airfield, The South vietnamese army is already deploying troops in the field but need our support to gain victory.----<br/><br/>Clear the Island off VC and NVA."
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
