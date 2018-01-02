/*

CONNECT SCRIPT

This script activates an instance of the revive script on the existing players machines when a new player joins the server

� JUNE 2007 - norrin (norrins_nook@iprimus.com.au) 
*************************************************************************************************************************************
connected.sqf
*/


private ["_revive_isplayer","_new_players"];
if(local player)then
{
	hint "Player joining";

	//Initialise weapon_respawn script for all units
	{call compile format ["if (isplayer %1 && %1 != player) then {[_x,1] exec ""revive_sqf\weapons_respawn.sqs""}", _x]} forEach player_units;

	//Initialise revive script for joining player on existing player clients	
	_revive_isplayer = [];
	waitUntil{time == time};
	if (time < 2) exitWith
	{
		revive_isplayer_old = [];
	};

	{call compile format ["if (isplayer  %1) then {_revive_isplayer = _revive_isplayer + [%1]}", _x]}forEach player_units;

	_new_players = _revive_isplayer - revive_isplayer_old; 
	if (count _new_players > 0) then
	{
		{call compile format ["if (isplayer %1 && %1 != player) then {call{[_x, player_units, max_respawns] execVM ""revive_sqf\Revive_player.sqf""}}", _x]} forEach _new_players;
	};
	sleep 1;
	revive_isplayer_old = _revive_isplayer;
	publicVariable "revive_isplayer_old"; 
	sleep 2;

};
if (true) exitWith {};
