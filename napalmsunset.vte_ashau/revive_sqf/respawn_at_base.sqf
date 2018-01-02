/*

RESPAWN AT BASE SCRIPT

� June 2007 - norrin (norrins_nook@iprimus.com.au) 
****************************************************************************
respawn_at_base.sqf
*/


private ["_dialog_1","_spawn_pos"];
_spawn_pos = _this select 0;

if (_spawn_pos == 1 && Base_1 != "" && !no_base_1 && !no_base_1b) then
{
	player setpos getMarkerPos Base_1;
	player switchMove "AmovPercMstpSnonWnonDnon";
	titleText ["You have chosen to respawn at position 1", "PLAIN", 0.5];
	call compile format ["%1_respawn_at_base = true; publicVariable ""%1_respawn_at_base""", player];
	forceMap false;
};
if (_spawn_pos == 1 && Base_1 != "" && no_base_1 || _spawn_pos == 1 && Base_1 != "" && no_base_1b) then
{
	titletext ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
	if (no_respawn_points == 1) then {_dialog_1 = createDialog "respawn_button_1"};
	if (no_respawn_points == 2) then {_dialog_1 = createDialog "respawn_button_2"};
	if (no_respawn_points == 3) then {_dialog_1 = createDialog "respawn_button_3"};
	if (no_respawn_points == 4) then {_dialog_1 = createDialog "respawn_button_4"};
};

if (_spawn_pos == 2 && Base_2 != "" && !no_base_2 && !no_base_2b) then
{
	player setpos getMarkerPos Base_2;
	player switchMove "AmovPercMstpSnonWnonDnon";
	titleText ["You have chosen to respawn at position 2", "PLAIN", 0.5];
	call compile format ["%1_respawn_at_base = true; publicVariable ""%1_respawn_at_base""", player];
	forceMap false;
};
if (_spawn_pos == 2 && Base_2 != "" && no_base_2 ||  _spawn_pos == 2 && Base_2 != "" && no_base_2b) then
{
	titletext ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
	if (no_respawn_points == 2) then {_dialog_1 = createDialog "respawn_button_2"};
	if (no_respawn_points == 3) then {_dialog_1 = createDialog "respawn_button_3"};
	if (no_respawn_points == 4) then {_dialog_1 = createDialog "respawn_button_4"};
};

if (_spawn_pos == 3 && Base_3 != "" && !no_base_3 && !no_base_3b) then
{
	player setpos getMarkerPos Base_3;
	player switchMove "AmovPercMstpSnonWnonDnon";
	titleText ["You have chosen to respawn at position 3", "PLAIN", 0.5];
	call compile format ["%1_respawn_at_base = true; publicVariable ""%1_respawn_at_base""", player];
	forceMap false;
};
if (_spawn_pos == 3 && Base_3 != "" && no_base_3 || _spawn_pos == 3 && Base_3 != "" && no_base_3b) then
{
	titletext ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
//	if (no_respawn_points == 3) then {_dialog_1 = createDialog "respawn_button_3"};
//	if (no_respawn_points == 4) then {_dialog_1 = createDialog "respawn_button_4"};
};

if (_spawn_pos == 4 && Base_4 != "" && !no_base_4 && !no_base_4b) then
{
	player setpos getMarkerPos Base_4;
	player switchMove "AmovPercMstpSnonWnonDnon";
	titleText ["You have chosen to respawn at position 4", "PLAIN", 0.5];
	call compile format ["%1_respawn_at_base = true; publicVariable ""%1_respawn_at_base""", player];
	forceMap false;
};
if (_spawn_pos == 4 && Base_4 != "" && no_base_4 || _spawn_pos == 4 && Base_4 != "" && no_base_4b) then
{
	titleText ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
};

if(true) exitWith {};