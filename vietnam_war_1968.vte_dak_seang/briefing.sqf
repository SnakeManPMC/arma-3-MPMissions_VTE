waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Obj1."]];
		PMC_objective1 = player createSimpleTask ["Obj1"];
		PMC_objective1 setSimpleTaskDescription ["You'll be <marker name='Insert'>inserted</marker> into the mission area by helicopter. Proceed to the <marker name='Base'>enemy base</marker> and clear the area of all hostile presence. Sources indicate that the enemy might call in reinforcements when attacked, so be prepared.<br/><br/>Once the area is cleared, locate the POWs and escort them to the <marker name='Extract'>extraction zone</marker>.<br/><br/>Select your team's weapon loadout in the Gear section.","Hmm","Hmm"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "base");
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
