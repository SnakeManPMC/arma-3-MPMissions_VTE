/*

MISSION END SCRIPT

Ends mission when all playable units are unconcious

� JUNE 2007 - norrin (norrins_nook@iprimus.com.au)  

Version:  1.0   	
************************************************************************************************************************************
mission_end.sqf
*/


private ["_no_concious","_units","_run"];
_units = _this select 0;
_run = true;

for [{}, {_run}, {_run}] do
{	
	sleep 2;
	_no_concious = 0;
	{call compile format ["if (isplayer %1 && !%1_unconcious) then {_no_concious = _no_concious + 1;};", _x];}forEach _units;
//	titleText [format ["concious = %1", _no_concious], "PLAIN", 0.2];
	sleep 2;
	if (_no_concious == 0) exitWith
	{
		mission_Over = true;
		publicVariable "mission_Over";
	};
	sleep 5;
};
