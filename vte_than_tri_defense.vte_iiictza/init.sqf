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
],[
	["Orders", "Todays <marker name='target1'>target</marker> is the base ahead. Keep it clear of enemy forces which are advancing to your position."],
	["Credits", "Addons used: Vietnam: The Experience.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
