
if (pmc_pilot1 == player) then
{
	pmc_pilot1 removeWeapon "itemMap";
	pmc_pilot1 removeWeapon "itemRadio";
}
else
{
	[] execVM "briefing.sqf";
};

/*

// ArmA 2 items which you can remove from the pilot.
"ItemMap",
"ItemCompass",
"ItemWatch",
"ItemRadio"
*/

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
};

enableSaving [ false, false ];
