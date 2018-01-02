
// if we run this on client, exit immediately.
// already handled in init.sqf if (!isServer) exitWith{};

private ["_a","_OPFOR_MaxCount","_p","_PMC_MakeGuardInfOPFOR","_PMC_MakePatrolInfOPFOR","_targetpoint","_waypointRanPosit","_VictoryCondition"];

TotalVCorig = 0;
TotalUSorig = 0;
TotalVCCount = 0;
TotalUSCount = 0;
TotalVCorig = ("Man" counttype eastlist);
TotalUSorig = ("Man" counttype westlist);
TotalVCCount = ("Man" counttype eastlist);
TotalUSCount = ("Man" counttype westlist);
publicVariable "TotalVCorig";
publicVariable "TotalUSorig";
publicVariable "TotalVCCount";
publicVariable "TotalUSCount";

// initialized variables and settings
pmc_corpses_num = 0;
PMC_killedNum = 0;
publicVariable "PMC_killedNum";

PMC_debug = false;
// corpse removal script
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";

// count for enemy units
PMC_opfor = 0;
publicVariable "PMC_opfor";
// targets hmm
PMC_targets = [];
_targetpoint = getPosASL usa;
// how many enemy units are on the fight. 05-20-09: was 100 :)
_OPFOR_MaxCount = 50;
// how many enemy KIAs for US to win
_VictoryCondition = 18*24;
// waypoint random position range
_waypointRanPosit = 100;


/*

	Functions

*/

// choose random respawn location for enemy
PMC_Choose_Respawn_Posit =
{
	
private ["_respawnpoint"];
        _respawnpoint = getPosASL (PMC_targets select floor random (count PMC_targets));
	if (PMC_debug) then
	{
		player sidechat format["_respawnpoint: %1",_respawnpoint];
	};
	_respawnpoint;
};

// enemy guard waypoint guys, VC
_PMC_MakeGuardInfOPFOR =
{
	
private ["_grp","_respawnpoint","_targetpoint","_waypointRanPosit"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;
        
        _grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// choose random respawn location
	_respawnpoint = [] call PMC_Choose_Respawn_Posit;

	"VTE_vcofficer" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_vcsoldier4" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_vcmg" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"VTE_vcmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_vcrpg" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_vcmedic" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_vcsoldier3" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"VTE_vcsoldier" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"VTE_vcsoldier2" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	// waypoints, we add couple to make patrol area
	// first
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
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
};

// enemy patrol waypoint guys, NVA
_PMC_MakePatrolInfOPFOR =
{
	
private ["_grp","_respawnpoint","_targetpoint","_waypointRanPosit"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;

        _grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// choose random respawn location
	_respawnpoint = [] call PMC_Choose_Respawn_Posit;

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

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	// waypoints, we add couple to make patrol area
	// first
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
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
};

/*

	Main code

*/

// choose new digit for the gamelogic "VCStart*"
_a = 1;
_p = missionNamespace getVariable [format ["VCStart%1",_a], objNull];
PMC_targets = [];

// loop until we have no gamelogics left, it then should return 0.
while {!isNull _p && ((getPosASL _p) select 0) != 0} do
{
	// just make array out of the gamelogics
	PMC_targets = PMC_targets + [_p];
	
	// add one digit to our gamelogic name.
	_a = _a + 1;
	_p = missionNamespace getVariable [format ["VCStart%1",_a], objNull];
};

// create units run our normal NVA/VC creator
while {PMC_opfor < _VictoryCondition} do
{
	waitUntil
	{
		sleep 2;
		(count eastlist < _OPFOR_MaxCount);
	};

	if (count eastlist < _OPFOR_MaxCount) then 
	{
		// random chance of pause in the opfor attack waves
		// if so, then make a 1min to 3min full pause on creating units.
		if ((random 100) < 25) then
		{
			sleep (60 + (random 120));
		};
		[0, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
		[0, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;
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
ReadyToEnd = true;
publicVariable "ReadyToEnd";
