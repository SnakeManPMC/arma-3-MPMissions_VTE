/*

	War script for "PMC LRRP defense" a shau valley

*/

private ["_a","_OPFOR_MaxCount","_p","_PMC_MakeGuardInfOPFOR","_PMC_MakePatrolInfOPFOR","_targetpoint","_VictoryCondition","_waypointRanPosit"];

// debug
PMC_debug = false;
publicVariable "PMC_debug";

// initialized variables and settings
pmc_grpnum = 0;
PMC_killedNum = 0;
publicVariable "PMC_killedNum";

// corpse removal script
PMC_corpses = [];
[50] execVM "PMC\PMC_corpses.sqf";

// count for enemy units
PMC_opfor = 0;
publicVariable "PMC_opfor";

// targets hmm
PMC_targets = [];
_targetpoint = getPosASL us_flag;

// how many enemy units are on the fight
_OPFOR_MaxCount = 100;

// how many enemy KIAs for US to win
_VictoryCondition = 1000;

// waypoint random position range
_waypointRanPosit = 200;

PMC_Choose_Respawn_Posit = compile preprocessFileLineNumbers "PMC\PMC_Choose_Respawn_Posit.sqf";

_PMC_MakeGuardInfOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuardInfOPFOR.sqf";

_PMC_MakePatrolInfOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakePatrolInfOPFOR.sqf";

// PMCTODO recommend start using PMC_targets.sqf instead?
// choose new digit for the gamelogic "pmc_*"
_a = 1;
_p = missionNamespace getVariable [format ["pmc_%1",_a], objNull];
PMC_targets = [];

// loop until we have no gamelogics left, it then should return 0.
while {!isNull _p && ((getPosASL _p) select 0) != 0} do
{
	// just make array out of the gamelogics
	PMC_targets = PMC_targets + [_p];
	
	// add one digit to our gamelogic name.
	_a = _a + 1;
	_p = missionNamespace getVariable [format ["pmc_%1",_a], objNull];
};

//_targetNum = count PMC_targets;

// create units
// first run vehicle script on the background
[] execVM "PMC\PMC_veh_attack.sqf";

// then run our normal NVA/VC creator
while {PMC_opfor < _VictoryCondition} do
{
	waitUntil
	{
		sleep 5;
		(count opforunits < _OPFOR_MaxCount);
	};

	if (count opforunits < _OPFOR_MaxCount) then 
	{
                 [_targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
		[_targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;
		PMC_opfor = PMC_opfor + 18;
		publicVariable "PMC_opfor";
	};
	sleep 5;
};

/*
we have won, 1000 enemies created, but lets give some good time before 
ending the mission. lets say... 2 minutes of fighting with the last
units on the battle.
*/ 
sleep 120;

/*
now lets wait even more, when we have less than 12 units left on the map.
this is bit risky as we dont want to have hunt down the last wanderer...
*/
waitUntil
{
	sleep 5;
	(count opforunits < 24);
};

PMC_mcomplete = true;
publicVariable "PMC_mcomplete";
