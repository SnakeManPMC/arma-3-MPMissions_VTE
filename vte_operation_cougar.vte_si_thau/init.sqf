// on server we run...
if (isServer) then
{
};

[[
  ["PMC_objective1","Clear Tuyet Voi","Clear <marker name='markerTask1'>Tuyet Voi</marker> village.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2","Clear Myu De","Clear <marker name='markerTask2'>Myu De</marker> village.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3","Clear Am Ho","Clear <marker name='markerTask3'>Am Ho</marker> village.", true, ["markerTask3", getPosASL pmc_3]],
  ["PMC_objective4","Clear Dua Nho","Clear <marker name='markerTask4'>Dua Nho</marker> village.", true, ["markerTask4", getPosASL pmc_4]]
],[
  ["Mission","Your two USMC squads start at <marker name = 'start'>FOB Rocker</marker>, you are to clear out four enemy held villages. Your mission is accomplisehed when all enemy presence has been neutralized."],
  ["Credits","Mission by PMC"]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
