
private _StartLocation = _this select 0;

private _dis = sqrt(((abs((_StartLocation select 0) - (getmarkerpos "blick" select 0)))^2)+((abs((_StartLocation select 1) - (getmarkerpos "blick" select 1)))^2));
if (_dis > 12800) exitWith
{
	["Again"] execVM "SpawnWPara.sqf";
};

TitleText ["","Plain"];
[Player,_StartLocation,130,true,"Parachute over selected Area!",getmarkerpos "blick"] exec "Fallschirm.sqf";
//;forceMap false
