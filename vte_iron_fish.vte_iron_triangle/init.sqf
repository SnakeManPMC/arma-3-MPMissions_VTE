
// if on server
if (isServer) then
{
	// description.ext mission starting parameters
	skiptime (((paramsarray select 0) - daytime + 24) % 24);
	
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
}
else
{
	// set our weather using multiplayer parameter array
	//[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
	player setVariable ["BIS_noCoreConversations", true];

	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
};

[] execVM "briefing.sqf";

enableSaving [ false, false ];
