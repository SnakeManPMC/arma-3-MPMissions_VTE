
private ["_respawnpoint","_targetpoint","_tmp"];

// if we run this on client, exit immediately.
if (!isServer) exitWith{};

PMC_debug = false;
// run killed script, 300 corpses max on the battlefield.
// this needs to be global??
PMC_killedNum = 0;
publicVariable "PMC_killedNum";
PMC_corpses = [];
[50] execVM "PMC\PMC_corpses.sqf";

// gather list of targets from "pmc_1" etc gamelogicks
_tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil {scriptDone _tmp};

// we are running the scripts, just some debug stuff which should be removed.
PMC_running = 1;
publicVariable "PMC_running";

PMC_opfor = 0;
//PMC_targets = [];
_targetpoint = getPosASL racsflag;

waitUntil
{
	(!isNil {opforunits});
};

PMC_MakeGuardInfOPFOR =
{
	
private ["_grp","_respawnpoint","_targetpoint"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        
        _grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

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

	_grp addWaypoint [_targetpoint, 20];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
};

// create units
while {PMC_opfor < 200} do
{
	_respawnpoint = getPosASL (PMC_targets select round random (count PMC_targets));

	waitUntil
	{
		sleep 1;
		(count opforunits < 50);
	};

	if (count opforunits < 50) then 
	{
		[_respawnpoint, _targetpoint] call PMC_MakeGuardInfOPFOR;
		PMC_opfor = PMC_opfor + 9;
		publicVariable "PMC_opfor";
	};
	sleep 5;
};

PMC_mcomplete = true;
publicVariable "PMC_mcomplete";
