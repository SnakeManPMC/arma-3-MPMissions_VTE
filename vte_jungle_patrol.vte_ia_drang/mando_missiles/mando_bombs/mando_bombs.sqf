/********************************************************************************* 
   Mando_bombs.sqf v1.51
   by Mandoble, July 2008

   A plane will perform real and accurate free fall bombs or SADARM run against indicated object or coordinates.
   The plane will drop two bombs in sequence.
   (Execute this script where the attacking plane is local)

   Parameters:
      Plane: plane that will perform the attack (you may use any plane type).
      Target: object or coordinates.      
      Radio: true/false, if true, planet's pilot will radio attack status (radio messages are not broadcasted).
      Bomb position: relative to the launcher in model coordinates. Second bomb will be spawed inverting the first element.
                     For example [2, 0, -2] will spawn first bomb 2m to the right of the plane and 2m below.
      Altitude over target: the flying altitude of the plane, between 100 and 300
      Bomb class: optional, if provided, the class of a bomb type ammo or the special type "SADARM". "Bo_GBU12_LGB" is used by default.


   Note: if "SADARM" type is selected, this script will require the presence of mando_bombs_sadarm.sqf and mando_bombs_effects.sqf.

   Example:
      _scr = [plane1, target1, true, [2, 0, -2],100]execVM"mando_missiles\mando_bombs\mando_bombs.sqf";

      or

      _scr = [plane1, getMarkerPos "mk_objetive", true, [2, 0, -2], 100]execVM"mando_missiles\mando_bombs\mando_bombs.sqf";


      To check whether an attack run has finished, use if (scriptDone _scr) then {// attack finished};
      This script updates also "mando_airsupport_state" internal vehicle variable with the following possible states:
         "Ingressing"; Ingressing for bomb run
         "Egressing"; Egressing from bomb run
         "Destroyed"; Plane destroyed
         "Engaging": Attacking position
         "Engaging target": Attacking object
         "SADARMs away": SADARMs have been dropped over target.
         "Bombs away": Free fall bombs have been dropped over target.
         "No visual": The attacker cannot see the target.
         "Failed to align": The attacker failed to aling in time with the target.

      You may use getVariable command to check the current value. 

*********************************************************************************/



mando_drop_bomb = 
{
   private["_plane", "_vup", "_vdir", "_vvel", "_velz", "_bomb", "_deltatime", "_timeold"];
   _plane = _this select 0;
   _vup = vectorUp _plane; 
   _vdir = vectorDir _plane;
   _vvel = velocity _plane;
   _velz = 0;
   _bomb = (_this select 1) createVehicle (_plane modelToWorld (_this select 2));
   _bomb setVelocity [_vvel select 0,_vvel select 1, 0];
   _deltatime = 0;
   _timeold = time;
   while {!isNull _bomb} do
   {
      _deltatime = (time-_timeold) max 0.001;
      _timeold = time;
      _bomb setVectorDir _vdir;
      _bomb setVectorUp _vup;
      _bomb setVelocity [_vvel select 0,_vvel select 1, _velz];
      _velz = _velz - 9.8*_deltatime;  
      Sleep 0.002;
   };
};




private["_plane", "_target", "_posp", "_alt", "_post", "_posb", "_deltaz", "_dist", "_disth", "_vel", "_bomb", "_continue", "_ang", "_pilot", "_log", "_type", "_radio", "_i", "_mode", "_behaviour", "_crew", "_sadarm", "_failed_to_align", "_los_log", "_pos_asl", "_ratev", "_los_ok", "_pos_ini"];

_plane  = _this select 0;
_target = _this select 1;
_radio  = _this select 2;
_posb   = _this select 3;
_alt    = _this select 4;


_sadarm = false;
if (count _this > 5) then
{
   _type = _this select 5;
   if (_type == "SADARM") then
   {
      _sadarm = true;
   };
}
else
{
   _type = "vte_mk82";
};


if (!local _plane) exitWith {};

_pos_ini = getPosASL _plane;

if (typeName _target == "ARRAY") then
{
   if (count _target == 2) then
   {
      _target = _target + [0];
   };

   _log = "logic" createVehicleLocal _target;
   _log setPos _target;
   _target = _log;   
};


_pilot = driver _plane;

_mode = combatMode _pilot;
_behaviour = behaviour _pilot;
_crew = crew _plane;
{_x setCombatMode "BLUE";_x setBehaviour "CARELESS"} forEach _crew;

_plane setVariable ["mando_airsupport_state", "Ingressing"];

if ((_plane distance _target) < 3500) then
{
   _posp = getPosASL _plane;
   _post = getPosASL _target;
   _ang = ((_post select 0)-(_posp select 0)) atan2 ((_post select 1)-(_posp select 1));
   _ang = _ang + 180;
   _plane flyinHeight ((getPosASL _target select 2) + _alt);
   _plane doMove [(_posp select 0)+sin(_ang)*4500,(_posp select 1)+cos(_ang)*4500, ((getPosASL _target select 2) + _alt)];
   group _pilot addWaypoint [[(_posp select 0)+sin(_ang)*4500,(_posp select 1)+cos(_ang)*4500], 0];
   if (_radio) then
   {
      _pilot sideChat "Moving to the attack position";
   };
   sleep 2;
   waitUntil {(unitReady _pilot) || (!alive _plane) || (isNull _target) || (!alive _target)};
};


_plane flyinHeight ( ((getPosASL _target select 2) - (getPosASL _plane select 2) + _alt) max _alt);

// _plane flyinHeight ((getPosASL _target select 2) + _alt);

group _pilot Move [getPosASL _target select 0, getPosASL _target select 1];
group _pilot addWaypoint [getPosASL _target, 0];
waitUntil {(!unitReady _pilot) || (!alive _plane)};
Sleep 2;
_continue = true;

if (!alive _plane) then
{
   _continue = false;
   _plane setVariable ["mando_airsupport_state", "Destroyed"];
}
else
{
   if ((isNull _target) || (!alive _target)) then
   {
      _continue = false;
      _plane setVariable ["mando_airsupport_state", "Egressing"];
   };
};

_los_ok = true;
_failed_to_align = false;

while {_continue} do
{
   if (_radio) then
   {
      _pilot sideChat "Aproaching to the target";
   };


   while {_continue} do
   {
//      _ang = acos( ((_plane worldToModel getPosASL _target) select 1)/(_target distance _plane));
      _ang = ((_plane worldToModel getPosASL _target) select 0) atan2 ((_plane worldToModel getPosASL _target) select 1);
//      if ((abs(_ang) < 20) && ((_plane distance _target) < 2900)) then
      if ((abs(_ang) < 20) && ((_plane distance _target) < (2900+(getPosASL _plane select 2)))) then
      {
         _continue = false;
      };

      if ((!alive _plane) || !(_pilot in _plane) || (!alive _pilot) || (isNull _target) || (!alive _target)) then
      {
         _continue = false;
      };

      if ((unitReady _pilot) && (alive _pilot)) then
      {
         _continue = false;
         _failed_to_align = true;
      };

      Sleep 0.1;
   };


   if ((alive _plane) && (_pilot in _plane) && (alive _pilot) && (!isNull _target) && (alive _target) && !_failed_to_align) then
   {   
      _posp = getPosASL _plane;
      _post = getPosASL _target;
      _disth = sqrt(((getPosASL _plane select 0) - (getPosASL _target select 0))^2 + ((getPosASL _plane select 1) - (getPosASL _target select 1))^2);
      _dist = _plane distance _target;
      _los_log = "logic" createVehicleLocal [0,0,0];
      _los_log setPos (_plane modelToWorld [0,0,0]);

      _pos_asl = getPosASL _los_log;
      _ang = ((_post select 0)-(_posp select 0)) atan2 ((_post select 1)-(_posp select 1));                   
      _ratev = ((_post select 2) - (_pos_asl select 2))/_disth;


      for [{_j = 20},{(_j < (_disth - 25)) && _los_ok},{_j=_j + 50}] do
      {
         _los_log setPosASL [(_pos_asl select 0)+sin(_ang)*_j,(_pos_asl select 1)+cos(_ang)*_j, 2 + (_pos_asl select 2)+_ratev*_j];

         if ((getPosASL _los_log select 2) < -1) then
         {
            _los_ok = false;                           
         };
      };
      deleteVehicle _los_log;
   };


   _vel = sqrt((velocity _plane select 0)^2 + (velocity _plane select 1)^2);   

   if ((alive _plane) && (_pilot in _plane) && (alive _pilot) && (!isNull _target) && (alive _target) && !_failed_to_align && _los_ok) then
   {
      _continue = true;
      if (_radio) then
      {
         if (typeName (_this select 1) == "ARRAY") then
         {
            _pilot sideChat "Engaging";
         }
         else
         {
            _pilot sideChat format["Engaging %1", typeOf _target];
         };
      };

      if (typeName (_this select 1) == "ARRAY") then
      {
         _plane setVariable ["mando_airsupport_state", "Engaging"];
      }
      else
      {
         _plane setVariable ["mando_airsupport_state", format["Engaging %1", typeOf _target]];
      };
   };

   while {_continue} do
   {
      if ((!alive _plane) || !(_pilot in _plane) || (!alive _pilot)) then
      {
         _continue = false;
      };

      _posp = getPosASL _plane;
      _post = getPosASL _target;
      _deltaz = (_posp select 2) - (_post select 2);
      _disth = sqrt(((_posp select 0)-(_post select 0))^2 + ((_posp select 1)-(_post select 1))^2) - 30;

      _ang = ((_post select 0)-(_posp select 0)) atan2 ((_post select 1)-(_posp select 1));
      _plane setDir _ang;
      _plane setVelocity [_vel*sin(_ang),_vel*cos(_ang), 0];


      if (_sadarm) then
      {
         if (_disth < 200) then
         { 
            if (_radio) then
            {
               _pilot sideChat "SADARMs away";
            };
            _plane setVariable ["mando_airsupport_state", "SADARMs away"];

            [_plane, _plane modelToWorld _posb]execVM"mando_missiles\mando_bombs\mando_bombs_sadarm.sqf";  
            Sleep 0.2;
            [_plane, _plane modelToWorld [-(_posb select 0), _posb select 1, _posb select 2]]execVM"mando_missiles\mando_bombs\mando_bombs_sadarm.sqf";  
            _continue = false;

            for [{_i = 0},{_i < 50},{_i = _i + 1}] do
            {
               if (!alive _plane) then
               {
                  _i = 9999;
               };
               _plane setDir _ang;
               _plane setVelocity [_vel*sin(_ang),_vel*cos(_ang), 0];
               Sleep 0.05;
            };
         };
      }
      else
      { 
         if (sqrt(_deltaz*2/9.8) >= _disth/_vel) then
         {
            if (_radio) then
            {
               _pilot sideChat "Bombs away";
            };
            _plane setVariable ["mando_airsupport_state", "Bombs away"];

            [_plane, _type, _posb] spawn mando_drop_bomb;
  
            sleep 0.1;
 
            [_plane, _type, [-(_posb select 0), _posb select 1, _posb select 2]] spawn mando_drop_bomb;

            _continue = false;
  
            for [{_i = 0},{_i < 50},{_i = _i + 1}] do
            {
               if (!alive _plane) then
               {
                  _i = 9999;
               };
               _plane setDir _ang;
               _plane setVelocity [_vel*sin(_ang),_vel*cos(_ang), 0];
               Sleep 0.05;
            };
         };
      };
      Sleep 0.01;
   };
};

if (!isNull _log) then
{
   deleteVehicle _log;
};

{_x setCombatMode _mode;_x setBehaviour _behaviour} forEach _crew;

if (!alive _plane) then
{
   _plane setVariable ["mando_airsupport_state", "Destroyed"];
}
else
{
   if (!_failed_to_align) then
   {
      if (!_los_ok) then
      {
         if (_radio && alive _pilot) then
         {
            _pilot sideChat "No visual";
         };
         _plane setVariable ["mando_airsupport_state", "No visual"];
         Sleep 4;
      };
      if (_radio && alive _pilot) then
      {
         _pilot sideChat "Egressing";
      };

      _plane setVariable ["mando_airsupport_state", "Egressing"];
   }
   else
   {
      if (_radio && alive _pilot) then
      {
         _pilot sideChat "Failed to align";
      };

      _plane setVariable ["mando_airsupport_state", "Failed to align"];
      Sleep 4;
      if (_radio && alive _pilot) then
      {
         _pilot sideChat "Egressing";
      };

      _plane setVariable ["mando_airsupport_state", "Egressing"];
   };
};