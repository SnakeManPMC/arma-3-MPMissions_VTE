comment "Team Leader Group Respawn script (1.0) by Mongoose_84/Modified by ANZAC SAS  to 'eject' ai on a dedicated server and added select weapon line to respawn at base section";

_posRespawn = _this select 0;
_distMax = _this select 1;
_respawnedWeapons = _this select 2;
_respawnedMagazines = _this select 3;

_members = units group player;
_newUnit = ObjNull;
_distNewUnit = -1;
_posIVNew = 4;
_vehicleNew = ObjNull;


group player selectLeader player;

for [{_x = 0}, {_x < count _members}, {_x = _x + 1}] do
{
 _unitX = _members select _x;
 if (alive _unitX AND _unitX != player) then
 {
  _vehicleX = vehicle _unitX;
  _distX = (_posRespawn distance _vehicleX);
  if (_distX <= _distNewUnit OR (_distNewUnit == -1 AND (_distX <= _distMax OR _distMax <= 0))) then
  {
   if (_vehicleX == _unitX) then
   {
    _newUnit = _unitX;
    _distNewUnit = _distX;
    _posIVNew = -1;
   }
   else
   {
    _posIVX = -1;
    if (commander _vehicleX == _unitX) then
    {
     _posIVX = 0;
    }
    else
    {
     if (driver _vehicleX == _unitX) then
     {
      _posIVX = 1;
     }
     else
     {
      if (gunner _vehicleX == _unitX) then
      {
       _posIVX = 2;
      }
      else
      {
       if (_unitX in crew _vehicleX) then
       {
        _posIVX = 3;
       };
      };
     };
    };
    if (_posIVX != -1 AND (_distX < _distNewUnit OR _posIVX < _posIVNew)) then
    {
     _newUnit = _unitX;
     _distNewUnit = _distX;
     _posIVNew = _posIVX;
     _vehicleNew = _vehicleX;
    };
   };
  };
 };
};

if (_distNewUnit != -1) then
{
 removeAllWeapons player;
 _newMagazines = magazines _newUnit;
 _newWeapons = weapons _newUnit;
 _magazinesCount = count _newMagazines;
 _weaponsCount = count _newWeapons;

 for [{_x = 0}, {_x < _magazinesCount}, {_x= _x + 1}] do
 {
  player addMagazine (_newMagazines select _x);
 };
 for [{_x = 0}, {_x < _weaponsCount}, {_x= _x + 1}] do
 {
  player addWeapon (_newWeapons select _x);
 };
 if (_posIVNew == -1) then
 {
  player selectWeapon (primaryWeapon player);
  _newPosition = getPosASL _newUnit;
  _newDirection = getDir _newUnit;
  deleteVehicle _newUnit;
  player setPos _newPosition;
  player setDir _newDirection;
 }
 else
 {
  _newUnit action ['eject', _vehicleNew];
  deleteVehicle _newUnit;
  switch (_posIVNew) do
  {
   case 0: {player moveInCommander _vehicleNew};
   case 1: {player moveInDriver _vehicleNew};
   case 2: {player moveInGunner _vehicleNew};
   case 3: {player moveInCargo _vehicleNew};
  };
 };
}
else
{
 _weaponsCount = count _respawnedWeapons;
 _magazinesCount = count _respawnedMagazines;
 if (_weaponsCount + _magazinesCount > 0) then
 {
  removeAllWeapons player;
  for [{_x = 0}, {_x < _magazinesCount}, {_x= _x + 1}] do
  {
   player addMagazine (_respawnedMagazines select _x);
  };
  for [{_x = 0}, {_x < _weaponsCount}, {_x= _x + 1}] do
  {
   player addWeapon (_respawnedWeapons select _x);
 player selectWeapon (primaryWeapon player);
  };

 };
};