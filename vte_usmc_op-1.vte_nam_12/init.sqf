player setVariable ["BIS_noCoreConversations", true];

[[
  ["PMC_objective1", "Capture objective 1", "<marker name='target1'>Objective 1</marker>.", true, ["markerTask1", getMarkerPos "target1"]],
  ["PMC_objective2", "Capture objective 2", "<marker name='target2'>Objective 2</marker>.", true, ["markerTask2", getMarkerPos "target2"]],
  ["PMC_objective3", "Capture objective 3", "<marker name='target3'>Objective 3</marker>.", true, ["markerTask3", getMarkerPos "target3"]],
  ["PMC_objective4", "Capture objective 4", "<marker name='target4'>Objective 4</marker>.", true, ["markerTask4", getMarkerPos "target4"]],
  ["PMC_objective5", "Capture objective 5", "<marker name='target5'>Objective 5</marker>.", true, ["markerTask5", getMarkerPos "target5"]],
  ["PMC_objective6", "Capture objective 6", "<marker name='target6'>Objective 6</marker>.", true, ["markerTask6", getMarkerPos "target6"]],
  ["PMC_objective7", "Capture objective 7", "<marker name='target7'>Objective 7</marker>.", true, ["markerTask7", getMarkerPos "target7"]],
  ["PMC_objective8", "Capture objective 8", "<marker name='target8'>Objective 8</marker>.", true, ["markerTask8", getMarkerPos "target8"]],
  ["PMC_objective9", "Capture objective 9", "<marker name='target9'>Objective 9</marker>.", true, ["markerTask9", getMarkerPos "target9"]],
  ["PMC_objective10", "Capture objective 10", "<marker name='target10'>Objective 10</marker>.", true, ["markerTask10", getMarkerPos "target10"]]
],[
  ["Mission", "USMC <marker name='start'>start</marker> in HQ, clear the reqions assigned to you."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
