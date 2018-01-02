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
				"Map and scripting by Celery<br/>spinalfailure@hotmail.com<br/><br/>MCY 2nd Platoon<br/>www.mcys.de<br/><br/>Sudenpennut Veteran Scouts<br/>sudarit.tk<br/><br/>Reworked for VTE by Vigilante<br/>www.vigilante-systems.webs.com<br/><br/>VTE<br/>https://www.vtemod.com/<br/><br/>"
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
				"Celery proudly presents:<br/>DM Ranch!<br/><br/>Respawning is (almost) instant! If you blink, you'll miss it!<br/>The guy with most frags when time is up wins!<br/>You are fenced into the <marker name='Respawn_West'>killing arena</marker> like cattle. There is no escape!<br/><br/>Keep on firing until you hit someone, and repeat."
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
