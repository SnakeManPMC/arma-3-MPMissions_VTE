
// if we run this on client, exit immediately.
if (!isServer) exitWith{};

// run killed script, 300 corpses max on the battlefield.
// this needs to be global??
PMC_corpses = [];
[50] execVM "PMC\PMC_corpses.sqf";

// we are running the scripts, just some debug stuff which should be removed.
PMC_running = 1;
publicVariable "PMC_running";

PMC_opfor = 0;
PMC_targets = [];
_targetpoint = getMarkerPos "start";

PMC_MakeGuardInfOPFOR =
{
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

_targetNum = count PMC_targets;

// just to wait a sec until our stupid list is initialized
waitUntil
{
	(!isNil {opforunits});
};

// create units
while {PMC_opfor < 500} do
{
	_respawnpoint = getPosASL (PMC_targets select floor random (_targetNum - 1));

	waitUntil
	{
		(count opforunits < 50);
	};

	if (count opforunits < 50) then 
	{
		[] call PMC_MakeGuardInfOPFOR;
		PMC_opfor = PMC_opfor + 9;
		publicVariable "PMC_opfor";
	};
	sleep 5;
};

PMC_mcomplete = true;
publicVariable "PMC_mcomplete";
