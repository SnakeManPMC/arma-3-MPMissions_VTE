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

	
"VTE_Armymedic" createUnit [getPos player,group player];

this setskill 1;

this addMagazine "vte_grenadered";

this addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];



	




