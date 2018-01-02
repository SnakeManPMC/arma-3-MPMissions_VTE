/*

TEAM KILL PUNISHMENT SCRIPT

This script automatically decreases the revive count of players that team kill 

� JUNE 2007 - norrin (norrins_nook@iprimus.com.au) 
*************************************************************************************************************************************
team_killer.sqf
*/


private ["_killer"];
_killer = _this select 1;

if (isplayer _killer && _killer != player) then
{
	call compile format ["%1_killer = %1_killer + 1; publicVariable ""%1_killer""", _killer];
};
if (true) exitWith {};