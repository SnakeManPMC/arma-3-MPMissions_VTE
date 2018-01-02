PAPABEAR = [West,"HQ"];

// if not on the server.
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
};

[] execVM "briefing.sqf";

enableSaving [ false, false ];
