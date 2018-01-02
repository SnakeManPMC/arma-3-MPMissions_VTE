waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["TACTICAL","OK well the ricepaddies are a killzone, you'd be nuts to go through that, but hey its up to you, maybe the gooks dont expect us coming from there."]];

		player createDiaryRecord ["Diary",["ORDERS","Alpha team <marker name='start'>start</marker> from hilltop, clear the NVA held <marker name='target1'>village</marker> objective which is west side of the rice paddies. The local villages are run off from there so you are free to engage all contacts. Watch the terrain around you, intel thinks the enemy has some reinforcements in the closeby area.<br/><br/>Good luck."]];

		player createDiaryRecord ["Diary",["INTEL","We are looking NVA and VC activity on the village, its been reported that they also have some backup in the area. So watch your six."]];

		player createDiaryRecord ["Diary",["GEN SITREP","Our operations are continuing rapidly in this sector, we are moving forward in several positions today against the NVA and VC forces. Hopefully we can gain some of the local populations trust so we can gather more intel for the upcoming days."]];

		player createDiaryRecord ["Diary",["Diary","Finally my squad gets to see some action, its about time. Now lets see how we perform under fire..."]];

		PMC_objective1 = player createSimpleTask ["Capture village"];
		PMC_objective1 setSimpleTaskDescription ["Alpha team <marker name='start'>start</marker> from hilltop, clear the NVA held <marker name='target1'>village</marker> objective.", "Capture village", "Capture village"];
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
