PMCHQ=[West,"HQ"];
[] execVM "briefing.sqf";

[[
  ["PMC_objective1","Defend base","Defend <marker name='start'>base</marker> from enemy attack.", true, []],
  ["PMC_objective2","Clear buildings 1","Clear <marker name='target2'>buildings 1</marker>.", true, []],
  ["PMC_objective3","Clear buildings 2","Clear <marker name='target3'>buildings 2</marker>.", true, []],
  ["PMC_objective4","Clear buildings 3","Clear <marker name='target4'>buildings 3</marker>.", true, []],
  ["PMC_objective5","Clear buildings 4","Clear <marker name='target5'>buildings 4</marker>.", true, []],
  ["PMC_objective6","Clear buildings 5","Clear <marker name='target6'>buildings 5</marker>.", true, []],
  ["PMC_objective7","Clear buildings 6","Clear <marker name='target7'>buildings 6</marker>.", true, []],
  ["PMC_objective8","Clear buildings 7","Clear <marker name='target8'>buildings 7</marker>.", true, []]
],[
	["Credits","Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
