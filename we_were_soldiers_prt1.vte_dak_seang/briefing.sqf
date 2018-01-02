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
				"land as lz <marker name='1'>alpha 1</marker>  and attack <marker name='2'>the village</marker>  then make your way to <marker name='3'> Alpha2 </marker> RV from  <marker name='3'>Alpha 2</marker> move to <marker name='4'>LZ Bravo 1</marker> and <marker name='5'>assault the two village</marker>  then move to <marker name='6'>RV Bravo 2 </marker> from <marker name='6'>RV Bravo2</marker> Move to<marker name='7'> LZ Charile 1</marker> and patrol the area back to <marker name='8'>RTB Base</marker>"
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
				"Synopsis:<br/><br/>The 1st Cavalry Division shipped out of Ft. Benning, GA and closed into its Base Camp at An Khe in the Central Highlands of South Vietnam in late September 1965.<br/><br/>A Vietnamese military maxim states:<br/><br/>He who controls the Central Highlands controls South Vietnam<br/><br/>In late October '65, a large North Vietnamese force attacked the Plei Me Special Forces Camp. Troops of the 1st Brigade were sent into the battle. After the enemy was repulsed, the 3rd Brigade replaced the 1st Brigade in early November. After three days of patrolling without any contact, Hal Moore's 1st Battalion, 7th Cavalry was ordered to air assault into the Ia Drang Valley on Nov 14. his mission:<br/><br/>Find and kill the enemy<br/><br/>At 10:48 AM, Moore was the first man out of the lead chopper to hit the landing zone, firing his M16 rifle. Little did Moore and his men suspect that FATE had sent them into the first major battle of the Vietnam War between the American Army and the People's Army of Vietnam - Regulars - and into history."
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
