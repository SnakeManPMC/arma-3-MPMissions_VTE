// on server we run...
if (isServer) then
{
};

[[
  ["PMC_objective1","Capture obj1","Capture <marker name='markerTask1'>obj1</marker>.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2","Capture obj2","Capture <marker name='markerTask2'>obj2</marker>.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3","Capture obj3","Capture <marker name='markerTask3'>obj3</marker>.", true, ["markerTask3", getPosASL pmc_3]]
],[
  ["Credits","Mission by PMC"]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
