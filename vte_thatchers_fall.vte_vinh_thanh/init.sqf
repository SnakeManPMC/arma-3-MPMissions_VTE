// on server we run...
if (isServer) then
{
};

[[
  ["PMC_objective1","Capture Firebase Thatcher","Capture <marker name='usa'>Firebase Thatcher</marker>.", true, ["pillu", getMarkerPos "usa"]]
],[
  ["Mission","You and your comrades start at <marker name = 'start'>jungle just south</marker> of your objective. Your task is the destroy the filthy amerikansk in their precious firebase."],
  ["Credits","Mission by PMC"]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
