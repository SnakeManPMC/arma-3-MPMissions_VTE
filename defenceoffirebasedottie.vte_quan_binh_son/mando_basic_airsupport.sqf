/********************************************************************************* 
   Mando_basic_airsupport.sqf v1.0
   by Mandoble, March 2008

   Purpose:
      If you dont provide an existing plane, the script creates one. The plane will perform a free fall or SADARM air support against targets located within 500 from the indicated air support coordiantes. If the plane was spawned by the script, it will be deleted few seconds after support mission ends.

   Note: This script requires the presence of mando_bombs.sqf, mando_bombs_effects.sqf and mando_bombs_sadarm.sqf.

   Parameters:
      Air support center position, targets will be automatically selected within a radius of 500m.
      Plane to perform the attack or objNull if the script should create it.
      Friendly side, for example side player.
      Number of attacks in the air support mission.
      SADARM attack? true or false. If false, free fall bomb run will be performed, else SADARMs will be used.
      Plane class. The class of the plane you want to be spawned by the script if second parameter is objNull.

   Example:
      res = [_pos, objNull, side player, 3, false, "AV8B2"]execVM"Mando_basic_airsupport.sqf"


*********************************************************************************/


private["_plane", "_planetype", "_sadarm", "_mappos", "_numberofattacks", "_targetpos", "_spawnpos", "_group", "_driver", "_ang", "_scr", "_friendlyside", "_spawned", "_list1", "_list2", "_cas", "_target", "_ntarget", "_targetpos","_bombtype", "_attackalt"];
_mappos = _this select 0;
_plane = _this select 1;
_friendlyside = _this select 2;
_numberofattacks = _this select 3;
_sadarm = _this select 4;
if (count _this > 5) then
{
   _planetype = _this select 5;
};

if (_sadarm) then
{
   _bombtype = "SADARM";
   _attackalt = 200;
}
else
{
   _bombtype = "Bo_GBU12_LGB";
   _attackalt = 100;
};


if (isNull _plane) then
{
   _ang = 180;
   _spawnpos = [(_mappos select 0) + sin(_ang)*4500, (_mappos select 1) + cos(_ang)*4500];
   _plane = createVehicle [mando_airsupport_type, _spawnpos, [], 0, "FLY"];
   _group = createGroup _friendlyside;
   _driver = _group createUnit ["vte_acpilot",[0,0,30], [], 0, "FORM"];
   _driver setskill 0.5;
   _driver setCombatMode "BLUE";
   _driver setBehaviour "CARELESS";
   _driver moveInDriver _plane;
   _group selectLeader _driver; 
   _spawned = true; 
}
else
{
   _spawned = false;
};

driver _plane sideChat "On the way";

_cas = 0;
_list1 = nearestObjects [[_mappos select 0, _mappos select 1, 0], ["Car","Tank", "StaticWeapon", "Ship"], 500];
_list2 = []; 
{
   if ((side _x != _friendlyside) && (alive _x) && ((count crew _x)>0)) then
   { 
      _list2 = _list2 + [_x];
   };
} forEach _list1;

if (count _list2 > 0) then
{
   _ntarget = random (count _list2);
   _ntarget = floor _ntarget;
   _target = _list2 select _ntarget;
   _targetpos = getPosASL _target;

   while {(count _list2 > 0) && (alive _plane)} do
   {
      _scr = [_plane, _target, true, [2, 0, -2], _attackalt, _bombtype]execVM"mando_bombs.sqf";
           
      while {!scriptDone _scr} do
      {
         Sleep 1;
      };
      Sleep 10;

      _list2 = [];
      _cas = _cas + 1;                     
      if (_cas < _numberofattacks) then
      {
         {
            if ((side _x != side player) && (alive _x)) then
            { 
               _list2 = _list2 + [_x];
            };
         } forEach _list1;
      
         if (count _list2 > 0) then
         {
            _ntarget = random (count _list2);
            _ntarget = floor _ntarget;
            _target = _list2 select _ntarget;
         };
      };
   };
};

Sleep 10;
driver _plane sideChat "Leaving the area";
Sleep 2;

if (_spawned) then
{
   deleteVehicle _driver;
   deleteVehicle _plane;
   deleteGroup _group;
};
