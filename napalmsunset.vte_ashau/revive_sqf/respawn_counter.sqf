/*

RESPAWN COUNTER SCRIPT

© JUNE 2007 - norrin (norrins_nook@iprimus.com.au) 
*****************************************************
respawn_counter.sqf
*/

//Initialise variables for respawn counter
if (time < 2) then
{
	{call compile format ["%1_revives = 0; publicvariable ""%1_revives""", _x]} forEach player_units;
	{call compile format ["revive_%1 = 0", _x]} forEach player_units;
	{call compile format ["%1_killer = 0", _x]} forEach player_units;
	
};