// on server we run...
if (isServer) then
{
};

[[
  ["PMC_objective1","Clear Village 1","Clear <marker name='markerTask1'>Du Dap</marker> village.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2","Clear Village 2","Clear <marker name='markerTask2'>Ting Pong</marker> village.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3","Clear Village 3","Clear <marker name='markerTask3'>Mud Phuc</marker> village.", true, ["markerTask3", getPosASL pmc_3]]
],[
  ["Mission","First Huey is on <marker name='start'>FOB Gator</marker>, second huey is on <marker name='fob_jackal'>FOB Jackal</marker>. Clear out all the objective villages from enemy presence."],
  ["Credits","Mission by PMC"]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
