/*
  CALL_OUT.SQF 

  Playable units call out messages while unconcious

  � JUNE 2007 - norrin (norrins_nook@iprimus.com.au) 

********************************************************************************************************************************

Voice arrays are adapted and taken from ArmA Group Link II Plus! script by SNKMAN.

********************************************************************************************************************************
Start call_out.sqf
*/


private ["_message_no","_message","_count","_random","_name","_unconcious_voice","_commentsBrian","_run"];
_name = _this select 0;
_unconcious_voice = _this select 1;

if (!local _name) exitWith {};

sleep 1;

//Define unconcious voice arrays taken and adpated from 
_commentsBrian = ["Brian_Im_hit","Brian_Im_bleeding","Brian_Medic","Brian_Bastards","Brian_Shit_Man_down","Brian_Oh_no","Brian_Fuck","Brian_Fuck_it","Brian_Shit","Brian_Need_help","Brian_A_little_help_here"];

_count = 0;
_random = 15 + ceil (random 20);
_run = true;

//Body of the script
for [{}, {_run}, {_run}] do
{
	if (alive _name) then 
	{ 
				
		if (_count == _random) then 
		{	
			_message_no = floor (random 11);
			_message = _commentsBrian select _message_no;
			call compile format ["comment_%1 = _message; say_%1 = true; sleep 1; publicVariable ""comment_%1""; publicVariable ""say_%1"";", _name]; 
			sleep 1;
			call compile format ["say_%1 = false; sleep 1; publicVariable ""say_%1"";", _name]; 
			_count = 0;
			_random = 15 + ceil (random 20);
		};
		_count = _count + 1;
		sleep 1;
	};
	if (!alive _name) exitWith {};

	//end script if player is revived or dies
	if (animationstate _name != "AmovPpneMstpSnonWnonDnon" && animationstate _name != "AmovPpneMstpSnonWnonDnon_healed") exitWith {call compile format ["say_%1 = false; sleep 1; publicVariable ""say_%1""", _name]};
};

	


 


