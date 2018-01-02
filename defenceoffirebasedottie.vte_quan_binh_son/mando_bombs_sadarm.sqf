/*********************************************************************************
   Mando_bombs_sadarm.sqf v1.0
   by Mandoble, March 2008

   Purpose:
      Spawns a SADARM bomb.

   This script requires the presence of mando_bombs_effects.sqf.

   Arguments:
      Launcher (if any) or objNull if none.
      Bomb spawn position.

   Example:
   [plane1, plane1 modelToWorld[3, 0, -2]]execVM"mando_bombs_sadarm.sqf";
   Sleep 0.2;
   [plane1, plane1 modelToWorld[-3, 0, -2]]execVM"mando_bombs_sadarm.sqf";

*********************************************************************************/

private ["_launcher", "_pos", "_radio", "_radiochute", "_bomb", "_trigger"];

_launcher = _this select 0;
_pos = _this select 1;
_radio = "Land_VTE_bis_mash" createVehicle [0,0,30];
_radio setPos [0,0,30];
_radio setDir 0;
_radiochute = "ParachuteWest" createVehicle _pos;
_radiochute setPos _pos;
if (!isNull _launcher) then
{
   _radiochute setVectorDir vectorDir _launcher;
   _radiochute setVectorUp vectorUp _launcher;
   _radiochute setVelocity velocity _launcher;
};

[]spawn
{
   _trigger = createTrigger ["EmptyDetector", [0, 0, 0]];
   _trigger setTriggerActivation ["NONE", "PRESENT", false];
   _trigger setTriggerArea [0, 0, 0, false];
   _trigger setTriggerType "NONE";
   _trigger setTriggerTimeout [0, 0, 0, false ];
   _trigger setTriggerStatements ["true", "res = []execVM""mando_bombs_effects.sqf""", ""];
   Sleep 6;
   deleteVehicle _trigger;
};


[_radio, _radiochute]spawn 
{
   private["_radio", "_list1", "_list2", "_post", "_posm", "_bomb", "_bomb1", "_bomb2", "_distance", "_altmasl", "_alttasl", "_target", "_ntarget", "_angv", "_ang", "_vz", "_vh", "_vx", "_vy", "_uz", "_ur", "_ux", "_uy", "_vvel", "_log", "_lastpos"];
 
  _radio = _this select 0;
   Sleep 6 + random 3;

   while {!isNull _radio} do
   {
      _list1 = nearestObjects [[getPosASL _radio select 0, getPosASL _radio select 1, 0], ["Car","Tank", "StaticWeapon", "Ship"], (((getPosASL _radio select 2)*2) min 250)];
      _list2 = []; 
      {
         if ((alive _x) && ((count crew _x)>0)) then
         { 
            _list2 = _list2 + [_x];
         };
      } forEach _list1;

      if (count _list2 > 0) then
      {
         _ntarget = random (count _list2);
         _ntarget = floor _ntarget;
         _target = _list2 select _ntarget;
         _log = "logic" createVehicleLocal [0,0,0];
         _log setPos [(getPosASL _target select 0),(getPosASL _target select 1),(getPosASL _target select 2)+0.5];
         _target = _log;
          
         _post = getPosASL _target;
         _posm = getPosASL _radio;
         _distance = _radio distance _target;
         _altmasl = getPosASL _radio select 2;
         _alttasl = getPosASL _target select 2;

         _angv = asin((_alttasl - _altmasl)/(_distance max (abs(_alttasl - _altmasl))));
         _ang = ((_post select 0)-(_posm select 0)) atan2 ((_post select 1)-(_posm select 1));


         _vz = (sin _angv)*600;
         _vh = (cos _angv)*600;
         _vx = (sin _ang)*_vh;
         _vy = (cos _ang)*_vh;

         _uz = sin(_angv+90);
         _ur = cos(_angv+90);
         _ux = sin(_ang)*_ur;
         _uy = cos(_ang)*_ur;
         _vvel = [_vx, _vy, _vz];
 
         _bomb = "Bomb" createVehicle _posm;
         _bomb setPos _posm;
         _bomb setDamage 1;         
         _radio setDamage 1;
         Sleep 0.1;
         deleteVehicle _bomb;
         deleteVehicle _radio;
         (_this select 1) setDamage 1;
         _bomb1 = "Sh_120_SABOT" createVehicle _posm;
         _bomb1 setPos _posm;
         _bomb1 setVectorUp[_ux, _uy, _uz];
         _bomb1 setVectorDir[sin(_ang), cos(_ang), sin(_angv)];
         _bomb1 setVelocity _vvel;
         mando_sadarm_shell = _bomb1;
         
         publicVariable "mando_sadarm_shell";
         Sleep 0.01;

         _bomb2 = "Sh_120_HE" createVehicle _posm;
         _bomb2 setPos _posm;
         _bomb2 setVectorUp[_ux, _uy, _uz];
         _bomb2 setVectorDir[sin(_ang), cos(_ang), sin(_angv)];
         _bomb2 setVelocity _vvel;
         while {alive _bomb1 || alive _bomb2} do
         {
            if (alive _bomb1) then 
            {
               _lastpos = getPosASL _bomb1;
               _bomb1 setVectorUp[_ux, _uy, _uz];
               _bomb1 setVectorDir[sin(_ang), cos(_ang), sin(_angv)];
               _bomb1 setVelocity _vvel;
            };
            if (alive _bomb2) then 
            {
               _bomb2 setVectorUp[_ux, _uy, _uz];
               _bomb2 setVectorDir[sin(_ang), cos(_ang), sin(_angv)];
               _bomb2 setVelocity _vvel;
            };
            Sleep 0.002;
         };
         _bomb = "Bomb" createVehicle _lastpos;
         _bomb setPos _lastpos;
         _bomb setDamage 1;
         Sleep 0.1;
         deleteVehicle _bomb;

         Sleep 3;
         deleteVehicle _log;
      };
      Sleep 1;
   };
};


while {(!isNull _radio) && ((getPosASL _radio select 2) > 3)} do
{
   _radio setPos (_radiochute modelToWorld [0,0,-1]);
   Sleep 0.01;
};

if (!isNull _radio) then
{
   if ((getPosASL _radio select 2) < 3) then
   {
      _bomb = "Bomb" createVehicle getPosASL _radio;
      _bomb setPos getPosASL _radio;
      _bomb setDamage 1;
      _radio setDamage 1;
      Sleep 0.5;
      deleteVehicle _bomb;   
      deleteVehicle _radio;
   };
};