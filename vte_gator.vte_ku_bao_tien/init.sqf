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
};

// setup briefing

[[
  ["task1", "Village Du Dap", "Clear <marker name='target1'>Du Dap</marker> village objective of any NVA presence."],
  ["task2", "Village Mud Phuc", "Clear <marker name='target2'>Mud Phuc</marker> village objective of any VC presence."],
  ["task3", "Village Ting Pong", "Clear <marker name='target3'>Ting Pong</marker> village objective of any NVA presence."]
],[
  ["Mission", "Your base is located at FOB Gator, from here you are tasked to clear out three enemy villages in the region."],
  ["Credits", "Vietnam: The Experience. Mission by Snake Man."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
