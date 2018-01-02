waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Mission","Enemy AAA site is been nuisance for our aircrafts for some time, now you are asked to destroy all AAA vehicles and material on that site. Good luck."]];
		PMC_objective1 = player createSimpleTask ["Destroy AAA site"];
		PMC_objective1 setSimpleTaskDescription ["Destroy <marker name='target1'>Destroy AAA site</marker>","Destroy AAA site","Destroy AAA site"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Mission","Air Cavalry soldiers are attacking your AAA site, defend it at all cost!"]];
		PMC_objective2 = player createSimpleTask ["Defend village"];
		PMC_objective2 setSimpleTaskDescription ["Defend <marker name='target1'>AAA site</marker>","Defend AAA","Defend AAA"];
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
