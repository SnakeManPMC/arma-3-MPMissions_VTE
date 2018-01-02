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
	["PMC_objective1", "Kill Americans", "Assault in <marker name='meeting'>meeting</marker> engagement the american capitalist pigs and kill them all.", EAST, []],
	["PMC_objective2", "Kill Gooks", "Get into <marker name='meeting'>meeting</marker> engagement with the gooks and neutralize them.", WEST, []]
],[
	["Mission", "Meeting engagement, two sides collide in the humid jungle. Show no mercy."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
