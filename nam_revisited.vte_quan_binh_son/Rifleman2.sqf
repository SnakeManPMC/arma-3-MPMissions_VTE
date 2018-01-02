
private ["_ainum","_ap","_i","_grp","_count","_dude"];
playSound "click2";


_grp = group player;
_count = (count units _grp);
_ainum = 0;
_ap = player;
_i = 0;
while {_i < _count} do 
{
	_ap = (units _grp select _i);
	if (not (isPlayer _ap)) then 
	{
		_ainum = _ainum +1;
	};
	_i = _i + 1;
};

if (player != (leader group player)) exitwith {hint "You must be an Officer to recruit"};



if (_ainum >= 19) exitwith {hint "You have reached Maximum Squad Size ";};

	
_dude = group player createUnit ["US_soldier_WDL_MED", getPosASL player, [], 0, "FORM"];

_dude setskill 1;
_dude addMagazine "SmokeShell";
_dude addMagazine "Handgrenade";

_dude addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];



	




