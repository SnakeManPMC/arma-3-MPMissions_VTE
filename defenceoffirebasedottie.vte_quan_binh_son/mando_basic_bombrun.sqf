/********************************************************************************* 
   Mando_basic_bombrun.sqf v1.0
   by Mandoble, March 2008

   Purpose:
      If you dont provide an existing plane, the script creates one. The plane will perform a free fall or SADARM bomb run against indicated coordinates. If the plane was spawned by the script, it will be deleted few seconds after the bomb run ended.

   Note: This script requires the presence of mando_bombs.sqf, mando_bombs_effects.sqf and mando_bombs_sadarm.sqf.

   Parameters:
      Attack position, the position to be attacked.
      Plane to perform the attack or objNull if the script should create it.
      Friendly side, for example side player.
      SADARM attack? true or false. If false, free fall bomb run will be performed, else SADARMs will be used.
      Plane class. The class of the plane you want to be spawned by the script if second parameter is objNull.

   Example:
      res = [_pos, objNull, side player, false, "AV8B2"]execVM"mando_basic_bombrun.sqf"

      of 

      res = [_pos, my_existing_plane, side player, false, ""]execVM"mando_basic_bombrun.sqf"

*********************************************************************************/

private["_plane", "_planetype", "_sadarm", "_spawned", "_friendlyside", "_targetpos", "_spawnpos", "_group", "_driver", "_ang", "_scr", "_attackalt", "_bombtype", "_attackalt"];
_targetpos = _this select 0;
_plane = _this select 1;
_friendlyside = _this select 2;
_sadarm = _this select 3;
if (count _this > 4) then
{
   _planetype = _this select 4;
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
   _spawnpos = [(_targetpos select 0) + sin(_ang)*3500, (_targetpos select 1) + cos(_ang)*3500];
   _plane = createVehicle [_planetype, _spawnpos, [], 0, "FLY"];
   _group = createGroup _friendlyside;
   _driver = _group createUnit ["vte_acpilot",[0,0,30], [], 0, "FORM"];
   _driver setskill 0.5;
   _driver setBehaviour "AWARE";
   _driver moveInDriver _plane;
   _group selectLeader _driver;

   _spawned = true;
}
else
{
   _spawned = false;
};
driver _plane sideChat "On the way";
Sleep 1;
_scr = [_plane, _targetpos, true, [2, 0, -2], _attackalt, _bombtype]execVM"mando_bombs.sqf";
waitUntil{scriptDone _scr};
Sleep 10;
driver _plane sideChat "Leaving the area";
Sleep 2;
if (_spawned) then
{
   deleteVehicle _driver;
   deleteVehicle _plane;
   deleteGroup _group;
};