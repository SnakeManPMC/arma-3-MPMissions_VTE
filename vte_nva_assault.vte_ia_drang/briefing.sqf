waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
// 5
		player createDiaryRecord
		[
			"Diary",
			[
				"Diary",
				"VC and NVA inbound. great... just great. Now where is my COLT?"
			]
		];

// 4
		player createDiaryRecord
		[
			"Diary",
			[
				"ORDERS",
				"Alpha team (SEAL Team) <marker name='start'>start</marker> from US base, your orders are to hold the base at all costs against the combined VC and  NVA <marker name='target1'>assault</marker> coming from south west jungle. Do not let any of them into the base perimeter as they can really wreck havoc. You have flares and airstrikes available by using a radio. Good luck all of you."
			]
		];

// 3
		player createDiaryRecord
		[
			"Diary",
			[
				"TACTICAL",
				"You got serious problem here, major NVA attack on its way and only your team to defend. Ok use ammo wisely, the army guys left one mortar for you to use and there is one medic at the medical center for you to use if any of you get wounded. Make sure you do good CAS calls as you dont want to get any friendly casualties. Good luck, you're going to need it."
			]
		];

// 2
		player createDiaryRecord
		[
			"Diary",
			[
				"INTEL",
				"We have lot of enemy infantry movement in the W, SW and S area of the SF Base. We believe  this to be major assault as we have lost contact to two of our recon teams in the jungle."
			]
		];

// 1
		player createDiaryRecord
		[
			"Diary",
			[
				"GEN SITREP",
				"The NVA has been preparing for serious move agains US forces in this region, seems like we are in the eve of the attack now. We must hold the ground until more friendly troops can be deployed."
			]
		];

		PMC_objective1 = player createSimpleTask ["Defend Plei Me SF base"];
		PMC_objective1 setSimpleTaskDescription ["Alpha team (SEAL Team) <marker name='start'>start</marker> from base, defend it at all costs against VC and NVA combined <marker name='target1'>assault</marker> from south west.<br/><br/>Goodspeed.","Defend Plei Me SF base","Defend Plei Me SF base"];
		//PMC_objective1 setSimpleTaskDestination (getMarkerPos "start");
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
