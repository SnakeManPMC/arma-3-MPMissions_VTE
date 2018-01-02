
private
[
	"_flyHeight",
	"_helo",
	"_posit",
	"_startposit",
	"_tmp"
];

_helo = _this select 0;
_tmp = _this select 1;
_posit = getPosASL _tmp;
_flyHeight = _this select 2;

_helo setBehaviour "AWARE";
_helo setCombatMode "YELLOW";
_helo setSpeedMode "FULL";
_startposit = getPosASL _helo;
_helo flyInHeight _flyHeight;
_helo move _posit;

waitUntil
{
	sleep 1;
	( (_helo distance _posit < 300) || !(canMove _helo) );
};

if (!alive _helo) exitWith{};

_helo sideChat "We have arrived to the LZ, men get ready!";

_helo setSpeedMode "LIMITED";

_helo land "land";

waitUntil
{
	sleep 1;
	((getPosASL _helo select 2) < 2 || !(canMove _helo));
};

if (!alive _helo) exitWith{};

_helo sideChat "EVERYONE OUT!";

{
	_x action ["eject",_helo];
} forEach crew _helo;

hint format["helo: %1, startposit: %2",_helo,_startposit];
_helo setBehaviour "COMBAT";
_helo setCombatMode "RED";
_helo setSpeedMode "FULL";
_helo move _startposit;
