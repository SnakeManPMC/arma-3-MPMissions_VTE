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
	["PMC_objective1", "Defend USMC Base", "Defend <marker name='target1'>USMC Base</marker> and prevent enemy entering there.", EAST, []],
	["PMC_objective2", "Clear USMC Base", "Clear <marker name='target1'>USMC Base</marker> from all enemy forces.", WEST, []]
],[
	["Mission", "US forces attack the USMC base while NVA/VC forces defend it.<br/><br/>Mission is accomplished when US forces seize the base or are combat ineffective."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
