
private
[
	"_PMC_MakeAttackInfNVA",
	"_respawnpoint",
	"_targetpoint",
	"_victoryCondition",
	"_sleeptime"
];

_respawnpoint = getPosASL PMC_nva_start;

// how many enemies to create
_victoryCondition = 100;

// random sleep time
_sleeptime = (5 + random 2);

// initialized variables and settings
PMC_killedNum = 0;
publicVariable "PMC_killedNum";

// corpse removal script
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";
publicVariable "PMC_corpses";

// count for enemy units
PMC_opfor = 0;
publicVariable "PMC_opfor";

// enemy creation function
_PMC_MakeAttackInfNVA = compile preProcessFileLineNumbers "PMC\PMC_Create_Attack_NVA.sqf";

// wait until mission starts and pmc_list trigger is usable.
waitUntil
{
	(count (list pmc_list) > 0);
};

// our US hq location.
_targetpoint = getMarkerPos "usa";

while {PMC_opfor < _victoryCondition} do
{
	if((EAST countSide (list pmc_list)) < 50) then
	{
		[_targetpoint, _respawnpoint] call _PMC_MakeAttackInfNVA;
		// add our created enemies with 9
		PMC_opfor = PMC_opfor + 9;
		publicVariable "PMC_opfor";
	};
	sleep _sleeptime;
//	player sidechat format["NVA: %1. killedNum: %2, corpses: %3, opfor: %4", (EAST countSide (list pmc_list)), PMC_killedNum, count PMC_corpses, PMC_opfor];
};

// small wait
sleep 60;

// when enemy count drops below value, end mission!
if ((EAST countSide (list pmc_list)) < 20) then
{
	PMC_mcomplete = true;
	publicVariable "PMC_mcomplete";
};
