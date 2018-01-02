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
				"we need to Land at <marker name='1'>LZ Alpha</marker>  and <marker name='2'>distroy the bridge</marker> when the convoy goes over it return to <marker name='1'>LZ Alpha</marker> and fly to<marker name='3'> LZ Bravo</marker>  to attack the <marker name='4'>VC Base</marker>. SIDE MISSIONS TAKE OUT THE ANTI AIR IN THESE AREA. Anti Air <marker name='T'>Site 1</marker>, Anti Air <marker name='g'>Site 2</marker> and Anti Air <marker name='k'>Site 3</marker>"
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
				"WE WERE SOLDIERS PRT2<br/><br/>The Battle of Dak Too was a series of major engagements of the Vietnam War that took place between 3 November and 22 November 1967, in Kontum Province, in the Central Highlands of the Republic of Vietnam (South Vietnam). The action at Dak Too was one of a series of People's Army of Vietnam (PAVN) offensive initiatives that began during the second half of the year. North Vietnamese attacks at Loc Ninh (in Binh Long Province) and Song Be (in Phuoc Long Province) and at Con Thien and Khe Sanh, (in Quang Tri Province), were other actions which, combined with Dak To, became known as ""the border battles.""<br/><br/>During the summer of 1967, heavy contact with PAVN forces in the area prompted the launching of Operation Greeley, a combined search and destroy effort by elements of the 1st/7th Cavalry , the U.S. 175th Fighter Squadon, and Army of the Republic of Vietnam (ARVN) 42nd Infantry Regiment and Airborne units. The fighting was intense and lasted into the fall, when the North Vietnamese seemingly withdrew."
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
