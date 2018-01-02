if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

	waitUntil { !isnil "bis_fnc_init" };

	["Vietnam War", "Hysterical Shit", "10-06-12"] spawn BIS_fnc_infoText;
	cutText ["", "BLACK IN", 2];
	
	// shut the AI up!
	player setVariable ["BIS_noCoreConversations", true];
};

enableSaving [ false, false ];
