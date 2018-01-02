/*
  REVIVE_INIT SCRIPT

� JUNE 2007 - norrin (norrins_nook@iprimus.com.au)  
******************************************************************************************************************************
Start revive_init.sqf
*/
//waitUntil {time == time}; 


private ["_d","_dialog_1"];
if (time < 2) then
{
	revive_non_players = player_units;
};

//run script that creates all triggers required for the revive script	
call{[] execVM "revive_sqf\trigger_mkr.sqf"};

sleep 0.1;

//Variables required for onConnect script and triggers
onConnect = true;
PublicVariable "onConnect";

no_base_1 = false;
no_base_2 = false;
no_base_3 = false;
no_base_4 = false;

no_base_1b = false;
no_base_2b = false;
no_base_3b = false;
no_base_4b = false;

sleep 5;
if (JIP_spawn_dialog == 1 && time > time_b4_JIP_spawn_dialog) then
{	
//	forceMap true;
	// if (local player) then {hint "Press escape to close respawn dialog"};
	titleText ["Choose spawn point or press escape to close dialog and start at current position","PLAIN", 0.5]; 
	if (no_respawn_points == 1) then {_d = 1; _dialog_1 = createDialog "respawn_button_1"};
	if (no_respawn_points == 2) then {_d = 1; _dialog_1 = createDialog "respawn_button_2"};
	if (no_respawn_points == 3) then {_d = 1; _dialog_1 = createDialog "respawn_button_3"};
	if (no_respawn_points == 4) then {_d = 1; _dialog_1 = createDialog "respawn_button_4"};
};

if (true) exitWith {};