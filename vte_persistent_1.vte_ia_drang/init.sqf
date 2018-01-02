
// on server we run...
if (isServer) then
{
	// PMC war script
	[] execVM "PMC\PMC_init.sqf";
}
// on clients we run...
else
{
	// create briefing objectives
	[] execVM "briefing.sqf";

	// debug for clients
	[] execVM "PMC\PMC_debug.sqf";
};

enableSaving [ false, false ];
