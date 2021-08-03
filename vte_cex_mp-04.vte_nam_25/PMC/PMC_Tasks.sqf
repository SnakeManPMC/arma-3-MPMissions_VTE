
[player,["t1"],["Clear <marker name='target1'>ruins</marker>.","Clear ruins","textmarker"],(getMarkerPos "target1"),1,2,true] call BIS_fnc_taskCreate;

[player,["t2"],["Clear <marker name='target2'>Singha</marker>.","Clear Singha","textmarker"],(getMarkerPos "target2"),1,2,true] call BIS_fnc_taskCreate;

[player,["t3"],["Clear <marker name='target3'>City 1</marker>.","Clear City 1","textmarker"],(getMarkerPos "target3"),1,2,true] call BIS_fnc_taskCreate;

[player,["t4"],["Clear <marker name='target4'>Kangfang</marker>.","Clear Kangfang","textmarker"],(getMarkerPos "target4"),1,2,true] call BIS_fnc_taskCreate;

[player,["t5"],["Clear <marker name='target5'>Tinman</marker>.","Clear Tinman","textmarker"],(getMarkerPos "target5"),1,2,true] call BIS_fnc_taskCreate;

[player,["t6"],["Clear <marker name='target6'>Mahky</marker>.","Clear Mahky","textmarker"],(getMarkerPos "target6"),1,2,true] call BIS_fnc_taskCreate;

[player,["t7"],["Clear <marker name='target7'>POW Camp</marker>.","Clear POW Camp","textmarker"],(getMarkerPos "target7"),1,2,true] call BIS_fnc_taskCreate;

[player,["t8"],["Clear <marker name='target8'>Lay</marker>.","Clear Lay","textmarker"],(getMarkerPos "target8"),1,2,true] call BIS_fnc_taskCreate;

[player,["t9"],["Clear <marker name='target9'>Kaung</marker>.","Clear Kaung","textmarker"],(getMarkerPos "target9"),1,2,true] call BIS_fnc_taskCreate;

pmc_briefing_text = format["Reach %1 KIA's", PMC_VictoryCondition];

[player,["t10"],[pmc_briefing_text,pmc_briefing_text,"textmarker"],[],1,2,true] call BIS_fnc_taskCreate;
