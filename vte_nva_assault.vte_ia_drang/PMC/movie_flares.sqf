
while {true} do
{
	flare1 = "VTE_F_40mm_White" createVehicleLocal [(getPosASL usa select 0)-100+random 200, (getPosASL usa select 1)-100+random 200, (getPosASL usa select 2)+225];
	sleep 1 + random .5;
	flare1 = "VTE_F_40mm_White" createVehicleLocal [(getPosASL usa select 0)-100+random 200, (getPosASL usa select 1)-100+random 200, (getPosASL usa select 2)+225];
	sleep 1 + random .5;
	flare1 = "VTE_F_40mm_White" createVehicleLocal [(getPosASL usa select 0)-100+random 200, (getPosASL usa select 1)-100+random 200, (getPosASL usa select 2)+225];
	sleep 1 + random .5;
	flare1 = "VTE_F_40mm_White" createVehicleLocal [(getPosASL usa select 0)-100+random 200, (getPosASL usa select 1)-100+random 200, (getPosASL usa select 2)+225];

	sleep 10 + random 2;
};
