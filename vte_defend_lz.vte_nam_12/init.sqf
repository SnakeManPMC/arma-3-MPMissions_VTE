
[] execVM "briefing.sqf";

if (local helo1) then
{
	[helo1,h1,75] execVM "PMC_land_helo.sqf";
};

if (local helo2) then
{
	[helo2,h2,75] execVM "PMC_land_helo.sqf";
};

if (local helo3) then
{
	[helo3,h3,75] execVM "PMC_land_helo.sqf";
};

if (local helo4) then
{
	[helo4,h4,75] execVM "PMC_land_helo.sqf";
};

enableSaving [ false, false ];
