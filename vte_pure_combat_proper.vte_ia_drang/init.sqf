
if (isServer) then
{
	[] execVM "PMC\PMC_init_server.sqf";
};
if (hasInterface) then
{
	[] execVM "PMC\PMC_init_client.sqf";
};
