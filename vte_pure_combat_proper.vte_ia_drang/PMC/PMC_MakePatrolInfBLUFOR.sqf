
PMC_MakePatrolInfBLUFOR =
{
        private ["_grp","_respawnpoint","_wp","_targetpoint","_waypointRanPosit"];
        
        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;
        
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

	// pmc_1 is plei me gamelogic
	_wp = [_grp, (getPosASL pmc_1), _targetpoint, 50, 1000] call PMC_plotWaypoints;
	_wp = _wp + 1;

	// waypoints, we add couple to make patrol area
	// first
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, _wp] setWaypointBehaviour "SAFE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "LIMITED";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "MOVE";
	[_grp, _wp] setWaypointTimeout [60*2, 0, 60*20];
	[_grp, _wp] setWaypointCompletionRadius 50;

	// second
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	_wp = _wp + 1;
	[_grp, _wp] setWaypointType "MOVE";
	[_grp, _wp] setWaypointTimeout [60*2, 0, 60*20];
	[_grp, _wp] setWaypointCompletionRadius 50;

	// cycle
	_grp addWaypoint [_targetpoint, 0];
	_wp = _wp + 1;
	[_grp, _wp] setWaypointType "CYCLE";
	[_grp, _wp] setWaypointCompletionRadius 50;

	PMC_cu = PMC_cu + 9;
	publicVariable "PMC_cu";

	// but now launch these guys with the helo insertion...
	//player globalchat format["nam_inftransport: %1, %2, %3",_grp, CV_helopad, _targetpoint];
	[_grp, CV_helopad, call PMC_Select_BLUFOR_starts] execVM "PMC\PMC_Nam_infTransport.sqf";

	call PMC_debug_rpt;
};
