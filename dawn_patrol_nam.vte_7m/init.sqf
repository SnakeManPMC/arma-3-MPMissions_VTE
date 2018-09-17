
[] execVM "briefing.sqf";

if (isServer) then
{
	[] execVM "cleanup.sqf";
};

enableSaving [ false, false ];

/* 2018-09-17 Snake Man: horrible OFP values hehe
setTerrainGrid 50;
setViewDistance 1000;
*/
20 setFog 0;
20 setOverCast 0;
end1 = false;
titleCut ["","BLACK IN", 3];
if (!local server) exitWith {};

onPlayerConnected "publicVariable ""end1""";
