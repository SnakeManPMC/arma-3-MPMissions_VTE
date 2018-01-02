
if (!isServer) exitWith{};

private
[
	"_PMC_MakeAttackInfNVA",
	"_respawnpoint",
	"_targetpoint",
	"_waypointRanPosit"
];

_respawnpoint = getPosASL (_this select 0);

_PMC_MakeAttackInfNVA = compile preProcessFileLineNumbers "PMC\PMC_Create_Attack_NVA.sqf";

waitUntil
{
	(count (list pmc_list) > 0);
};

_targetpoint = getPosASL pmc_us_start;
_waypointRanPosit = 100;

while {true} do
{
	if((EAST countSide (list pmc_list)) < 50) then
	{
		[_targetpoint, _respawnpoint, _waypointRanPosit] call _PMC_MakeAttackInfNVA;
	};
	sleep 5;
	//player sidechat format["NVA units: %1", (EAST countSide (list pmc_list))];
};
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
