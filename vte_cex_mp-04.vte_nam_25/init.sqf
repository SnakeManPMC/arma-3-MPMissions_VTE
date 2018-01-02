PMCHQ=[West,"HQ"];
[] execVM "briefing.sqf";

[[
  ["PMC_objective1","Clear ruins","Clear <marker name='target1'>ruins</marker>.", true, []],
  ["PMC_objective2","Clear Singha","Clear <marker name='target2'>Singha</marker>.", true, []],
  ["PMC_objective3","Clear City 1","Clear <marker name='target3'>City 1</marker>.", true, []],
  ["PMC_objective4","Clear Kangfang","Clear <marker name='target4'>Kangfang</marker>.", true, []],
  ["PMC_objective5","Clear Tinman","Clear <marker name='target5'>Tinman</marker>.", true, []],
  ["PMC_objective6","Clear Mahky","Clear <marker name='target6'>Mahky</marker>.", true, []],
  ["PMC_objective7","Clear POW Camp","Clear <marker name='target7'>POW Camp</marker>.", true, []],
  ["PMC_objective8","Clear Lay","Clear <marker name='target8'>Lay</marker>.", true, []],
  ["PMC_objective9","Clear Kaung","Clear <marker name='target9'>Kaung</marker>.", true, []]
],[
	["Credits","Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
