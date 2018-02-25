/*
	briefing

*/

player createDiaryRecord
[
	"Diary",
	[
		"Support",
		"Available Air Support: Two teams are on standby at Plei Me. Call in these teams on your AN/PRC Radio if you get in trouble, especially when you ambush the marching infantry. If things go wrong, call in a team to help you get the job done, or cover your extraction.<br/><br/>1) Pink Team:<br/>An OH-6A and AH1J will patrol your AO, looking for enemy. They will operate independant of your unit, but will stay near your general postion. If the ambush goes wrong, and the NVA troops flee or get away, call in this team to help clean up the scattered enemy.<br/><br/>2) Red Team:<br/>Two AH1 Cobras will provide CAS. Call in the red team if you want your squad to direct the CAS. They will join you. The Cobras will take a few minutes to arrive."
	]
];

player createDiaryRecord
[
	"Diary",
	[
		"Mission",
		"With an air assault due at X-ray in a few hours, we would prefer that these reinforcements do not reach their destination.<br/><br/>Stay close to the river, and avoid the <marker = 'camp'>NVA camp</marker> at all costs.<br/><br/>A few AirCav patrols are in the AO north of the river, looking for VC bunkers. You may hear them if they engage, but will be too far to help them, or for them to help you."
	]
];


player createDiaryRecord
[
	"Diary",
	[
		"Credits",
		"Misson Made by Nagual 2002"
	]
];


player createDiaryRecord
[
	"Diary",
	[
		"Plan",
		"Your SEAL team will be infiltrating NVA territory today. Your target is an NVA convoy of infantry, moving from the <marker = 'jung'>jungles</marker> to this <marker = 'camp'>NVA camp</marker>.<br/><br/>A UH-1H crashed along the river during the night, with claymore cargo. As the cargo was ditched before the crash, there may be enough claymores around to set a deadly trap for the convoy.<br/><br/>Get to the site and set up an ambush, intercept the infantry column and prevent them from passing you. There is not much time."
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
		"Find some <marker = 'r0'>sampans</marker>. NVA are patrolling the river.",
		"Find Sampans",
		"textmarker"
	],
	[
		player
	],
	1,
	2,
	true
] call BIS_fnc_taskCreate;

[
	player,
	[
		"t2"
	],
	[
		"Locate the <marker = 'r1'>crashed UH-1H</marker>. Claymore crates should be in the area.",
		"Locate Crashed Huey",
		"textmarker"
	],
	[
		player
	],
	1,
	2,
	true
] call BIS_fnc_taskCreate;

[
	player,
	[
		"t3"
	],
	[
		"<marker = 'r2'>Ambush</marker> the NVA infantry convoy. Use claymores and suprise, try to cut their numbers by at least half.",
		"Ambush NVA inf convoy",
		"textmarker"
	],
	[
		player
	],
	1,
	2,
	true
] call BIS_fnc_taskCreate;

[
	player,
	[
		"t4"
	],
	[
		"Use the sampans to get to this <marker = 'r3'>LZ</marker>. Call in extraction with your units AN/PCR 25 radio. A UH1 will extract your team from there.",
		"Extract",
		"textmarker"
	],
	[
		player
	],
	1,
	2,
	true
] call BIS_fnc_taskCreate;
