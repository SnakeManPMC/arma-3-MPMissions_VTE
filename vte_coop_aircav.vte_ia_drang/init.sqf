// if on server
private ["_temp","_obj_pos1","_obj_pos2"];

enableSaving [ false, false ];

if (isServer) then{	[] execVM "PMC\PMC_init.sqf";}else{	[] execVM "PMC\PMC_weather.sqf";	[] execVM "PMC\PMC_Create_Tasks.sqf";	player setVariable ["BIS_noCoreConversations", true];};

// wait until array is created, somewhere ;)
waitUntil { (!isNil {PMC_Objectives_Array}); };
// then proceed to choose random stuffz!
_temp = (PMC_Objectives_Array select 0);
_obj_pos1 = getPosASL _temp;
_temp = (PMC_Objectives_Array select 1);
_obj_pos2 = getPosASL _temp;

diag_log format["Time: %1, _obj_pos1: %2, _obj_pos2: %3", time, _obj_pos1, _obj_pos2];

[[
  ["PMC_objective1","Capture objective 1","Capture <marker name='markerTask1'>objective 1</marker>.", true, ["markerTask1", _obj_pos1]],
  ["PMC_objective2","Capture objective 2","Capture <marker name='markerTask2'>objective 2</marker>.", true, ["markerTask2", _obj_pos2]]
],[
  ["Credits","Mission by PMC"]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";
