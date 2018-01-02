waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Diary","Damn VC. I'll blew all them to hell."]];

		player createDiaryRecord ["Diary",["GEN SITREP","Today we move against the NVA. We must seize the locations on this sector."]];

		player createDiaryRecord ["Diary",["INTEL","We dont have much intel on the area, we dont have any people on the ground. All we know is that there is VC and NVA down there, LZ have been scanned by OH-6's to be clear of enemy activity."]];

		player createDiaryRecord ["Diary",["ORDERS","Alpha squad <marker name='start'>start</marker> from the LZ Columbus (via Helo insert), from there proceed into the jungle <marker name='target1'>hut</marker> searching and destroying any enemy personnel or equipment found. When you're done, assault the enemy held <marker name='target2'>hill</marker> just West from the hut. Mission is accomplished when all VC is wasted from both locations."]];

		player createDiaryRecord ["Diary",["TACTICAL","Be very alert in the jungle, VC scumbags can wait under every tree down there. The hill should be heavily guarded, dont take too much risks."]];

		PMC_objective2 = player createSimpleTask ["Capture hilltop"];
		PMC_objective2 setSimpleTaskDescription ["Capture <marker name='target2'>hill</marker>", "Capture hilltop", "Capture hilltop"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target2");

		PMC_objective1 = player createSimpleTask ["Destroy hut"];
		PMC_objective1 setSimpleTaskDescription ["Search and destroy <marker name='target1'>hut</marker> in the jungle.", "Destroy hut", "Destroy hut"];
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
