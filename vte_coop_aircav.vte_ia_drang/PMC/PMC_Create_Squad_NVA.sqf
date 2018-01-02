/*

	Creates simple NVA group with killed/group eventhandlers attached, no waypoints

Syntax:
[_pos] execVM "PMC\PMC_Create_Squad_NVA.sqf";

Requires:
PMC\PMC_killed.sqf
PMC\PMC_groupRecycle.sqf

Returns:
Group

*/

PMC_Create_Squad_NVA =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];
	
	_respawnpoint = getPosASL (_this select 0);
	
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"VTE_NVAofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_NVArto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"VTE_NVArpg" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_NVAmedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;
	
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";
	
	PMC_cu = PMC_cu + 9;
	publicVariable "PMC_cu";
	
	_grp
};
