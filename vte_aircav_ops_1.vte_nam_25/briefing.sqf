waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Support","There are some supply vehicles in <marker name='usmc'>USMC base</marker> and <marker name='firebase'>firebase</marker> if you need them."]];

		player createDiaryRecord ["Diary",["Mission","Your AirCav forces <marker name='start'>start</marker> in the HQ. Clear all the objcetives.<br/><br/>You cannot do this from the air, you need to have soldiers feet on the ground to sweep the areas.<br/><br/>As bonus objective, try to find the NVA HQ in this area and neutralize it."]];

// 6
		PMC_objective6 = player createSimpleTask ["Neutralize NVA HQ"];
		PMC_objective6 setSimpleTaskDescription ["As bonus objective; neutralize NVA HQ.", "Neutralize NVA HQ", "Neutralize NVA HQ"];
		PMC_objective6 setSimpleTaskDestination (getMarkerPos "target5");

// 5
		PMC_objective5 = player createSimpleTask ["Capture Hpawngtut"];
		PMC_objective5 setSimpleTaskDescription ["Capture <marker name='target5'>Hpawngtut</marker>.", "Capture Hpawngtut", "Capture Hpawngtut"];
		PMC_objective5 setSimpleTaskDestination (getMarkerPos "target5");

// 4
		PMC_objective4 = player createSimpleTask ["Capture LZ Tango"];
		PMC_objective4 setSimpleTaskDescription ["Capture <marker name='target4'>LZ Tango</marker>.", "Capture LZ Tango", "Capture LZ Tango"];
		PMC_objective4 setSimpleTaskDestination (getMarkerPos "target4");

// 3
		PMC_objective3 = player createSimpleTask ["Capture LZ Alpha"];
		PMC_objective3 setSimpleTaskDescription ["Capture <marker name='target3'>LZ Alpha</marker>.", "Capture LZ Alpha", "Capture LZ Alpha"];
		PMC_objective3 setSimpleTaskDestination (getMarkerPos "target3");

// 2
		PMC_objective2 = player createSimpleTask ["Capture village 1"];
		PMC_objective2 setSimpleTaskDescription ["Capture <marker name='target2'>village 1</marker>.", "Capture village 1", "Capture village 1"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target2");

// 1
		PMC_objective1 = player createSimpleTask ["Capture city 1"];
		PMC_objective1 setSimpleTaskDescription ["Capture <marker name='target1'>city 1</marker>.", "Capture city 1", "Capture city 1"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
