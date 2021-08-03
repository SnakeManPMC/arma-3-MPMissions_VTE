
pmc_briefing_text = format["Reach %1 KIA's", PMC_VictoryCondition];
[player,["t0"],[pmc_briefing_text,pmc_briefing_text,"textmarker"],[],1,2,true] call BIS_fnc_taskCreate;

[player,["t1"],["Defend <marker name='start'>base</marker> from enemy attack.","Defend base","textmarker"],(getMarkerPos "start"),1,2,true] call BIS_fnc_taskCreate;

[player,["t2"],["Clear <marker name='target2'>buildings 1</marker>.","Clear buildings 1","textmarker"],(getMarkerPos "target2"),1,2,true] call BIS_fnc_taskCreate;

[player,["t3"],["Clear <marker name='target3'>buildings 2</marker>.","Clear buildings 2","textmarker"],(getMarkerPos "target3"),1,2,true] call BIS_fnc_taskCreate;

[player,["t4"],["Clear <marker name='target4'>buildings 3</marker>.","Clear buildings 3","textmarker"],(getMarkerPos "target4"),1,2,true] call BIS_fnc_taskCreate;

[player,["t5"],["Clear <marker name='target5'>buildings 4</marker>.","Clear buildings 4","textmarker"],(getMarkerPos "target5"),1,2,true] call BIS_fnc_taskCreate;

[player,["t6"],["Clear <marker name='target6'>buildings 5</marker>.","Clear buildings 5","textmarker"],(getMarkerPos "target6"),1,2,true] call BIS_fnc_taskCreate;

[player,["t7"],["Clear <marker name='target7'>buildings 6</marker>.","Clear buildings 6","textmarker"],(getMarkerPos "target7"),1,2,true] call BIS_fnc_taskCreate;

[player,["t8"],["Clear <marker name='target8'>buildings 7</marker>.","Clear buildings 7","textmarker"],(getMarkerPos "target8"),1,2,true] call BIS_fnc_taskCreate;
