
// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	player setVariable ["BIS_noCoreConversations", true];

	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

	[] execVM "briefing.sqf";
};

enableSaving [ false, false ];
