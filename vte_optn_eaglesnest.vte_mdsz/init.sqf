
if (isServer) then
{
	[] execVM "cleanup.sqf";
};

[] execVM "briefing.sqf";

/*; init.sqs
setTerrainGrid 6.25;
setViewDistance 1000;
*/
hint "**View Set 1000m**\n\n**Terrain Set High**";
[] exec "Rearm.sqf";
[] exec "zEvac.sqf";
end1=false;
end2=false;
bSupp1=false;
titleCut ["","BLACK IN", 3];
if (!local server) exitWith {};
onPlayerConnected "publicVariable ""end1""";
