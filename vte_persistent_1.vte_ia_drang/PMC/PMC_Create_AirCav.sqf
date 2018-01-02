
PMC_Create_AirCav =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};
	
	"VTE_acofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_acsquadleader" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_acsoldierrto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_acsoldiermg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"VTE_acsoldiermg_assistant" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_acsoldierm79" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_acsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_acsoldiermg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_acsoldiermg_assistant" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_acsoldiermedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_acsoldiermortar" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_acsoldiermortar" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];

	_grp
};
