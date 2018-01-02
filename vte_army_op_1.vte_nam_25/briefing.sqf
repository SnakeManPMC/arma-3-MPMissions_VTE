waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{

		player createDiaryRecord ["Diary",["SUPPORT","Your support forces today include M252's, M109's in the <marker name='start'>Army Base</marker>, M109's in the <marker name='airbase'>Airbase</marker> and M101's in the <marker name='firebase1'>Marine</marker> firebase."]];

		player createDiaryRecord ["Diary",["TACTICAL","Use that arty to your advantage, wipe them out from standoff position."]];

		player createDiaryRecord ["Diary",["ORDERS","Alpha team <marker name='start'>start</marker> from Army base. seek and destroy <marker name='target1'>target #1</marker> objective. clear <marker name='target2'>village</marker> objective SE of Kangfang. Search <marker name='target3'>Kawala</marker> for enemy activity. seek and destroy <marker name='target4'>ruins</marker> objective. clear <marker name='target5'>village 2</marker> objective N of LZ Delta. clear <marker name='target6'>LZ Alpha</marker> N of Army Base."]];

		player createDiaryRecord ["Diary",["INTEL","Enemy forces are mostly on foot, very few enemy vehicles spotted recently."]];

		player createDiaryRecord ["Diary",["GEN SITREP","War is progressing nicely, we are conducting operations all over the region."]];

		player createDiaryRecord ["Diary",["Diary","Another miserable and goddamn hot day in NAM..."]];

		player createDiaryRecord ["Diary",["Mission","Alpha team <marker name='start'>start</marker> from Army base."]];

// 6
		PMC_objective6 = player createSimpleTask ["Clear LZ Alpha"];
		PMC_objective6 setSimpleTaskDescription ["Clear <marker name='target6'>LZ Alpha</marker> N of Army Base.", "Clear LZ Alpha", "Clear LZ Alpha"];
		PMC_objective6 setSimpleTaskDestination (getMarkerPos "target6");

// 5
		PMC_objective5 = player createSimpleTask ["Clear village 2"];
		PMC_objective5 setSimpleTaskDescription ["Clear <marker name='target5'>village 2</marker> objective N of LZ Delta.", "Clear village 2", "Clear village 2"];
		PMC_objective5 setSimpleTaskDestination (getMarkerPos "target5");

// 4
		PMC_objective4 = player createSimpleTask ["Destroy ruins"];
		PMC_objective4 setSimpleTaskDescription ["Seek and destroy <marker name='target4'>ruins</marker> objective.", "Destroy ruins", "Destroy ruins"];
		PMC_objective4 setSimpleTaskDestination (getMarkerPos "target4");

// 3
		PMC_objective3 = player createSimpleTask ["Search Kawala"];
		PMC_objective3 setSimpleTaskDescription ["Search <marker name='target3'>Kawala</marker> for enemy activity.", "Search Kawala", "Search Kawala"];
		PMC_objective3 setSimpleTaskDestination (getMarkerPos "target3");

// 2
		PMC_objective2 = player createSimpleTask ["Capture village 2"];
		PMC_objective2 setSimpleTaskDescription ["Clear <marker name='target2'>village</marker> objective SE of Kangfang.", "Clear Kangfang", "Clear Kangfang"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target2");

// 1
		PMC_objective1 = player createSimpleTask ["Capture village 1"];
		PMC_objective1 setSimpleTaskDescription ["Seek and destroy <marker name='target1'>target #1</marker> objective.", "Destroy target 1", "Destroy target 1"];
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
