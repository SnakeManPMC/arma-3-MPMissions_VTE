
[] execVM "briefing.sqf";

if (isServer) then {
	[] execVM "cleanup.sqf";
};

enableSaving [ false, false ];

/* init.sqs
setviewdistance 1500;
setTerrainGrid 12.5;
*/
Hint "** View Distance Set 1500m **\n\n"" Terrain Set Normal **";
end1=false;end2=false;
titleCut ["","BLACK IN", 3];
if (!local server) exitWith {};
onPlayerConnected "publicVariable ""end1"";publicVariable ""end2""";
