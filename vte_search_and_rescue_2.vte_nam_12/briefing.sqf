waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Rescue Pilot."]];
		PMC_objective1 = player createSimpleTask ["Rescue Pilot"];
		PMC_objective1 setSimpleTaskDescription ["Pilots start at <marker name='start'>US HQ</marker>, find and bring home the downed pilot.<br/><br/>Last communication indicated that hes somewhere in the mainland, sorry we have no better position at the moment.<br/><br/>NVA/VC forces are actively searching for him, so this is race against time who will find him first. For enemy its easy, they just have to kill our pilot, we have to safely extract him back to base too.<br/><br/>(for gameplay purposes, downed pilot should NOT use any other markings for his position than signal smoke! Do not use radio sidechat, no markers on map, voice comms etc).","Rescue Pilot","Rescue Pilot"];
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Kill the pilot."]];
		PMC_objective_opfor1 = player createSimpleTask ["Kill the pilot"];
		PMC_objective_opfor1 setSimpleTaskDescription ["US helicopter has been shot down, we do not know where the crash site is, your task is to locate and kill all the survivors.<br/><br/>If the pilot is spotted near the villages, our local VC forces will notify us by radio. (FEATURE NOT IMPLEMENTED IN 05-21-09! SORRY!).<br/><br/>Use your high mobility vehicles to cover ground as quickly as you can. Coordinate your search with other squad leaders.","Kill the pilot","Kill the pilot"];
		player setCurrentTask PMC_objective_opfor1;
		"start" setMarkerTypeLocal "empty";
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
