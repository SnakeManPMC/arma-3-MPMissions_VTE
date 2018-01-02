
private
[
	"_p",
	"_pos"
];

while {true} do
{
	_p = getPos flare;
	_pos = [_p select 0, _p select 1, 200];
	_Flare = "VTE_F_40mm_White" createVehicle _pos;
	_Flare setVelocity [ 0, 0, -10 ];
	sleep 5;

	_p = getPos flare2;
	_pos = [_p select 0, _p select 1, 200];
	_Flare = "VTE_F_40mm_White" createVehicle _pos;
	_Flare setVelocity [ 0, 0, -10 ];
	sleep 5;

	_p = getPos flare3;
	_pos = [_p select 0, _p select 1, 200];
	_Flare = "VTE_F_40mm_White" createVehicle _pos;
	_Flare setVelocity [ 0, 0, -10 ];
	sleep 5;

	_p = getPos flare4;
	_pos = [_p select 0, _p select 1, 200];
	_Flare = "VTE_F_40mm_White" createVehicle _pos;
	_Flare setVelocity [ 0, 0, -10 ];
	sleep 5;

	_p = getPos flarered;
	_pos = [_p select 0, _p select 1, 200];
	_Flare = "VTE_F_40mm_Red" createVehicle _pos;
	_Flare setVelocity [ 0, 0, -10 ];
	sleep 5;
};
