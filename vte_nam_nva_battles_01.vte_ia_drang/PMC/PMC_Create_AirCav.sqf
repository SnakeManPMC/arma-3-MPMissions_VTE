
if (!isServer) exitWith{};

private
[
	"_targetpoint",
	"_waypointRanPosit",
	"_respawnpoint",
	"_PMC_MakeGuardInfAirCav"
];

_respawnpoint = getPosASL (_this select 0);

_PMC_MakeGuardInfAirCav =
{
private ["_grp","_wp","_respawnpoint","_targetpoint","_waypointRanPosit"];
        
        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;
        
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"VTE_acofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_acsquadleader" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_acsoldierrto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_acsoldiermg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"VTE_acsoldiermg_assistant" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_acfireteamleader" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_acsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_acsoldiermg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_acsoldiermg_assistant" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_acsoldiermedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "NORMAL";
	_grp setFormation "WEDGE";

	_wp = 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "NORMAL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
};

_targetpoint = _respawnpoint;
_waypointRanPosit = 100;

//player sidechat format["Create US _targetpoint: %1", _targetpoint];

[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfAirCav;

/*
		units[]=
		{
			// Public Classes
			"VTE_acsoldier",
			"VTE_acsquadleader",
			"VTE_acfireteamleader",
			"VTE_acofficer",
			"VTE_acsoldierrto",
			"VTE_acsoldiermg",
			"VTE_acsoldiermg_assistant",
			"VTE_acsoldiermedic",
			"VTE_acpilot",
			"VTE_acsoldiermortar",
			"VTE_acsoldierm79",
			"VTE_acsoldierlaw",
			"VTE_NVAofficer",
			"VTE_NVAsoldier",
			"VTE_NVAmg",
			"VTE_NVAat",
			"VTE_NVAaa",
			"VTE_uh1"
		};
		weapons[]=
		{
			// Public Classes
			"VTE_m16a1",
			"VTE_m60",
			"VTE_m14",
			"VTE_m79",
			"VTE_law",
			"VTE_prc25",
			"VTE_m1911",
			"VTE_rpd",
			"VTE_rpg7",
			"VTE_sa7launcher",
			// protected classes
			"Throw",
			"VTE_BasePistol",
			"VTE_BaseRifle",
			"VTE_BaseMGun"
		};
*/
