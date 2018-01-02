/*

	PMC NAM Command
	main war looper script

*/

private ["_a","_ran","_tlogic","_PMC_temptargets","_targetNum","_targetpoint","_respawnpoint","_PMC_MakeGuardInfOPFOR","_PMC_MakePatrolInfOPFOR","_PMC_SelectOPFORStartPosit","_waypointRanPosit","_grp","_EnemyForces"];

_PMC_MakeGuardInfOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuardInfOPFOR.sqf";
_PMC_MakePatrolInfOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakePatrolInfOPFOR.sqf";
_PMC_SelectOPFORStartPosit = compile preprocessFileLineNumbers "PMC\PMC_SelectOPFORStartPosit.sqf";

// select target location
_targetNum = count PMC_targets;
_PMC_temptargets = [];
_PMC_temptargets = PMC_targets;
_waypointRanPosit = 100;

// send out the editor groups
_targetpoint = getPosASL (PMC_targets select (floor random _targetNum));
_grp = vcinf1;
_grp setbehaviour "AWARE";
_grp setcombatmode "RED";
_grp setspeedmode "NORMAL";
_grp setformation "WEDGE";
_grp addWaypoint [_targetpoint, _waypointRanPosit];
[_grp, 1] setWaypointBehaviour "AWARE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "FULL";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "GUARD";
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;

// create units
_a = 0;
while { _a < 5 || _a > (count PMC_targets) } do
{
	_a = _a + 1;

	// choose random posit, then remove it from selection so next time
	// we choose different random posit, no two units go in same location.
	_ran = (floor random _targetNum);
	_tlogic = (_PMC_temptargets select _ran);
	_PMC_temptargets = _PMC_temptargets - [_tlogic];
	_targetNum = _targetNum - 1;
	_targetpoint = getPosASL _tlogic;

	// choose one of the random starting locations
	_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
	_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;
	sleep 1;
};

_targetNum = count PMC_targets;
// how many enemies to create
_EnemyForces = 200;

// never ending loop to create units
while {true} do
{
	_ran = (floor random _targetNum);
	_tlogic = (PMC_targets select _ran);
	_targetpoint = getPosASL _tlogic;

	// hmm wonder about the syntax ;)
	waitUntil
	{
		sleep 2;
		(count PMC_opfor_list < _EnemyForces);
	};

	if (count PMC_opfor_list < _EnemyForces) then
	{
		_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
		[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
		_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
		[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;
	};
	// just to relax a bit
	sleep 5;
};
