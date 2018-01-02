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
	["PMC_objective1", "Clear Obj 1", "You need to clear <marker name='target1'>Objective 1</marker> from any enemy presence.", true, []],
	["PMC_objective2", "Clear Obj 2", "You need to clear <marker name='target2'>Objective 2</marker> from any enemy presence.", true, []],
	["PMC_objective3", "Clear Obj 3", "You need to clear <marker name='target3'>Objective 3</marker> from any enemy presence.", true, []],
	["PMC_objective4", "Clear Obj 4", "You need to clear <marker name='target4'>Objective 4</marker> from any enemy presence.", true, []]
],[
	["Mission", "Your ARVN force starts at <marker name='start'>south east edge</marker> of the city. Proceed and clear all four objectives in the city."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
