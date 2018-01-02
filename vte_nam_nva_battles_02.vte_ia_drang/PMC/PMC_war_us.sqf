

private ["_PMC_MakeAttackInfAirCav","_respawnpoint","_targetpoint","_waypointRanPosit","_sleeptime"];
if (!isServer) exitWith{};

private
[
	"_PMC_MakeAttackInfAirCav",
	"_respawnpoint",
	"_targetpoint",
	"_waypointRanPosit"
];

_respawnpoint = getPosASL (_this select 0);

// random sleep time
_sleeptime = (5 + random 2);

_PMC_MakeAttackInfAirCav = compile preProcessFileLineNumbers "PMC\PMC_Create_Attack_AirCav.sqf";

waitUntil
{
	(count (list pmc_list) > 0);
};

_targetpoint = getPosASL pmc_nva_start;
_waypointRanPosit = 100;

while {true} do
{
	if((WEST countSide (list pmc_list)) < 50) then
	{
		[_targetpoint, _respawnpoint, _waypointRanPosit] call _PMC_MakeAttackInfAirCav;
	};
	sleep _sleeptime;
	//player sidechat format["US units: %1", (WEST countSide (list pmc_list))];
};
