/*********************************************************************************
   Mando_bombs_effects.sqf v1.0
   by Mandoble, March 2008

   This script is automatically executed by mando_bombs_sadarm.sqf and mando_deploy_sadarm.sqf.

*********************************************************************************/

if (!isNil "mando_sadarm_rocket_code") exitWith {};

mando_sadarm_rocket_code =
{
   private["_pos", "_barrel", "_smoketrail1", "_smoketrail2", "_exhaustlight"];
   _barrel = _this select 0;
   _pos = getPosASL _barrel;

   _exhaustlight = "#lightpoint" createVehicleLocal [0,0,0];
   _exhaustlight setLightColor [0.7,0.8,1];

   _exhaustlight setLightAmbient [0.7,0.8,1];
   _exhaustlight setLightBrightness 0.2;
   _exhaustlight LightAttachObject [_this select 0,[0,0,0]];

   [_pos] spawn
   {
      private["_particle", "_drop"];
      _particle = ["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 3, 1];
      _drop = "#particlesource" createVehicleLocal (_this select 0);
      _drop setParticleCircle [2, [0,4,0]];
      _drop setParticleParams [_particle,"","Billboard",100,3,[0,0,0],[0,0,0],2,25.50,20,1,[3,5,6],[[0.5,0.5,0.5,0],[0.5,0.5,0.4,0.5],[0.5,0.4,0.4,0.3],[0.5,0.4,0.4,0]],[1,1],0,0,"","", ""];
      _drop setDropInterval 0.05;
      Sleep 3;
      deleteVehicle _drop;
   };

   _smoketrail1 = "#particlesource" createVehicleLocal getPosASL _barrel;
   _smoketrail1 setParticleParams ["\ca\data\koulesvetlo","","Billboard",100,0.2,[0,0,0],[0,0,0],0,1.27,1.0,0.05,[1,1.5,1,0.5],[[1,0.5,0,0.6],[1,1,1,0.5],[1,1,1,0.1]],[0],0,0,"","",_barrel];
   _smoketrail1 setDropInterval 0.005;


   _smoketrail2 = "#particlesource" createVehicleLocal getPosASL _barrel;
   _smoketrail2 setParticleParams ["\ca\data\missileSmoke","","Billboard",100,1,[0,0,0],[0,0,0],0,1.27,1.0,0.05,[1,2.5,3,3.5],[[0.5,0.5,0.5,1],[0.4,0.4,0.4,0.5],[0.3,0.3,0.3,0]],[0],0,0,"","",_barrel];
   _smoketrail2 setDropInterval 0.01;

   waitUntil {(getPosASL _barrel select 2) > 99};
   deleteVehicle _smoketrail1;
   deleteVehicle _smoketrail2;
   deleteVehicle _exhaustlight;
};


mando_sadarm_shell_code =
{
   private["_posm", "_vvel", "_i", "_hvel", "_exhaustlight"];
   _posm = getPosASL (_this select 0);
   _vvel = velocity (_this select 0);

   _exhaustlight = "#lightpoint" createVehicleLocal [0,0,0];
   _exhaustlight setLightColor [0.7,0.8,1];

   _exhaustlight setLightAmbient [0.7,0.8,1];
   _exhaustlight setLightBrightness 0.2;
   _exhaustlight LightAttachObject [_this select 0,[0,0,0]];

   drop ["\ca\data\koulesvetlo","","Billboard",100,2,_posm,_vvel,0,1.27,1.0,0,[1,2],[[1,1,1,1],[1,1,1,1]],[0],0,0,"","",""];
   Sleep 0.001;
   drop ["\ca\data\koulesvetlo","","Billboard",100,2,_posm,_vvel,0,1.27,1.0,0,[1,2],[[1,1,1,1],[1,1,1,1]],[0],0,0,"","",""];


   [_posm, _vvel] spawn
   {
      private["_pos", "_dsize", "_i"];
      for [{_i=0},{_i < 50},{_i=_i+1}] do
      {
         _dsize = (50-_i)/10;
         _pos = [((_this select 0) select 0)+((_this select 1) select 0)*_i*0.005,((_this select 0) select 1)+((_this select 1) select 1)*_i*0.005,((_this select 0) select 2)+((_this select 1) select 2)*_i*0.005];
         drop ["\ca\data\missileSmoke","","Billboard",100,8,_pos,[0,0,0],0,10,7.9,0.075,[1*_dsize,2*_dsize,3*_dsize],[[0.4,0.4,0.4,1],[0.5,0.5,0.5,1],[0.6,0.6,0.6,0]], [0],0,0,"","",""];
         Sleep 0;
      };
   };

   Sleep 2;
   deleteVehicle _exhaustlight;
};


mando_sadarm_rocket = objNull;
mando_sadarm_shell = objNull;

while {true} do
{
   waitUntil {(!isNull mando_sadarm_rocket) || (!isNull mando_sadarm_shell)};
   if (!isNull mando_sadarm_rocket) then
   {
      [mando_sadarm_rocket] spawn mando_sadarm_rocket_code;
      Sleep 0.1;
      mando_sadarm_rocket = objNull;
   }
   else
   {
      [mando_sadarm_shell] spawn mando_sadarm_shell_code;
      Sleep 0.1;
      mando_sadarm_shell = objNull;
   };
};