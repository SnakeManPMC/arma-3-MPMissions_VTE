//_PMC_MakeGuardInfOPFOR

PMC_MakeGuardInfOPFOR =
{
        private ["_grp","_respawnpoint","_wp","_targetpoint","_waypointRanPosit"];

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

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	_grp setbehaviour "AWARE";
	_grp setcombatmode "RED";
	_grp setspeedmode "FULL";
	_grp setformation "WEDGE";

	_wp = [_grp, (getPosASL leader _grp), _targetpoint, 50, 1000] call PMC_plotWaypoints;
	_wp = _wp + 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
	[_grp, _wp] setWaypointCompletionRadius 50;

	PMC_cu = PMC_cu + 9;
	publicVariable "PMC_cu";

	call PMC_debug_rpt;
};
