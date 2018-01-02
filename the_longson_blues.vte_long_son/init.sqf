
[] execVM "briefing.sqf";
onPlayerConnected {publicVariable "end1"};
onPlayerConnected {publicVariable "end2"};
setTerrainGrid 12.5;
setViewDistance 800;
end1 = false;
end2 = false;
publicVariable "end1";
publicVariable "end2";
titleCut ["","BLACK IN", 3];

if (isServer) then
{
	[] execVM "cleanup.sqf";
};

enableSaving [ false, false ];
