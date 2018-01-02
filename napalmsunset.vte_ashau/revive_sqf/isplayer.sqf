/*

ISPLAYER SCRIPT

Checks to determine whether the unit isplayer and resets unconcious variable and deletes marker if player no longer present

� JUNE 2007 - norrin (norrins_nook@iprimus.com.au)  

Version:  2.0   	
************************************************************************************************************************************
isplayer.sqf
*/


private ["_name_unit","_names","_unit","_name","_c","_names_2","_players","_string","_no_units","_units","_run"];
_units = _this select 0;
_run = true;

//Create array _names that contains names of all current players
_c = 0;
_no_units = count _units;
_names =[];

while {_c < _no_units} do
{
	_unit = _units select _c;
	_name = call compile format ["%1", _unit]; 
	 
	if (isplayer _name) then 
	{
		_name_unit = name _name;
		_names = _names + [_name_unit];
	}; 
	_c = _c + 1;
	sleep 0.01;
};


for [{}, {_run}, {_run}] do
{	
	{call compile format ["if (!isplayer %1) then {%1_a = false; publicVariable ""%1_a""}", _x];}forEach _units;

	//Create array _names_2 that contains names of all current players 
	_c = 0;
	_no_units = count _units;
	_names_2 = [];
	_players = [];

	while {_c < _no_units} do
	{
		{call compile format ["if (!isplayer %1) then {%1_a = false; publicVariable ""%1_a""}", _x];}forEach _units;
		_unit = _units select _c;
		_name = call compile format ["%1", _unit]; 
	 
		if (isplayer _name) then 
		{
			_name_unit = name _name;
			_names_2 = _names_2 + [_name_unit];
			_players = _players + [_unit];
		}; 
		_c = _c + 1;
		sleep 0.01;
	};
	//revive_non_players = player_units - _players;
	//publicVariable "revive_non_players";

	//Compare _names and _names_2 and if player has disconnected then delete player's unconcious marker 
	_c = 0;
	_no_units = count _names;
	while {_c < _no_units} do
	{
		{call compile format ["if (!isplayer %1) then {%1_a = false; publicVariable ""%1_a""}", _x];}forEach _units;
		_string = _names select _c;
		
		call compile format ["if (""%1"" in %2) then {} Else {deleteMarker ""%1 is down""}", _string, _names_2]; 
		_c = _c + 1;
		sleep 0.01;
	};
	
	//Create array _names that contains names of all current players
	_c = 0;
	_no_units = count _units;
	_names =[];
	
	while {_c < _no_units} do
	{
		{call compile format ["if (!isplayer %1) then {%1_a = false; publicVariable ""%1_a""}", _x];}forEach _units;
		_unit = _units select _c;
		_name = call compile format ["%1", _unit]; 
	 
		if (isplayer _name) then 
		{
			_name_unit = name _name;
			_names = _names + [_name_unit];
		}; 
		_c = _c + 1;
		sleep 0.01;
	};

	//Compare _names_2 and _names and if player has disconnected then delete player's unconcious marker
	_c = 0;
	_no_units = count _names_2;
	while {_c < _no_units} do
	{
		{call compile format ["if (!isplayer %1) then {%1_a = false; publicVariable ""%1_a""}", _x];}forEach _units;
		_string = _names_2 select _c;
		
		call compile format ["if (""%1"" in %2) then {} Else {deleteMarker ""%1 is down""}", _string, _names]; 
		_c = _c + 1;
		sleep 0.01;
	};	
sleep 3;
};
