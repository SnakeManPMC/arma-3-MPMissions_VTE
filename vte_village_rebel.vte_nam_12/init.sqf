if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
	
	player setVariable ["BIS_noCoreConversations", true];
	removeAllWeapons player;
};

// setup briefing
[[
	["PMC_objective1", "Orders", "You village rebel <marker name='start'>start</marker> in the jungle. Seek out weapons and kill all your enemies."]
],[
	["Credits", "Addons used: Vietnam: The Experience.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
