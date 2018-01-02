/*

	Main war script, creates units and waypoints for them.
	Units first created and then sent on random locations.

*/

private ["_a","_grp","_PMC_MakeGuardInfBLUFOR","_PMC_MakeGuardInfOPFOR","_PMC_MakePatrolInfBLUFOR","_PMC_MakePatrolInfOPFOR","_PMC_SelectBLUFORStartPosit","_PMC_SelectOPFORStartPosit","_PMC_temptargets","_respawnpoint","_targetNum","_waypointRanPosit","_r","_t","_targetpoint","_rand","_PMC_MakeGuard_AirCav_InfBLUFOR","_PMC_MakePatrol_AirCav_InfBLUFOR","_PMC_MakeGuard_USMC_InfBLUFOR","_MaxOPFOR","_MaxBLUFOR"];

_PMC_MakeGuardInfOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuardInfOPFOR.sqf";
_PMC_MakePatrolInfOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakePatrolInfOPFOR.sqf";
_PMC_MakeGuardInfBLUFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuardInfBLUFOR.sqf";
_PMC_MakePatrolInfBLUFOR = compile preprocessFileLineNumbers "PMC\PMC_MakePatrolInfBLUFOR.sqf";

// Air Cav squads - guard mode
_PMC_MakeGuard_AirCav_InfBLUFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuard_AirCav_InfBLUFOR.sqf";

// Air Cav squads - patrol mode
_PMC_MakePatrol_AirCav_InfBLUFOR = compile preprocessFileLineNumbers "PMC\PMC_MakePatrol_AirCav_InfBLUFOR.sqf";

// USMC squads - guard mode
_PMC_MakeGuard_USMC_InfBLUFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuard_USMC_InfBLUFOR.sqf";

_PMC_SelectOPFORStartPosit = compile preprocessFileLineNumbers "PMC\PMC_SelectOPFORStartPosit.sqf";
_PMC_SelectBLUFORStartPosit = compile preprocessFileLineNumbers "PMC\PMC_SelectBLUFORStartPosit.sqf";

// select target location
_targetNum = count PMC_targets;
_PMC_temptargets = [];
_PMC_temptargets = PMC_targets;
_waypointRanPosit = 100;

// send out the editor groups
_grp = usinf1;
_targetpoint = getPosASL (PMC_targets select (floor random _targetNum));
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
	_r = (floor random _targetNum);
	_t = (_PMC_temptargets select _r);
	_PMC_temptargets = _PMC_temptargets - [_t];
	_targetNum = _targetNum - 1;
	_targetpoint = getPosASL _t;

	// choose one of the random starting locations
	_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
	_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;

	// penalty for humans to be so elite
	_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
	_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;
	sleep 1;

	// choose one of the random starting locations
	_respawnpoint = [] call _PMC_SelectBLUFORStartPosit;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfBLUFOR;
	_respawnpoint = [] call _PMC_SelectBLUFORStartPosit;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfBLUFOR;
};

_targetNum = count PMC_targets;
_MaxOPFOR = 150;
_MaxBLUFOR = 100;

// never ending loop to create units
while {true} do
{
	// choose random target position
	_r = (floor random _targetNum);
	_t = (PMC_targets select _r);
	_targetpoint = getPosASL _t;

	waitUntil
	{
		sleep 2;
		( (count list PMC_opfor_list < _MaxOPFOR) || (count list PMC_blufor_list < _MaxBLUFOR) );
	};

	if (count list PMC_opfor_list < _MaxOPFOR) then
	{
		_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
		[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
		_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
		[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;
	};

	if (count list PMC_blufor_list < _MaxBLUFOR) then
	{
		_respawnpoint = [] call _PMC_SelectBLUFORStartPosit;
		// randomize what we are creating.
		_rand = round (random 5);
		switch (_rand) do
		{
			case 0:
		    	{
				// Guard - Army
				[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfBLUFOR;
		    	};
		    	case 1:
		    	{
				// Patrol - Army
				[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfBLUFOR;
		    	};
		    	case 2:
		    	{
				// Guard - AirCav
				[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuard_AirCav_InfBLUFOR;
		    	};
		    	case 3:
		    	{
				// Patrol - AirCav
				[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrol_AirCav_InfBLUFOR;
		    	};
		    	case 4:
		    	{
		    		// Guard - USMC
		    		[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuard_USMC_InfBLUFOR;
		    	};
		};
	};
	// just to relax a bit
	sleep 30;
};
