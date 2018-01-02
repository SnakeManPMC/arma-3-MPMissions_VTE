/*

	Parachute script for SF guys

*/
private
[
	"_chute1",
	"_chute2",
	"_pos1",
	"_team",
	"_xpos",
	"_ypos",
	"_zpos"
];

_team = _this select 0;
_pos1 = _this select 1;

_xpos = _pos1 select 1;
_ypos = _pos1 select 2;
_zpos = (_pos1 select 3) + 500;

if (leader _team distance usa > 250) exitWith
{
	leader _team sideChat "Sorry sir, we are too far from the airbase. Over.";
};

_chute1 = "ParachuteWest" createVehicle [_xpos, _ypos, _zpos];
units _team select 0 moveIndriver _chute1;

_chute2 = "ParachuteWest" createVehicle [_xpos + 50, _ypos, _zpos];
units _team select 1 moveInDriver _chute2;

leader _team sideChat "Reporting chute open and deploying. Over.";
