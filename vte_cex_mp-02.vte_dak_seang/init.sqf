PMCHQ=[West,"HQ"];
[] execVM "briefing.sqf";

[[
  ["PMC_objective1","Defend base","Defend <marker name='start'>base</marker> from enemy attack.", true, []],

  ["PMC_objective2","Capture hill top","Capture <marker name='target2'>hill top</marker>.", true, []],
  ["PMC_objective3","Capture bridge","Capture <marker name='target3'>bridge</marker>.", true, []],
  ["PMC_objective4","Capture village","Capture <marker name='target4'>village</marker>.", true, []],
  ["PMC_objective5","Capture village 2","Capture <marker name='target5'>village 2</marker>.", true, []],
  ["PMC_objective6","Capture village 3","Capture <marker name='target6'>village 3</marker>.", true, []],
  ["PMC_objective7","Capture ruins","Capture <marker name='target7'>ruins</marker>.", true, []],
  ["PMC_objective8","Capture town","Capture <marker name='target8'>town</marker>.", true, []]
],[
	["Credits","Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
