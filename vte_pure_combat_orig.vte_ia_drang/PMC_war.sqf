/*

	Main war script, creates units and waypoints for them.
	Units first created and then sent on random locations.

*/

private [
	"_grp","_ran","_tlogic","_respawnpoint","_targetNum","_waypointRanPosit",
	"_a","_PMC_temptargets","_PMC_MakeGuardInfOPFOR","_PMC_MakePatrolInfOPFOR",
	"_PMC_MakeGuardInfBLUFOR","_PMC_MakePatrolInfBLUFOR",
	"_PMC_SelectOPFORStartPosit","_PMC_SelectBLUFORStartPosit",
	"_PMC_temptargets"
];

_PMC_MakeGuardInfOPFOR =
{
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"VTE_vcofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_vcsoldier4" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_vcsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_vcmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"VTE_vcrpg" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_vcsoldier2" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_vcat" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_vcmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_vcsoldier3" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	_grp setbehaviour "AWARE";
	_grp setcombatmode "RED";
	_grp setspeedmode "FULL";
	_grp setformation "WEDGE";

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";

	PMC_cu = PMC_cu + 9;
	publicVariable "PMC_cu";
};

_PMC_MakePatrolInfOPFOR =
{
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"VTE_NVAofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_NVArto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"VTE_NVArpg" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_NVAmedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	_grp setbehaviour "SAFE";
	_grp setcombatmode "RED";
	_grp setspeedmode "LIMITED";
	_grp setformation "WEDGE";

	// waypoints, we add couple to make patrol area
	// first
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 1] setWaypointBehaviour "SAFE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "LIMITED";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "MOVE";
	[_grp, 1] setWaypointTimeout [60*2, 0, 60*20];

	// second
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 2] setWaypointType "MOVE";
	[_grp, 2] setWaypointTimeout [60*2, 0, 60*20];

	// cycle
	_grp addWaypoint [_targetpoint, 0];
	[_grp, 3] setWaypointType "CYCLE";

	PMC_cu = PMC_cu + 9;
	publicVariable "PMC_cu";
};

_PMC_MakeGuardInfBLUFOR =
{
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};
	
	"VTE_armyofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_armywrto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_armysoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_armywmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"VTE_armywlaw" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_armywgl" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_armywlaw" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_armywmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_armywmedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	_grp setbehaviour "AWARE";
	_grp setcombatmode "RED";
	_grp setspeedmode "FULL";
	_grp setformation "WEDGE";

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";

	PMC_cu = PMC_cu + 9;
	publicVariable "PMC_cu";

	// but now launch these guys with the helo insertion...
	[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Nam_infTransport.sqf";
};

_PMC_MakePatrolInfBLUFOR =
{
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};
	
	"VTE_armyofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_armywrto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_armysoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_armywmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"VTE_armywlaw" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_armywgl" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_armywlaw" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_armywmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_armywmedic" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	_grp setbehaviour "SAFE";
	_grp setcombatmode "RED";
	_grp setspeedmode "LIMITED";
	_grp setformation "WEDGE";

	// waypoints, we add couple to make patrol area
	// first
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 1] setWaypointBehaviour "SAFE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "LIMITED";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "MOVE";
	[_grp, 1] setWaypointTimeout [60*2, 0, 60*20];

	// second
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 2] setWaypointType "MOVE";
	[_grp, 2] setWaypointTimeout [60*2, 0, 60*20];

	// cycle
	_grp addWaypoint [_targetpoint, 0];
	[_grp, 3] setWaypointType "CYCLE";

	PMC_cu = PMC_cu + 9;
	publicVariable "PMC_cu";

	// but now launch these guys with the helo insertion...
	[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Nam_infTransport.sqf";
};

_PMC_SelectOPFORStartPosit =
{
	// select one starting point
	_ran = (floor random (count PMC_opfor_starts));
	_tlogic = (PMC_opfor_starts select _ran);
	_respawnpoint = [(getPosASL _tlogic select 0)-50+random 100,(getPosASL _tlogic select 1)-50+random 100];

	// place the value to be returned like this at the end in function!
	_respawnpoint
};

_PMC_SelectBLUFORStartPosit =
{
	// select one starting point
	_ran = (floor random (count PMC_blufor_starts));
	_tlogic = (PMC_blufor_starts select _ran);
	_respawnpoint = [(getPosASL _tlogic select 0)-50+random 100,(getPosASL _tlogic select 1)-50+random 100];

	// place the value to be returned like this at the end in function!
	_respawnpoint;
};

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
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

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
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

_targetNum = count PMC_targets;
_MaxOPFOR = 25;
_MaxBLUFOR = 10;

// loop to create units until we have created 1000 of them :)
while {PMC_cu < 1000} do
{
	_ran = (floor random _targetNum);
	_tlogic = (PMC_targets select _ran);
	_targetpoint = getPosASL _tlogic;

	waitUntil
	{
		sleep 2;
		( (count PMC_opfor_list < _MaxOPFOR) || (count PMC_blufor_list < _MaxBLUFOR) );
	};

	if (count PMC_opfor_list < _MaxOPFOR) then
	{
		_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
		[] call _PMC_MakeGuardInfOPFOR;
		_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
		[] call _PMC_MakePatrolInfOPFOR;
	};

	// if we don't have enough troops AND only 2 transport helos are flying...
	if ( (count PMC_blufor_list < _MaxBLUFOR) && (PMC_InfTransport < 3) ) then
	{
		//_respawnpoint = [] call _PMC_SelectBLUFORStartPosit;
		// but now we spawn them into the HQ to get helo ferry :)
		_respawnpoint = getPosASL CV_helopad;
		[] call _PMC_MakeGuardInfBLUFOR;
		//_respawnpoint = [] call _PMC_SelectBLUFORStartPosit;
		// this is 50m behind from the first helo, so they collide.
		_respawnpoint = [(getPosASL CV_helopad select 0),(getPosASL CV_helopad select 1)-50,0];
		[] call _PMC_MakePatrolInfBLUFOR;
	};
	// just to relax a bit
	sleep 30;
	// not work in MP as run on server... [] execVM "PMC_debug_hints.sqf";
};

/*
this mission is done, good job :)
yeah but not working on server you dimwit...
*/
//hint "We have achieved 1000 KIA's (all sides). Mission over.";
//player sideChat "We have achieved 1000 KIA's (all sides). Mission over.";

PMC_Mission_Complete = true;
publicVariable "PMC_Mission_Complete";
