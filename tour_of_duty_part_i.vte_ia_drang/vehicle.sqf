/*  
=========================================================
  Simple Vehicle Respawn Script v1.2
  by Tophe of �stg�ta Ops [OOPS]
  
  Put this in the vehicles init line:
  veh = [this] execVM "vehicle.sqf"


  Options:
  There are some optional settings. The format for these are:
  veh = [this, RespawnDelay, DesertedVehicleTimer, dynamic/static position] execVM "vehicle.sqf"

  Default respawn delay is 30 seconds, to set a custom
  respawn delay time, put that in the init as well. 
  Like this:
  veh = [this, 15] execVM "vehicle.sqf"

  Default respawn time when vehicle is deserted, but not
  destroyed is 120 seconds. To set a custom timer for this 
  first put the respawn delay, then the deserted vehicle timer-
  Like this:  
  veh = [this, 15, 10] execVM "vehicle.sqf"

  By default the vehicle will respawn to the point where it first
  was when the mission started (static). This can be changed to 
  dynamic, Then the vehicle will respawn to the position where it 
  was destroyed. First set the respawn delay and the deserted timer
  then put 1 for dynamic. Don't put anything at all for default static.
  Like this:
  veh = [this, 15, 10, 1] execVM "vehicle.sqf"

	
Contact & Bugreport: harlechin@hotmail.com

=========================================================
*/


private ["_delay","_deserted","_dynamic","_dead","_nodelay","_timeout","_position","_dir","_unit","_type"];
if (!isServer) exitWith {};


// Define the variables
_unit = _this select 0;
_delay = _this select 1;
_deserted = _this select 2;
_dynamic = _this select 3;

if (isNil ("_delay")) then {_delay = 30} else {_delay = _delay};
if (isNil ("_deserted")) then {_deserted = 120} else {_deserted = _deserted};
if (isNil ("_dynamic")) then {_dynamic = 0;} else {_dynamic = 1};
if (_delay < 0) then {_delay = 0};
if (_deserted < 0) then {_deserted = 0};

_dir = getDir _unit;
_position = getPosASL _unit;
_type = typeOf _unit;
_dead = false;
_nodelay = false;


// Start monitoring the vehicle
while {true} do 
{	
sleep (2 + random 12);

	if (!canMove _unit) then {_dead = true};

// Check if the vehicle is deserted.
	if ((_unit distance _position > 10) and (count crew _unit == 0)) then 
	{
		_timeout = time + _deserted;
		waitUntil {_timeout < time or count crew _unit > 0};
		if (count crew _unit > 0) then {_dead = false;}; 
		if (count crew _unit == 0) then {_dead = true; _nodelay =true;}; 
	};

// Respawn vehicle
      if (_dead) then 
	{	
		if (_nodelay) then {sleep 0.1; _nodelay = false;} else {sleep _delay};
		if (_dynamic == 1) then {_position = getPosASL _unit; _dir = getDir _unit;};
		deleteVehicle _unit;
		sleep 2;
		_unit = _type createVehicle _position;
		_unit setPos _position;
		_unit setDir _dir;
		_dead = false;
	};
};