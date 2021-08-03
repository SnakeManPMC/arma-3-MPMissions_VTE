
pmc_briefing_text = format["Reach %1 KIA's", PMC_VictoryCondition];

[player,["t1"],[pmc_briefing_text,pmc_briefing_text,"textmarker"],[player],1,2,true] call BIS_fnc_taskCreate;

[player,["t2"],["Defend <marker name='start'>base</marker> from enemy attack.","Defend base","textmarker"],(getMarkerPos "start"),1,2,true] call BIS_fnc_taskCreate;

[player,["t3"],["Capture <marker name='target2'>hill top</marker>.","Capture hill top","textmarker"],(getMarkerPos "target2"),1,2,true] call BIS_fnc_taskCreate;

[player,["t4"],["Capture <marker name='target3'>bridge</marker>.","Capture bridge","textmarker"],(getMarkerPos "target3"),1,2,true] call BIS_fnc_taskCreate;

[player,["t5"],["Capture <marker name='target4'>village</marker>.","Capture village","textmarker"],(getMarkerPos "target4"),1,2,true] call BIS_fnc_taskCreate;

[player,["t6"],["Capture <marker name='target5'>village 2</marker>.","Capture village 2","textmarker"],(getMarkerPos "target5"),1,2,true] call BIS_fnc_taskCreate;

[player,["t7"],["Capture <marker name='target6'>village 3</marker>.","Capture village 3","textmarker"],(getMarkerPos "target6"),1,2,true] call BIS_fnc_taskCreate;

[player,["t8"],["Capture <marker name='target7'>ruins</marker>.","Capture ruins","textmarker"],(getMarkerPos "target7"),1,2,true] call BIS_fnc_taskCreate;

[player,["t9"],["Capture <marker name='target8'>town</marker>.","Capture town","textmarker"],(getMarkerPos "target8"),1,2,true] call BIS_fnc_taskCreate;
