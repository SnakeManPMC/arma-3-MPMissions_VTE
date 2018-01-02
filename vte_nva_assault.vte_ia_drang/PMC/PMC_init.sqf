
// affiliated with the ending trigger after lot of loop
ReadyToEnd = false;
publicVariable "ReadyToEnd";

waitUntil
{
	(!isNil {eastlist});
};

PMC_PlayerRespawns = 0;
publicVariable "PMC_PlayerRespawns";

[] execVM "PMC\PMC_war.sqf";
[] execVM "PMC\PMC_flares.sqf";
