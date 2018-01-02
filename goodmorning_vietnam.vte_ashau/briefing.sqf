waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
// 6
		player createDiaryRecord ["Diary",["SIGNALS", "ther is a direct radio link back to HQ at the airfeild, the mission shall be co-ordinated from this location and any relevent support will be requested.additionaly HQ wants to know if thier is any contacts so should be informed via radio if there is such an incident."]];

// 5
		player createDiaryRecord ["Diary",["COMMAND", "ACTIONS ON<br/><br/>contact<br/><br/>reaction to enemy fire- get down supress enemy and call up on the radio to inform command at the airfeild, they will send the APCs in support which will then move to the extraction point. if possible the patrol will continue at this point.<br/><br/>man-down<br/><br/>this will be delt with by the platoon medics. ther is also a medical team onboard the APC but they cannot move into the area before it is clear of VC. CAS-EVAC will not happen untill the mission is completed.<br/><br/>comms failure<br/><br/>the mission will be aborted if their are any communication problems."]];

// 4
		player createDiaryRecord ["Diary",["EXECUTION", "1 and 2 section will deploy at the old church by foot allong with the armoured support.<br/><br/>1 section shall patrol off first with 2 section following on.<br/><br/>both sections shall patrol the 2 designated villages and make contact with the locals<br/><br/>everyone will then extract on the north road via APC."]];

// 3
		player createDiaryRecord ["Diary",["MISSION", "your squads mission is to patrol the villages and make contact with the locals, this is in order to establish a relationship with the population , be prepared to engage any VC in the area to secure the villages and make the villages feel helped and safe."]];

// 2
		player createDiaryRecord ["Diary",["SITUATION", "friendly forces<br/><br/>your section will be the assualting section with 2 section in a support role, there are also APC whick can be called on if a contact is initiated. you are operating just west of the airfeild and infatry HQ. there are no known friendly forces operating in your area of ops but there are a few civilains left in the villages.<br/><br/>enemy forces<br/><br/>the enemy forces are of an unknown size and location, we do not expect to get a contact on this patrol but their is a high posibility, hence the APC support. the enemy have high moral, good equipment and are highly trained and motivated and usualy operate in sections of around 4 men but have been known to number as many as 20 for perticularly large attacks.<br/><br/>commanders intent (platoon)<br/><br/>the commanders intent at platoon level as to patrol the villages and local area to rid the area of VC and take part in 'hearts and minds' ops on the local population to get them on side to take out the VC.<br/><br/>commanders intent (brigade level)<br/><br/>the  brigade commanders intent is to set up an secure a command base around the airfeild and set up a buffer zone to remove the VC from attacking range of the airfeild."]];

// 1
		player createDiaryRecord ["Diary",["GROUND", "mainly secondary jungle with villages and farmland. expect heavy vegetation and paddy feilds around the villages.there are a few well used tracks in the area which should make patroling easyer."]];

// tasks

// 3
		PMC_objective_blufor3 = player createSimpleTask ["Kill VC"];
		PMC_objective_blufor3 setSimpleTaskDescription ["Hunt down any remaining VC", "Kill VC", "Kill VC"];
		//PMC_objective_blufor3 setSimpleTaskDestination (getMarkerPos "target3");

// 2
		PMC_objective_blufor2 = player createSimpleTask ["Patrol 2nd village"];
		PMC_objective_blufor2 setSimpleTaskDescription ["Patrol second village and talk to locals", "Patrol 2nd village", "Patrol 2nd village"];
		//PMC_objective_blufor2 setSimpleTaskDestination (getMarkerPos "target2");

// 1
		PMC_objective_blufor1 = player createSimpleTask ["Patrol 1st village"];
		PMC_objective_blufor1 setSimpleTaskDescription ["Patrol 1st village", "Patrol 1st village", "Patrol 1st village"];
		//PMC_objective_blufor1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective_blufor1;

//due to your efforts the locals feel more secure and have decided to help the americans
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
