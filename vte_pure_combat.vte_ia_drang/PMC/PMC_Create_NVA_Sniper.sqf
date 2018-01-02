//PMC_Create_NVA_Sniper.sqf
PMC_Create_NVA_Sniper =
{
	
private ["_grp","_respawnpoint","_wp","_targetpoint","_waypointRanPosit"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;
        _grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", 1, "LIEUTENANT"];
	"VTE_NVAmark" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	_grp setbehaviour "STEALTH";
	_grp setcombatmode "RED";
	_grp setspeedmode "LIMITED";
	_grp setformation "LINE";

	_wp = [_grp, (getPosASL leader _grp), _targetpoint, 50, 1000] call PMC_plotWaypoints;
	_wp = _wp + 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "STEALTH";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "LIMITED";
	[_grp, _wp] setWaypointFormation "LINE";
	[_grp, _wp] setWaypointCompletionRadius 50;
	[_grp, _wp] setWaypointType "GUARD";

	PMC_cu = PMC_cu + 2;
	publicVariable "PMC_cu";

	// debug stuff for rpt ;)
	diag_log format
	[
		"OPFOR Create_NVA_Sniper - OPFOR: %1, BLUFOR: %2, PMC_cu: %3, PMC_killedNum: %4, PMC_helo_cv: %5, PMC_InfTransport: %6, VictoryCondition: %7, PMC_grpNum: %8, PMC_corpses: %9",
		(count PMC_opfor_list),
		(count PMC_blufor_list),
		PMC_cu,
		PMC_killedNum,
		PMC_helo_cv,
		PMC_InfTransport,
		PMC_VictoryCondition,
		PMC_grpNum,
		(count PMC_corpses)
	];
};
