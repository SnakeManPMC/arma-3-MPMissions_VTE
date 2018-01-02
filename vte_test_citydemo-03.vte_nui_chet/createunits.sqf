// if we run this on client, exit immediately.



private ["_a","_PMC_MakeGuardInfOPFOR","_PMC_MakePatrolInfOPFOR","_waypointRanPosit","_targetpoint","_respawnpoint"];
if (!isServer) exitWith{};

_PMC_MakeGuardInfOPFOR =
{
private ["_grp","_respawnpoint","_targetpoint","_waypointRanPosit"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;
        
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

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

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
private ["_grp","_respawnpoint","_targetpoint","_waypointRanPosit"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;
        
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

	_grp setBehaviour "SAFE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "LIMITED";
	_grp setFormation "WEDGE";

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

_waypointRanPosit = 200;
_targetpoint = _this select 0;
_respawnpoint = _targetpoint;

// create units
_a = 0;
while { _a < random 3} do
{
	_a = _a + 1;

	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeGuardInfOPFOR;
	[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakePatrolInfOPFOR;
	sleep 1;
};
