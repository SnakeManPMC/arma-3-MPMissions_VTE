/*

	Village Rebel missions war script

*/

private ["_a","_ran","_tlogic","_targetNum","_targetpoint","_respawnpoint","_rand","_PMC_MakeGuardInfOPFOR","_PMC_MakePatrolInfOPFOR","_PMC_MakeGuardInfBLUFOR","_PMC_MakePatrolInfBLUFOR","_PMC_MakeGuard_AirCav_InfBLUFOR","_PMC_MakePatrol_AirCav_InfBLUFOR","_PMC_SelectOPFORStartPosit","_PMC_SelectBLUFORStartPosit","_waypointRanPosit","_grp"];

_PMC_MakeGuardInfOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuardInfOPFOR.sqf";
_PMC_MakePatrolInfOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakePatrolInfOPFOR.sqf";
_PMC_MakeGuardInfBLUFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuardInfBLUFOR.sqf";
_PMC_MakePatrolInfBLUFOR = compile preprocessFileLineNumbers "PMC\PMC_MakePatrolInfBLUFOR.sqf";

// New soldier classes setup.
_PMC_MakeGuard_AirCav_InfBLUFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuard_AirCav_InfBLUFOR.sqf";
_PMC_MakePatrol_AirCav_InfBLUFOR = compile preprocessFileLineNumbers "PMC\PMC_MakePatrol_AirCav_InfBLUFOR.sqf";
// end of new soldier classes setup.

_PMC_SelectOPFORStartPosit = compile preprocessFileLineNumbers "PMC\PMC_SelectOPFORStartPosit.sqf";
_PMC_SelectBLUFORStartPosit = compile preprocessFileLineNumbers "PMC\PMC_SelectBLUFORStartPosit.sqf";

// select target location
_targetNum = count PMC_targets;
PMC_temptargets = [];
PMC_temptargets = PMC_targets;
_waypointRanPosit = 100;

// send out the editor groups
_targetpoint = getPosASL (PMC_targets select (floor random _targetNum));
_grp = usinf1;
_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "NORMAL";
_grp setFormation "WEDGE";
_grp addWaypoint [_targetpoint, _waypointRanPosit];
[_grp, 1] setWaypointBehaviour "AWARE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "FULL";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "GUARD";
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _grp;

_targetpoint = getPosASL (PMC_targets select (floor random _targetNum));
_grp = vcinf1;
_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "NORMAL";
_grp setFormation "WEDGE";
_grp addWaypoint [_targetpoint, _waypointRanPosit];
[_grp, 1] setWaypointBehaviour "AWARE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "FULL";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "GUARD";
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _grp;

// create units
_a = 0;
while { _a < 5 || _a > (count PMC_targets) } do
{
	_a = _a + 1;

	// choose random posit, then remove it from selection so next time
	// we choose different random posit, no two units go in same location.
	_ran = (floor random _targetNum);
	_tlogic = (PMC_temptargets select _ran);
	PMC_temptargets = PMC_temptargets - [_tlogic];
	_targetNum =_targetNum-1;
	_targetpoint = getPosASL _tlogic;

	// choose one of the random starting locations
	_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;

	// choose one of the random starting locations
	_respawnpoint = [] call _PMC_SelectBLUFORStartPosit;
	// randomize what we are creating.
	_rand = round (random 4);
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
	};
};

PMC_scriptsDone = true;
publicVariable "PMC_scriptsDone";

_targetNum = count PMC_targets;

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
		( (count list PMC_opfor_list < 100) || (count list PMC_blufor_list < 100) );
	};

	if (count list PMC_opfor_list < 100) then
	{
		_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
		[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
		[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;
	};

	if (count list PMC_blufor_list < 100) then
	{
		_respawnpoint = [] call _PMC_SelectBLUFORStartPosit;

		// randomize what we are creating.
		_rand = round (random 4);
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
		};
	};
	// just to relax a bit
	sleep 30;
};
