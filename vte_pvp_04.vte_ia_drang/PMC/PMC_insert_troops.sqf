
private
[
	"_helo",
	"_team"
];

_helo = _this select 0;
_team = _this select 1;

_helo land "land";

waitUntil
{
	sleep 1;
	((getPosASL _helo select 2) < 2 || !(canMove _helo));
};

if (!alive _helo) exitWith{};

_helo sideChat "EVERYONE OUT!";

{
	unassignVehicle _x;
	_x action ["eject", _helo];
} forEach units _team;
