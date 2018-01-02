

private ["_PMC_MakeAttackInfNVA","_respawnpoint","_targetpoint","_waypointRanPosit","_sleeptime"];
if (!isServer) exitWith{};

private
[
	"_PMC_MakeAttackInfNVA",
	"_respawnpoint",
	"_targetpoint",
	"_waypointRanPosit"
];

_respawnpoint = getPosASL (_this select 0);

// random sleep time
_sleeptime = (5 + random 2);

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
	sleep _sleeptime;
	//player sidechat format["NVA units: %1", (EAST countSide (list pmc_list))];
};
