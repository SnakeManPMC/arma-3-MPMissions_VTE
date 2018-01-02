waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","There is enemy attack inbound from west, defend against it. Then counter attack and clear LZ Columbus of enemy forces."]];
		PMC_objective1 = player createSimpleTask ["Clear LZ Columbus"];
		PMC_objective1 setSimpleTaskDescription ["Clear <marker name='target1'>LZ Columbus</marker>","Clear LZ Columbus","Clear LZ Columbus"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Our forces are conducting reconnaissance to Plei Me SF base. If enemy attacks, hold LZ Columbus at any cost!"]];
		PMC_objective2 = player createSimpleTask ["Defend LZ Columbus"];
		PMC_objective2 setSimpleTaskDescription ["Defend <marker name='target1'>LZ Columbus</marker>","Defend LZ Columbus","Defend LZ Columbus"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective2;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
