// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// create the actual zone markers and triggers
	[500, 120] execVM "PMC\PMC_Create_Zones.sqf";

	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

	player setVariable ["BIS_noCoreConversations", true];
};

[[
	["PMC_obj_columbus","Capture LZ Columbus","Capture <marker name='markerTask1'>LZ Columbus</marker> from enemy forces.", true, ["markerTask1", getPosASL pmc_2]],
	["PMC_obj_albany","Capture LZ Albany","Capture <marker name='markerTask2'>LZ Albany</marker> from enemy forces.", true, ["markerTask2", getPosASL pmc_27]],
	["PMC_obj_xray","Capture LZ X-Ray","Capture <marker name='markerTask3'>LZ X-Ray</marker> from enemy forces.", true, ["markerTask3", getPosASL pmc_32]],
	["PMC_obj_hill460","Capture hill 460","Capture <marker name='markerTask4'>hill 460</marker> from enemy forces.", true, ["markerTask4", getPosASL pmc_49]]
],[
	["Gen. Sitrep", "Army units are manning Plei Me SF base, NVA/VC forces are operating in the area.<br/><br/>Mission ends when specificed number of KIA's have reached (all sides).<br/><br/>Mission date: Nov 3rd, time: up to squad leader.<br/><br/>Sunrise 0530hrs, sunset 1830hrs."],
	["Intel", "NVA doesn't seem to have any armor in the area or heavy machine gun emplacements. But, they are often wrong..."],
	["Tactical", "Reinforcements are sent to the mainland from the airbase close by using helicopters.<br/><br/>Use your support assets to your advantage."],
	["Orders", "You need to capture LZ Columbus, LZ X-Ray, LZ Albany and Hilltop 460, then reinforcements can land on these locations.<br/><br/>Try to gain control of the area, neutralize all NVA/VC presence."],
	["Support", "You have 81mm mortars located in Plei Me SF base, use Radio (0-0-1) to call them up.<br/><br/>M101 artillery is on airbase, use Radio (0-0-2) to call them up. <br/><br/>Airsupport is also available on radio (0-0-3).<br/><br/>Usage: use radio, then map click."],
	["Diary", "Lot of KIA's huh, cool..."],
	["Credits","Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

/*
pmc_briefing_text = format["Reach %1 KIA's", PMC_VictoryCondition];
PMC_objective10 = player createSimpleTask [ pmc_briefing_text ];
PMC_objective10 setSimpleTaskDescription [ pmc_briefing_text, pmc_briefing_text, pmc_briefing_text ];
*/

enableSaving [ false, false ];
