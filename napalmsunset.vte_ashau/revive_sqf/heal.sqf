/*
  HEAL_ACTION SCRIPT

  Causes the player to execute the medic animation when the revive action is chosen

  © April 2007 - norrin (norrins_nook@iprimus.com.au)

***********************************************************************************************************************
begin heal.sqf
*/

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 8;
if (true) exitWith {};