/*

ONCONNECT SCRIPT

This script gets the current unit status when a player joins the mission

© JUNE 2007 - norrin (norrins_nook@iprimus.com.au) 
*************************************************************************************************************************************
onConnect.sqf
*/

if(local player) then
{
	
	//Initialise weapon_respawn script for all units
	{call compile format ["if (isplayer %1) then {[_x,1] exec ""revive_sqf\weapons_respawn.sqs""}", _x]} forEach player_units;

	//Initialise revive script for all units	
	{call compile format ["if (isplayer %1) then {call {[_x, player_units, max_respawns] execVM ""revive_sqf\Revive_player.sqf""}}", _x]} forEach player_units;	
	
	connected = true;
	publicVariable "connected"; 

	//Initialise mission end script
	if (mission_end_function == 1) then {call{[player_units] execVM "revive_sqf\mission_end.sqf"}};

	//Initialise isplayer script
	call{[player_units] execVM "revive_sqf\isplayer.sqf"};

	sleep 2;
	titleText ["", "BLACK IN", 0.3];
	sleep 2;
};
if (true) exitWith {connected = false; publicVariable "connected";};
