//PMC_Create_NVA_Recon.sqf
PMC_Create_NVA_Recon =
{
	private ["_grp","_PMC_temp_targets","_ran","_targetpoint","_tlogic","_wp","_respawnpoint"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	"VTE_NVArecon" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"VTE_NVAreconrto" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"VTE_nvarecon" createUnit [_respawnpoint, _grp, "", 0.33, "PRIVATE"];
	"VTE_nvarecon" createUnit [_respawnpoint, _grp, "", 0.33, "PRIVATE"];

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	_grp setbehaviour "STEALTH";
	_grp setcombatmode "GREEN";
	_grp setspeedmode "LIMITED";
	_grp setformation "VEE";

	// temporary array which we will clean eventually.
	_PMC_temp_targets = PMC_targets;

	// do the random patrolling waypoints
	_wp = 0;
	while {count _PMC_temp_targets > 0} do
	{
		_ran = (floor random (count _PMC_temp_targets));
		_tlogic = (_PMC_temp_targets select _ran);
		_PMC_temp_targets = _PMC_temp_targets - [_tlogic];
		_targetpoint = getPosASL _tlogic;
		_wp = _wp + 1;

		// huge spam diag_log format["NVA_Recon _grp: %1, _PMC_temp_targets: %2, _wp: %3", _grp, _tlogic, _wp];

		_grp addWaypoint [_targetpoint, 0];
		[_grp, _wp] setWaypointBehaviour "STEALTH";
		[_grp, _wp] setWaypointCombatMode "GREEN";
		[_grp, _wp] setWaypointSpeed "LIMITED";
		[_grp, _wp] setWaypointFormation "VEE";
		[_grp, _wp] setWaypointType "MOVE";
		[_grp, _wp] setWaypointCompletionRadius 50;
		[_grp, _wp] setWaypointTimeout [120, 300, 600];
	};

	// add one last for cycle, so if he survives, he does it all over again.
	_wp = _wp + 1;
	_grp addWaypoint [_respawnpoint, 0];
	[_grp, _wp] setWaypointBehaviour "STEALTH";
	[_grp, _wp] setWaypointCombatMode "GREEN";
	[_grp, _wp] setWaypointSpeed "LIMITED";
	[_grp, _wp] setWaypointFormation "VEE";
	[_grp, _wp] setWaypointType "CYCLE";
	[_grp, _wp] setWaypointCompletionRadius 50;
	[_grp, _wp] setWaypointTimeout [120, 300, 600];

	diag_log format["NVA_Recon _grp: %1, Targets WP creation is DONE! _wp: %2", _grp, _wp];

	PMC_cu = PMC_cu + 4;
	publicVariable "PMC_cu";

	// debug stuff for rpt ;)
	diag_log format
	[
		"OPFOR Create_NVA_Recon - OPFOR: %1, BLUFOR: %2, PMC_cu: %3, PMC_killedNum: %4, PMC_helo_cv: %5, PMC_InfTransport: %6, VictoryCondition: %7, PMC_grpNum: %8, PMC_corpses: %9",
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
