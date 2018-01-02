// on server we run...
if (isServer) then
{
};

[[
  ["PMC_objective1","Clear hilltop","Clear <marker name='markerTask1'>hilltop</marker> from enemy presence.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2","Capture Plei Khoie","Capture <marker name='markerTask2'>Plei Khoie</marker> village.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3","Capture Plei Bai","Capture <marker name='markerTask3'>Plei Bai</marker> village.", true, ["markerTask3", getPosASL pmc_3]]
],[
  ["Mission","Your mission is to proceed and clear hilltop of any enemy presence, then assault and capture Plei Khoie and Plei Bai villages which has seen increased enemy activity in past few days.<br/><br/>You start at <marker name='start'>LZ Columbus</marker>. No support available. Good luck."],
	["Credits","Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
