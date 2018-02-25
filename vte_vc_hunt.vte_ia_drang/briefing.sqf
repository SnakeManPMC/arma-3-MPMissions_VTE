/*
	briefing

*/

player createDiaryRecord
[
	"Diary",
	[
		"Notes",
		"freaking vc!"
	]
];

player createDiaryRecord
[
	"Diary",
	[
		"Quick",
		"Alpha team <marker = 'start'>start</marker> from base, board a helo and stop VC <marker = 'attack1'>offensive</marker> coming from south west."
	]
];

player createDiaryRecord
[
	"Diary",
	[
		"Tactical",
		"Watch out the VC, watch out for ground fire and try to find the individual soldiers before the get too close."
	]
];

player createDiaryRecord
[
	"Diary",
	[
		"Orders",
		"Board a helicopter of your choosing in the <marker = 'start'>airbase</marker> and stop the VC <marker = 'attack1'>attack</marker> coming from somewhere in the jungle. Alpha black pilots can drop smoke by radio (0-0-1). OH-1 Bronco airstrikes are available from radio call also. NAVY SEALs are defending the base in the ground along with US Marines. Do not let the Marines <marker = 'defend1'>base</marker> to take too many casualties. Good luck."
	]
];

player createDiaryRecord
[
	"Diary",
	[
		"Intel",
		"Several VietCong squads have been spotted travelling towards our base from West, South-West."
	]
];

player createDiaryRecord
[
	"Diary",
	[
		"GEN SITREP",
		"We have gotten heavy VC and NVA attacks in this sector on the last few days, today it seems to be the SF firebase next on the list."
	]
];

/*
	tasks

*/

[
	player,
	[
		"t1"
	],
	[
		"Stop VC Attack",
		"Stop VC Attack",
		"textmarker"
	],
	[
		player
	],
	1,
	2,
	true
] call BIS_fnc_taskCreate;
