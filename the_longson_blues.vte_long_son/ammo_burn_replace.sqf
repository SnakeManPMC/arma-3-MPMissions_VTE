// *****************************************************
// ** ammo_burn_replace.sqf
// **
// ** Ammobox fires burn out after about 15 or 20 seconds.
//**  This script maintains a longer fire by replacing ammo
//**  box with a fresh burning one before the previous one
//**  stops burning.
// **
// ** This script is called by parent script "ammo_burn.sqf";
// *****************************************************

private ["_ammo","_dur","_obj","_pos","_dir","_start_time","_end_time"];
_ammo     = _this select 0;
_dur      = _this select 1;
_pos      = getPosASL _ammo;
_dir      = getdir _ammo;

_start_time = time;
_end_time   = _start_time + _dur;

while {time <= _end_time} do
{
   sleep 15;
   _obj = (typeof _ammo) createvehicle [0,0,.5];
   _obj setdir _dir;
   _obj setdammage 1;
   deleteVehicle _ammo;
   _obj setpos _pos;
   _ammo = _obj;
};
// Final explosion, and box disappears
_pos = getPosASL _ammo;
_obj="G_40mm_HE" createvehicle _pos;   
deleteVehicle _ammo;
     