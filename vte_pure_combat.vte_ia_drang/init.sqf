// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	[] execVM "briefing.sqf";

	// replace this with taskmaster, and remove these two stupid tasks anyway
	// [] execVM "PMC\PMC_Create_Tasks.sqf";

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
	["Credits","Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
