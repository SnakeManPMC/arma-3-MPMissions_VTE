/*

TRIGGER MAKING SCRIPT

This script automatically creates the triggers required for the revive_player.sqf script

© JUNE 2007 - norrin (norrins_nook@iprimus.com.au) 
*************************************************************************************************************************************
trigger_mkr.sqf
*/

//if(!local server) exitWith {};

trig_0 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
trig_0 setTriggerType "END1";
trig_0 setTriggerActivation ["LOGIC", "", false];
trig_0 setTriggerArea [1, 1, 0, false];
trig_0 setTriggerStatements ["mission_Over", "titleText [""Mission Failed - all players are unconcious"", ""PLAIN"", 1]", ""];
trig_0 setTriggerTimeout [15, 15, 15, false];

trig_1 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
trig_1 setTriggerType "NONE";
trig_1 setTriggerActivation ["LOGIC", "", true];
trig_1 setTriggerArea [1, 1, 0, false];
trig_1 setTriggerStatements ["onConnect", "call{[] execVM ""revive_sqf\onConnect.sqf""}",""];

trig_2 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
trig_2 setTriggerType "NONE";
trig_2 setTriggerActivation ["LOGIC", "", true];
trig_2 setTriggerArea [1, 1, 0, false];
trig_2 setTriggerStatements ["connected", "call{[] execVM ""revive_sqf\connected.sqf""}", ""];

trig_3 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
trig_3 setTriggerType "NONE";
trig_3 setTriggerActivation ["LOGIC", "", true];
trig_3 setTriggerArea [1, 1, 0, false];
trig_3 setTriggerStatements ["onConnect", "call{[] execVM ""revive_sqf\respawn_counter.sqf""}", ""];

If (no_enemy_sides == 1 || no_enemy_sides == 2) then
{
	trig_4 = createTrigger["EmptyDetector", getMarkerPos Base_1];
	trig_4 setTriggerType "NONE";
	trig_4 setTriggerActivation [enemy_side_1, "PRESENT", true];
	trig_4 setTriggerArea [50, 50, 0, false];
	trig_4 setTriggerStatements ["this && !no_base_1", "no_base_1 = true; publicvariable ""no_base_1""", ""];

	trig_5 = createTrigger["EmptyDetector", getMarkerPos Base_1];
	trig_5 setTriggerType "NONE";
	trig_5 setTriggerActivation [enemy_side_1, "NOT PRESENT", true];
	trig_5 setTriggerArea [50, 50, 0, false];
	trig_5 setTriggerStatements ["this && no_base_1", "no_base_1 = false; publicvariable ""no_base_1""", ""];

	trig_6 = createTrigger["EmptyDetector", getMarkerPos Base_2];
	trig_6 setTriggerType "NONE";
	trig_6 setTriggerActivation [enemy_side_1, "PRESENT", true];
	trig_6 setTriggerArea [50, 50, 0, false];
	trig_6 setTriggerStatements ["this && !no_base_2", "no_base_2 = true; publicvariable ""no_base_2""", ""];

	trig_7 = createTrigger["EmptyDetector", getMarkerPos Base_2];
	trig_7 setTriggerType "NONE";
	trig_7 setTriggerActivation [enemy_side_1, "NOT PRESENT", true];
	trig_7 setTriggerArea [50, 50, 0, false];
	trig_7 setTriggerStatements ["this && no_base_2", "no_base_2 = false; publicvariable ""no_base_2""", ""];

	trig_8 = createTrigger["EmptyDetector", getMarkerPos Base_3];
	trig_8 setTriggerType "NONE";
	trig_8 setTriggerActivation [enemy_side_1, "PRESENT", true];
	trig_8 setTriggerArea [50, 50, 0, false];
	trig_8 setTriggerStatements ["this && !no_base_3", "no_base_3 = true; publicvariable ""no_base_3""", ""];

	trig_9 = createTrigger["EmptyDetector", getMarkerPos Base_3];
	trig_9 setTriggerType "NONE";
	trig_9 setTriggerActivation [enemy_side_1, "NOT PRESENT", true];
	trig_9 setTriggerArea [50, 50, 0, false];
	trig_9 setTriggerStatements ["this && no_base_3", "no_base_3 = false; publicvariable ""no_base_3""", ""];

	trig_10 = createTrigger["EmptyDetector", getMarkerPos Base_4];
	trig_10 setTriggerType "NONE";
	trig_10 setTriggerActivation [enemy_side_1, "PRESENT", true];
	trig_10 setTriggerArea [50, 50, 0, false];
	trig_10 setTriggerStatements ["this && !no_base_4", "no_base_4 = true; publicvariable ""no_base_4""", ""];

	trig_11 = createTrigger["EmptyDetector", getMarkerPos Base_4];
	trig_11 setTriggerType "NONE";
	trig_11 setTriggerActivation [enemy_side_1, "NOT PRESENT", true];
	trig_11 setTriggerArea [50, 50, 0, false];
	trig_11 setTriggerStatements ["this && no_base_4", "no_base_4 = false; publicvariable ""no_base_4""", ""];
};

If (no_enemy_sides == 2) then
{
	trig_12 = createTrigger["EmptyDetector", getMarkerPos Base_1];
	trig_12 setTriggerType "NONE";
	trig_12 setTriggerActivation [enemy_side_2, "PRESENT", true];
	trig_12 setTriggerArea [50, 50, 0, false];
	trig_12 setTriggerStatements ["this && !no_base_1b", "no_base_1b = true; publicvariable ""no_base_1b""", ""];

	trig_13 = createTrigger["EmptyDetector", getMarkerPos Base_1];
	trig_13 setTriggerType "NONE";
	trig_13 setTriggerActivation [enemy_side_2, "NOT PRESENT", true];
	trig_13 setTriggerArea [50, 50, 0, false];
	trig_13 setTriggerStatements ["this && no_base_1b", "no_base_1b = false; publicvariable ""no_base_1b""", ""];

	trig_14 = createTrigger["EmptyDetector", getMarkerPos Base_2];
	trig_14 setTriggerType "NONE";
	trig_14 setTriggerActivation [enemy_side_2, "PRESENT", true];
	trig_14 setTriggerArea [50, 50, 0, false];
	trig_14 setTriggerStatements ["this && !no_base_2b", "no_base_2b = true; publicvariable ""no_base_2b""", ""];

	trig_15 = createTrigger["EmptyDetector", getMarkerPos Base_2];
	trig_15 setTriggerType "NONE";
	trig_15 setTriggerActivation [enemy_side_2, "NOT PRESENT", true];
	trig_15 setTriggerArea [50, 50, 0, false];
	trig_15 setTriggerStatements ["this && no_base_2b", "no_base_2b = false; publicvariable ""no_base_2b""", ""];

	trig_16 = createTrigger["EmptyDetector", getMarkerPos Base_3];
	trig_16 setTriggerType "NONE";
	trig_16 setTriggerActivation [enemy_side_2, "PRESENT", true];
	trig_16 setTriggerArea [50, 50, 0, false];
	trig_16 setTriggerStatements ["this && !no_base_3b", "no_base_3b = true; publicvariable ""no_base_3b""", ""];

	trig_17 = createTrigger["EmptyDetector", getMarkerPos Base_3];
	trig_17 setTriggerType "NONE";
	trig_17 setTriggerActivation [enemy_side_2, "NOT PRESENT", true];
	trig_17 setTriggerArea [50, 50, 0, false];
	trig_17 setTriggerStatements ["this && no_base_3b", "no_base_3b = false; publicvariable ""no_base_3b""", ""];

	trig_18 = createTrigger["EmptyDetector", getMarkerPos Base_4];
	trig_18 setTriggerType "NONE";
	trig_18 setTriggerActivation [enemy_side_2, "PRESENT", true];
	trig_18 setTriggerArea [50, 50, 0, false];
	trig_18 setTriggerStatements ["this && !no_base_4b", "no_base_4b = true; publicvariable ""no_base_4b""", ""];

	trig_19 = createTrigger["EmptyDetector", getMarkerPos Base_4];
	trig_19 setTriggerType "NONE";
	trig_19 setTriggerActivation [enemy_side_2, "NOT PRESENT", true];
	trig_19 setTriggerArea [50, 50, 0, false];
	trig_19 setTriggerStatements ["this && no_base_4b", "no_base_4b = false; publicvariable ""no_base_4b""", ""];
};
if (true) exitWith {};
