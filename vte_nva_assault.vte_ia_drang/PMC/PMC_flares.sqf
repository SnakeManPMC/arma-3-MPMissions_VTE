
private
[
	"_PMC_flares"
];

// list of flares available
_PMC_flares =
[
	"VTE_F_40mm_Green",
	"VTE_F_40mm_Red",
	"VTE_F_40mm_White",
	"VTE_F_40mm_Yellow"
];

while {true} do
{

	flare1 = (_PMC_flares select floor random (count _PMC_flares)) createVehicle [(getPosASL usa select 0)-100+random 200, (getPosASL usa select 1)-100+random 200, (getPosASL usa select 2)+225];

	sleep 13 + random 10;
};
