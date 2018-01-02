
PMC_Create_NVA =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"VTE_NVAofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"VTE_NVAat" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_NVAaa" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	_grp
};
