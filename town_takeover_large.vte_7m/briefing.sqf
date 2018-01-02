waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["Situation","Situation:<br/>Today is the day of the days. There are two options: The town falls<br/>into US hands or the town remains in NVA hands.<br/>Its on you how its going to end!<br/><br/>US side: Seize the town. Unfortunately you don’t have ammo for your UH1 gunship so you should seize the airport first.<br/>Also the NVA captured a B52, you got to prevent that the NVA manages it to reach the fuel truck<br/>and refuels the B52.<br/>We are awaiting reinforcement (Various tanks) to come into the town soon, but that could be too late."]];

//obj3 Escort them to the extraction zone

		PMC_objective_blufor1 = player createSimpleTask ["Capture town hall"];
		PMC_objective_blufor1 setSimpleTaskDescription ["Capture <marker name='sdds'>town hall</marker>", "Capture town hall", "Capture town hall"];
		PMC_objective_blufor1 setSimpleTaskDestination (getMarkerPos "sdds");
		player setCurrentTask PMC_objective_blufor1;
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["Situation", "NVA/VC<br/>Hold the town and the town hall at all costs.<br/>Try to refuel the B52 and use it against the US forces before it’s too late!<br/>Also you should use mines (by the jeep mg) to hinder the US reinforcement from coming.<br/>You’re able to use mortars and I suggest you to use them!<br/>Also place snipers wherever you can, this is not going to be easy!"]];

		PMC_objective_opfor1 = player createSimpleTask ["Protect town hall"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Protect <marker name='sdds'>town hall</marker>", "Protect town hall", "Protect town hall"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "sdds");
		player setCurrentTask PMC_objective_opfor1;
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
