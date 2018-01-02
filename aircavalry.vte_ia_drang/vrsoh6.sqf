// *****************************************************
//** Operation Flashpoint Script File
//*****************************************************

//BEGIN vrs_AI.sqf
//Original script by KaRRiLLioN modified by norrin for AI units 4th Feb 2007
//IMPORTANT: ADD A GAMELOGIC NAMED Server
//to the mission to prevent multispawn

private ["_vcl","_respawndelay","_vclemptydelay","_dir","_pos","_type","_run","_wait","_delay"];

if (!local Server) exitWith {};

_vcl = _this;
_vclemptydelay = 180;
_respawndelay = 120;
_dir = Getdir _vcl;
_pos = getPosASL _vcl;
_type = typeOf _vcl;
// to fix error undefined variable in expression
_wait = Time + _vclemptydelay;

_run = TRUE;
sleep 5;

for [{}, {_run}, {_run}] do
{
	while {_vcl distance _pos < 5 && canMove _vcl} do
	{
		sleep 1;
	};
	while {canMove _vcl && count crew _vcl > 0 && ({damage _x}forEach crew _vcl)!= 1} do
	{
		_wait = Time + _vclemptydelay;
		sleep 1;
	};
	while {canMove _vcl && count crew _vcl < 1 && Time < _wait} do
	{
		sleep 1;
	};
	while {canMove _vcl && {damage _x} forEach crew _vcl >= 1 && Time < _wait} do
	{
		sleep 1;
	};
	_delay = Time + _respawndelay;
	while {!canMove _vcl && Time < _delay} do
	{
		sleep 1;
	};
	if (count crew _vcl < 1) then
	{
		deleteVehicle _vcl;
		_vcl = _type createVehicle _pos;
		_vcl setdir _dir;
		sleep 1;
		_vcl setvelocity [0,0,0];
		_vcl setpos _pos;
		sleep 1;
		_vcl setvelocity [0,0,0];
		sleep 2;
	};
	if ({damage _x} forEach crew _vcl >= 1)then
	{
		deleteVehicle _vcl;
		_vcl = _type createVehicle _pos;
		_vcl setdir _dir;
		sleep 1;
		_vcl setvelocity [0,0,0];
		_vcl setpos _pos;
		sleep 1;
		_vcl setvelocity [0,0,0];
		sleep 1;
	};
	_vcl addMagazinecargo ["VTE_20Rnd_556x45",10];
	_vcl addMagazinecargo ["VTE_7Rnd_1911",5];
	_vcl addMagazinecargo ["VTE_GrenadeRed",10];
	_vcl addMagazinecargo ["VTE_GrenadeGreen",10];
	_vcl addMagazinecargo ["HandGrenade",10];
	_vcl addMagazinecargo ["VTE_20Rnd_762x51_nato",5];
	_vcl addMagazinecargo ["VTE_5Rnd_762x51_nato",5];
	_vcl addMagazinecargo ["VTE_30Rnd_40mm_AmmoBag",5];
	_vcl addMagazinecargo ["VTE_1Rnd_40mm_HE",5];
	_vcl addMagazinecargo ["VTE_1Rnd_40mm_buckshot",15];
	_vcl addMagazinecargo ["VTE_100Rnd_762x51_M60",5];
	_vcl addMagazinecargo ["VTE_M72",5];
	_vcl addMagazinecargo ["VTE_100Rnd_556x45",5];
	_vcl addMagazinecargo ["SatchelCharge_Remote_Mag",5];
	_vcl addAction ["Drop Smoke Grenade","DropSmoke2.sqf",[],0,false];
	sleep 2;
};
