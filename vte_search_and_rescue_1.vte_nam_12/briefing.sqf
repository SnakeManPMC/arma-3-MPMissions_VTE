waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Bring pilot back home"]];
		PMC_objective1 = player createSimpleTask ["Bring pilot back home"];
		PMC_objective1 setSimpleTaskDescription ["Pilots start at <marker name='start'>US HQ</marker>, find and bring home the downed pilot.<br/><br/>Last communication indicated that hes somewhere in the mainland, sorry we have no better position at the moment.<br/><br/>(for gameplay purposes, downed pilot should NOT use any other markings for his position than signal smoke! Do not use radio sidechat, no markers on map, voice comms etc).","Bring pilot back home","Bring pilot back home"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "start");
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
