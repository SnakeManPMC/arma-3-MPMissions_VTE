[] execVM "briefing.sqf";

anz_fire=false;

[] exec "westari\ari.sqs";

opforwin=false;
bluforwin=false;

setViewDistance 350;
setTerrainGrid 50;

// launching the create unit scripts
if (isServer) then
{
	[] execVM "CreateUnitLoop.sqf";
};

enableSaving [ false, false ];

// light up the scenario with flares
sleep 30;
[] execVM "flare.sqf";
