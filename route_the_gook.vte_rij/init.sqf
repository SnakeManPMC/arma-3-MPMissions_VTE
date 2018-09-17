
[] execVM "briefing.sqf";

if (isServer) then {
	[] execVM "cleanup.sqf";
};

enableSaving [ false, false ];

/*; init.sqs
setTerrainGrid 6.25;
setViewDistance 1000;
*/
hint "**View Set 1000m**\n\n**Terrain Set High**";
[] execVM "Rearm.sqf";
[] execVM "zEvac.sqf";
end1=false;
end2=false;
bSupp1=False;
titleCut ["","BLACK IN", 3];
if (!local server) exitWith {};
onPlayerConnected "publicVariable ""end1""";
onPlayerConnected "publicVariable ""end2""";
