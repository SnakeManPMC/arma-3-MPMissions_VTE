/*

	Random US helicopter patrol over the area.
	New one will be created when old is killed/out of ammo or sorts...

*/

private ["_grp","_helos","_myVec","_ran","_respawnpoint","_targetpoint","_tlogic","_vcl"];

_helos =
[
	"VTE_ach47a",
	"VTE_ah1g",
	"VTE_ah1j",
	"VTE_ch34_mg",
	"VTE_ch46e_mg",
	"VTE_ch47ca",
	"VTE_ch53_mg",
	"VTE_oh6a",
	"VTE_oh6arg",
	"VTE_s56_mg",
	"VTE_uh1",
	"VTE_uh1a",
	"VTE_uh1gs",
	"VTE_uh1guns"
];

// csar mission stuff
PMC_Downed_Pilots = [];
publicVariable "PMC_Downed_Pilots";

_respawnpoint = getPosASL CV_helopad;

// never ending loop to create units
while {true} do
{
	// if weather is very bad for flying wait until it clears up...
	if ((overcast > 0.7) && (overcastForecast > 0.7)) then
	{
		waitUntil
		{
			sleep 60;
			((overcast < 0.7) && (overcastForecast < 0.7));
		};
	};

	_ran = (floor random (count PMC_targets));
	_tlogic = (PMC_targets select _ran);
	_targetpoint = getPosASL _tlogic;

	_vcl = objNull;
	_myVec = (_helos select floor random (count _helos));
	_vcl = _myVec createVehicle _respawnpoint;
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"VTE_acpilot" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	[_vcl, _grp] execVM "PMC\PMC_Create_Crew.sqf";

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setbehaviour "COMBAT";
	_grp setcombatmode "RED";
	_grp setspeedmode "FULL";
	_grp setformation "WEDGE";

	_grp addWaypoint [_targetpoint, 500];
	[_grp, 1] setWaypointBehaviour "COMBAT";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
	[_grp, 1] setWaypointCompletionRadius 200;

	// lets put up a variable showing helo amounts created
	PMC_helo_cv = PMC_helo_cv + 1;
	publicVariable "PMC_helo_cv";

	diag_log format["PMC_helo_cv: %1, _vcl: %2, _myVec: %3", PMC_helo_cv, _vcl, _myVec];

	// do not attempt to create helos more than once a minute
	sleep 60;

	// wait until the helo cannot either; Move or Fire, or its simply dead.
	waitUntil
	{
		sleep 5;
		(!alive _vcl || !canMove _vcl || !canFire _vcl || ((fuel vehicle _vcl) < 0.2) );
	};

	diag_log format
	[
		"PMC_Helo_purecombat_BLUFOR waitUntil exited... alive: %1, canMove: %2, canFire: %3, fuel: %4, _myVec: %5, alive leader _grp: %6",
		alive _vcl,
		canMove _vcl,
		canFire _vcl,
		(fuel vehicle _vcl),
		_myVec,
		(alive leader _grp)
	];

	if ((fuel vehicle _vcl) < 0.2) then
	{
		diag_log format
		[
			"PMC_Helo_purecombat_BLUFOR sent to graveyard with... alive: %1, canMove: %2, canFire: %3, fuel: %4, _myVec: %5",
			alive _vcl,
			canMove _vcl,
			canFire _vcl,
			(fuel vehicle _vcl),
			_myVec
		];
		[_vcl] execVM "PMC\PMC_vehicle_graveyard.sqf";
	};

	// possible CSAR mission
	if ((!alive _vcl || !canMove _vcl) && alive leader _grp) then
	{
		// remove waypoint so they arent moving anywhere.
		deleteWaypoint [_grp, 1];
		// behaviour for shot down pilots.
		_grp setBehaviour "STEALTH";
		_grp setCombatMode "GREEN";
		_grp setSpeedMode "LIMITED";
		_grp setFormation "COLUMN";

		_grp addWaypoint [getPosASL _vcl, 1];
		[_grp, 1] setWaypointBehaviour "STEALTH";
		[_grp, 1] setWaypointCombatMode "GREEN";
		[_grp, 1] setWaypointSpeed "LIMITED";
		[_grp, 1] setWaypointFormation "COLUMN";
		[_grp, 1] setWaypointType "SENTRY";
		[_grp, 1] setWaypointCompletionRadius 200;

		PMC_Downed_Pilots = PMC_Downed_Pilots + [_grp];

		PMC_CSAR_mission = (leader _grp);
		publicVariable "PMC_CSAR_mission";
	};
};
