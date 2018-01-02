
// start our attack, block further possibilities of launching this attack until we are fully done.

private ["_grp","_x","_wp"];
PMC_NVA_Attack_Running = true;
publicVariable "PMC_NVA_Attack_Running";

private
[
	"_grp"
];

diag_log "PMC_NVA_Massive_Attack launched :)";

call compile preProcessFileLineNumbers "PMC\PMC_Create_Squad_NVA.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Squad_VC.sqf";

// PMC_opfor_start_3 is nicely aligned with plei me

for [{_x = 1}, {_x <= 5}, {_x = _x + 1}] do
{
	// NVA

	_grp = [PMC_opfor_start_3] call PMC_Create_Squad_NVA;

	_wp = 0;
	_wp = [_grp, (getPosASL leader _grp), (getPosASL pmc_1), 50, 1000] call PMC_plotWaypoints;
	_wp = _wp + 1;

	// search and destroy plei me center
	_grp addWaypoint [(getPosASL pmc_1), 0];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "YELLOW";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "LINE";
	[_grp, _wp] setWaypointType "SAD";
	[_grp, _wp] setWaypointCompletionRadius 50;

	// and do it over and over again
	_grp addWaypoint [(getPosASL pmc_1), 0];
	_wp = _wp + 1;
	[_grp, _wp] setWaypointType "CYCLE";
	[_grp, _wp] setWaypointCompletionRadius 50;

	// VC

	_grp = [PMC_opfor_start_3] call PMC_Create_Squad_VC;

	_wp = 0;
	_wp = [_grp, (getPosASL leader _grp), (getPosASL pmc_1), 50, 1000] call PMC_plotWaypoints;
	_wp = _wp + 1;

	// search and destroy plei me center
	_grp addWaypoint [(getPosASL pmc_1), 0];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "YELLOW";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "LINE";
	[_grp, _wp] setWaypointType "SAD";
	[_grp, _wp] setWaypointCompletionRadius 50;

	// and do it over and over again
	_grp addWaypoint [(getPosASL pmc_1), 0];
	_wp = _wp + 1;
	[_grp, _wp] setWaypointType "CYCLE";
	[_grp, _wp] setWaypointCompletionRadius 50;

	// dunno if this makes any difference, server still creates units quite slowly.
	sleep 2;
};

// our attack is complete
PMC_NVA_Attack_Running = false;
publicVariable "PMC_NVA_Attack_Running";
