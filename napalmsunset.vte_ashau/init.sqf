
[] execVM "briefing.sqf";

enableSaving [ false, false ];

/*
  INITIALISATION SCRIPT

******************************************************************************************************************************
Start init.sqf
*/

//Init.sqf settings for revive_player scripts by norrin
waitUntil {player == player};
titleText ["Joining Mission", "BLACK FADED", 0.4];

//Configurable revive script options (Off = 0, On = 1)
mission_end_function = 0;
reward_function = 0;
team_kill_function = 0;
all_dead_dialog = 1;
JIP_spawn_dialog = 0;
nearest_teammate_dialog = 1;
unconcious_markers = 0;
follow_cam = 0;  
call_out_function = 1;

//list of playable units - change to reflect the names used in mission
player_units = ["alpha_1","alpha_2","alpha_3","alpha_4","alpha_5","alpha_6","alpha_7","alpha_8","alpha_9","alpha_10","alpha_11","alpha_12","alpha_13","alpha_14","alpha_15","alpha_16"];

// no of respawn points, spawn position names for respawn and the time before the respawn dialog appears for JIP players
no_respawn_points = 0;
Base_1 = "West_spawn_1";
Base_2 = "West_spawn_2";
Base_3 = "West_spawn_3";
Base_4 = "West_spawn_4";
time_b4_JIP_spawn_dialog = 600;

//This variable can be changed if for example you only one sort of unit to be able to revive or 
//you want to use these scripts for a different side
can_revive = "VTE_acsoldier";
can_be_revived = "VTE_acsoldier";

//No of Enemy sides (0, 1 or 2). Enemy sides can be "EAST","WEST","GUER" etc 
no_enemy_sides = 2;
enemy_side_1 = "EAST";
enemy_side_2 = "GUER";

//Maximum number of revives per unit - adjust to whatever value you like
max_respawns = 3;

//Time until respawn button appears (0 = approx. 12 seconds)
//Set to a high number like 100000 seconds if you do not want to use this option
respawn_button_timer = 180;

//If the closest friendly unit is further than this distance away trigger respawn dialog
distance_to_friend = 200; 

//Number fo the revives required for bonus
revives_required = 3;

//Number of teamkills before punishment
no_team_kills = 2;

// disabled due SQF errors 12-22-17
//call{[] execVM "revive_sqf\revive_init.sqf"};
