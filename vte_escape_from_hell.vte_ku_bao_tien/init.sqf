
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
};

[[
  ["task1", "Reach nearest FOB", "Reach nearest FOB, either <marker name='fob1'>FOB Gator</marker>, <marker name='fob2'>FOB Elena</marker>, <marker name='fob3'>FOB Jolly</marker> or <marker name='fob4'>FOB Orange</marker> depending on your crash site location."]
],[
  ["Mission", "CH-53 you were riding just crashed. Escape enemy forces and reach the nearest FOB."],
  ["Credits", "Vietnam: The Experience. Mission by Snake Man."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
