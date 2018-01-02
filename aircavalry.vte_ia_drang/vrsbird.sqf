// *****************************************************
//** Operation Flashpoint Script File
//*****************************************************

//BEGIN vrs_AI.sqf
//Original script by KaRRiLLioN modified by norrin for AI units 4th Feb 2007
//IMPORTANT: ADD A GAMELOGIC NAMED Server
//to the mission to prevent multispawn

private ["_vcl","_respawndelay","_vclemptydelay","_dir","_pos","_type","_run","_wait","_delay"];

if (!local Server) exitWith {};

_vcl = _this;
_vclemptydelay = 180;
_respawndelay = 120;
_dir = Getdir _vcl;
_pos = getPosASL _vcl;
_type = typeOf _vcl;

_run = TRUE;
sleep 5;



for [{}, {_run}, {_run}] do
{
while {_vcl distance _pos < 5 && canMove _vcl} do
   {
	  sleep 1;
   };
while {canMove _vcl && count crew _vcl > 0 && ({damage _x}forEach crew _vcl)!= 1} do   
   {
	_wait = Time + _vclemptydelay;
	sleep 1;
   };	
while {canMove _vcl && count crew _vcl < 1 && Time < _wait} do
   {
	sleep 1;
   }; 
while {canMove _vcl && {damage _x} forEach crew _vcl >= 1 && Time < _wait} do
   {
	sleep 1;
   };
_delay = Time + _respawndelay;
while {!canMove _vcl && Time < _delay} do
   {
	sleep 1;
   };
if (count crew _vcl < 1) then
   {
	   deleteVehicle _vcl;
         _vcl = _type createVehicle _pos;
	   _vcl setdir _dir;
         sleep 1;
         _vcl setvelocity [0,0,0];
         _vcl setpos _pos;
         sleep 1;
         _vcl setvelocity [0,0,0];
	   sleep 2;
    }; 
if ({damage _x} forEach crew _vcl >= 1)then
   {
	   deleteVehicle _vcl;
         _vcl = _type createVehicle _pos;
	   _vcl setdir _dir;
         sleep 1;
         _vcl setvelocity [0,0,0];
         _vcl setpos _pos;
        sleep 1;
         _vcl setvelocity [0,0,0];
	   sleep 1;
    };

_vcl addAction ["Drop Smoke Grenade","DropSmoke.sqf",[],0,false];

sleep 2;
};
