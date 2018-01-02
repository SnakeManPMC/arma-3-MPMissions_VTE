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
	["PMC_objective1", "Patrol the objective 1", "<marker name='target1'>Objective 1</marker>", true, []],
	["PMC_objective2", "Patrol the objective 2", "<marker name='target2'>Objective 2</marker>", true, []],
	["PMC_objective3", "Patrol the objective 3", "<marker name='target3'>Objective 3</marker>", true, []],
	["PMC_objective4", "Patrol the objective 4", "<marker name='target4'>Objective 4</marker>", true, []]
],[
	["Orders", "US <marker name='start'>start</marker> in HQ, patrol the reqions four objectives.<br/><marker name='target1'>Objective 1</marker><br/><marker name='target2'>Objective 2</marker><br/><marker name='target3'>Objective 3</marker><br/><marker name='target4'>Objective 4</marker>"],
	["Credits", "Addons used: Vietnam: The Experience.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];

/*
	reference

for opfor dead trigger add:
["PMC_objective1", "succeeded"] call SHK_Taskmaster_Upd;

*/
