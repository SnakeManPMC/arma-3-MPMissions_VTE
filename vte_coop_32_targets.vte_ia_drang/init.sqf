// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	[] execVM "PMC\PMC_weather.sqf";
	player setVariable ["BIS_noCoreConversations", true];

	// set respawn point and put our player there
	"respawn_west" setMarkerPosLocal getPosASL pmc_teleportPole;
	player setPos getPosASL pmc_teleportPole;
};
