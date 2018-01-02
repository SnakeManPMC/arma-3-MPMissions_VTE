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
  ["task1", "Clear Mountain Top", "Clear <marker name='target1'>snake head mountain</marker> objective of any NVA presence."]
],[
  ["Mission", "Your base is located at FOB Demon, from here you are tasked to clear out this huge mountain top from any enemy presence."],
  ["Credits", "Vietnam: The Experience. Mission by Snake Man."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
