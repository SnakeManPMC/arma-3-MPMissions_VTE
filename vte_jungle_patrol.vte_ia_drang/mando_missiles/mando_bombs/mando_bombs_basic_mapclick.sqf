/********************************************************************************* 
   Mando_bombs_basic_mapclick.sqf v1.0
   by Mandoble, March 2008

   Purpose:
      Calls for bomb run or air support (free fall or SADARM) by clicking coordinates on the map.

      Note: This script requires the presence of mando_bombs.sqf, mando_bombs_effects.sqf, mando_bombs_sadarm.sqf, mando_basic_airsupport.sqf and mando_basic_bombrun.sqf.

   Parameters:
      Plane type to perform the attack.
      Mission type: true = air support, false = single bomb run.
      Attack type: true = SADARM, false = free fall bombs.


   Example:
      res = ["AV8B2", false, false]execVM"mando_missiles\mando_bombs\mando_bombs_basic_mapclick.sqf"

*********************************************************************************/

mando_airsupport_type = _this select 0;
mando_sadarm_requested = _this select 2;
if (_this select 1) then
{
   onMapSingleClick "res = [_pos, objNull, side player, 3, mando_sadarm_requested, mando_airsupport_type]execVM""mando_missiles\mando_bombs\mando_basic_airsupport.sqf""; onMapSingleClick '';true;";

   titleText[">>> Open the map and click over it for air support coordinates", "PLAIN DOWN"];
}
else
{
   onMapSingleClick "res = [_pos, objNull, side player, mando_sadarm_requested, mando_airsupport_type]execVM""mando_missiles\mando_bombs\mando_basic_bombrun.sqf"";  onMapSingleClick '';true;";

   titleText[">>> Open the map and click over it for attack coordinates", "PLAIN DOWN"];
};

