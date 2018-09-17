
[] execVM "briefing.sqf";

if (isServer)then {
	
     []execVM "cleanup.sqf";
};

enableSaving [ false, false ];

/*; init.sqs
setViewDistance 300;
setTerrainGrid 6.25;*/
hint "**View Distance Set 300m**\n\n**Terrain Set High**";
[] exec "rearm.sqf";
end1=false;end2=false;
titleCut ["","BLACK IN", 3];
if (!local server) exitWith {};
