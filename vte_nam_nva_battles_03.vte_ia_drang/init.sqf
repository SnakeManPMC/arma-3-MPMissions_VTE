
if (isServer) then
{
	[] execVM "PMC\PMC_war_nva.sqf";
};

[] execVM "briefing.sqf";

enableSaving [ false, false ];
