private ["_flareType","_ranPos"];

_flareType = 
[
	"F_40mm_Yellow",
	"F_40mm_Red",
	"F_40mm_Yellow",
	"F_40mm_White",
	"F_40mm_Yellow",
	"F_40mm_Red",
	"G_40mm_HE",
	"F_40mm_Yellow",
	"F_40mm_White",
	"G_40mm_HE"
];

while {(gameRun)} do
{
	_ranPos = 
	[
		((getPosASL hecklerLogic select 0) - ((random 150)-(random 150))),
		((getPosASL hecklerLogic select 1) - ((random 150)-(random 150))),
		(265 - ((random 50)-(random 50)))
	];

	(_flareType select (abs(round(0+((random 9)-(random 9)))))) createVehicle _ranPos;

sleep (30 - ((random 11)-(random 11)));
};