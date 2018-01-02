
// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

	player setVariable ["BIS_noCoreConversations", true];

	// local to player(s)
	// place the SF team to the downed helo
	{
		_x setPosASL [(getPosASL downed_helo select 0) + 50, (getPosASL downed_helo select 1) + 50, 0];
		sleep 0.01;
	} forEach units sfteam;

	// move NVA alert forces into the helo
	{
		_x setPosASL [(getPosASL downed_helo select 0) - 250, (getPosASL downed_helo select 1) - 250, 0];
		sleep 0.01;
	} forEach units nvainf1;
	leader nvainf1 move getPosASL downed_helo;
};

enableSaving [ false, false ];

// wait little bit and then make the tasks
sleep 3;

[[
  ["task1", "Reach nearest FOB", "Reach nearest FOB, either <marker name='fob1'>FOB Rocker</marker> or <marker name='fob2'>FOB Demon</marker> depending on your crash site location."]
],[
  ["Mission", "CH-53 you were riding just crashed. Escape enemy forces and reach the nearest FOB."],
  ["Credits", "Vietnam: The Experience. Mission by Snake Man."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

hint "Briefing updated.";
