
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	[] execVM "briefing.sqf";
};

enableSaving [ false, false ];
