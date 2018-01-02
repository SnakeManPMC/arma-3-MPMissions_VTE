/*

	Creates simple Villagers group with killed/group eventhandlers attached, no waypoints

Syntax:
[_pos] execVM "PMC\PMC_Create_Squad_Villagers.sqf";

Requires:
PMC\PMC_killed.sqf
PMC\PMC_groupRecycle.sqf

Returns:
Group

*/

PMC_Create_Squad_Villagers =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];
	
	_respawnpoint = getPosASL (_this select 0);
	
	_grp = objNull;
	_grp = createGroup civilian;
	waitUntil {!(isNull _grp)};
	
	"VTE_villager1" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_villager2" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_villager3" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_villager4" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"VTE_villager5" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_villager6" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_villager7" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_villager8" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	
	_grp
};
