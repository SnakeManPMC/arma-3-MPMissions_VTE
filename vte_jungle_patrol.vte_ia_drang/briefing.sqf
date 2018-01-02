waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["TACTICAL","From HQ you can call in artillery or airsupport, just dont call it too close on friendly troops. To call support assets, call in radio 0-0-1. There are lot of friendly forces operating in the region so watch your fire. Dont be a hero, remember that you're not alone in this there is alot of friendly troops in the area, if the situation gets too dicey retreat to fight an another day."]];

		player createDiaryRecord ["Diary",["ORDERS","Alpha and Bravo teams <marker name='start'>start</marker> from airbase, your orders are to hunt down enemy infantry in the jungle around the island hotspots (like <marker name='pmcmk_4'>this</marker> one). When you get control over a village, their pole will have South Vietnam flag. If the enemy forces get in there, they will staff a VietCong flag. Also the map markers turns either red (VC) or blue (US/South) accordingly. Use the Huey's in the airbase and M113 is available in the <marker name='army'>Army base</marker>, some support trucks are on the <marker name='marine'>Marine base</marker> in the north. Your mission is accomplished when over 200 enemy kills are recorded (not yours, whole regions). Good luck."]];

		player createDiaryRecord ["Diary",["INTEL","The NVA sends VC patrols somewhere from NW, we do not know any enemy bases in the western sector, but we believe there to be two or more."]];

		player createDiaryRecord ["Diary",["GEN SITREP","United States Marines Corps and Army are fighting with the VC and NVA regulars in the Ia Drang. Our Special Operations Forces are stationed in the small island south of the mainland. There has been increased enemy activity in great numbers and they target the villages all across this sector."]];

		player createDiaryRecord ["Diary",["Diary","Time to go hunt down those VC's and protect the villagers."]];

		PMC_objective_blufor1 = player createSimpleTask ["Get over 200 enemy KIA"];
		PMC_objective_blufor1 setSimpleTaskDescription ["Alpha and Bravo teams <marker name='start'>start</marker> from airbase, hunt down enemy infantry in the jungle until you get over 200 enemy KIA's in the region.", "Get over 200 enemy KIA", "Get over 200 enemy KIA"];
		//PMC_objective_blufor1 setSimpleTaskDestination (getMarkerPos "MARKER");
		player setCurrentTask PMC_objective_blufor1;

//Mission accomplished, US gets over 200 enemy KIAs.
	};

	case EAST:
	{
		player createDiaryRecord ["Diary",["TACTICAL",""]];

		player createDiaryRecord ["Diary",["ORDERS",""]];

		player createDiaryRecord ["Diary",["INTEL",""]];

		player createDiaryRecord ["Diary",["GEN SITREP",""]];

		player createDiaryRecord ["Diary",["Diary",""]];

		PMC_objective_opfor1 = player createSimpleTask ["Obj Short"];
		PMC_objective_opfor1 setSimpleTaskDescription ["Obj Long with Markers", "Obj Short", "Obj Short"];
		PMC_objective_opfor1 setSimpleTaskDestination (getMarkerPos "MARKER");
		player setCurrentTask PMC_objective_opfor1;

//Mission Failed, NVA/VC get over 200 enemy KIAs.
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};
