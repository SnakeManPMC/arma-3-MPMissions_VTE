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
  				"Helicopter Assets Respawn Delay is 120 Seconds if destroyed And 3 minutes if abandoned.<br/><br/>APC Assets Respawn Delay is 120 Seconds if destroyed And 10 minutes if abandoned.<br/><br/>Fixed Wing Assets Respawn Delay is 120 Seconds if destroyed And 3 minutes if abandoned.<br/><br/>All Ground Vehicles,Transport and Scout Helicopters Have Ammo On Board For Resupply Purposes.<br/><br/><br/><br/>Team Leader Group Respawn script (1.0) by Mongoose_84"
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
				"WE HAVE 6 OBJECTIVE AREAS TO CLEAR. WE WILL DO THEM ONE AT A TIME TOGETHER. <br/><br/>FALL OUT!!!.<br/><br/>Group Leaders Can Recruit AI For Their Squads.<br/><br/>Group Leaders Use Group Respawn Untill There Are No Members Left And  You Will Respawn At The Base.<br/><br/>Mission By ANZAC SAS Boys.<br/><br/>Airstrikes Are Not Permitted Within 1000m Of Ground Forces(Unless Requested By Ground Forces With Their Positions Marked)."
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
