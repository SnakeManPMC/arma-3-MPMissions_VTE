
private
[
	"_grp",
	"_maxOPFORA",
	"_myVec",
	"_PMC_opfor_vehicle_heavy",
	"_PMC_Time",
	"_respawnpoint",
	"_targetpoint",
	"_vcl"
];

_PMC_opfor_vehicle_heavy =
[
	"vte_btr50",
	"vte_nvauazmg",
	"vte_pt76",
	"vte_su76",
	"vte_t34_85",
	"vte_t55",
	"vte_zsu37",
	"vte_zsu57"
];

_maxOPFORA = count _PMC_opfor_vehicle_heavy;
_targetpoint = getPosASL us_flag;
_respawnpoint = getPosASL pmc_veh_start;

// time how often we make vehicles
_PMC_Time = time;

// create units
while {true} do
{
	waitUntil
	{
		sleep 5;
		( (_PMC_Time + 900) < time );
	};
	_PMC_Time = time;

	_myVec = objNull;
	_vcl = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// first vehicle
	_myVec = (_PMC_opfor_vehicle_heavy select floor random _maxOPFORA);
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	(units _grp select 0) moveInDriver _vcl;

	[_vcl, _grp] execVM "PMC\PMC_Create_Crew.sqf";

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	// do these need to be set, before waypoint 0 hmm?
	_grp setFormation "COLUMN";
	_grp setCombatMode "YELLOW";
	_grp setSpeedMode "NORMAL";
	_grp setBehaviour "SAFE";

	// search and destroy waypoint
	_grp addWaypoint [_targetpoint, 200];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "NORMAL";
	[_grp, 1] setWaypointFormation "COLUMN";
	[_grp, 1] setWaypointType "SAD";
	[_grp, 1] setWaypointCompletionRadius 50;
	// guard waypoint after searching
	_grp addWaypoint [_targetpoint, 200];
	[_grp, 2] setWaypointType "GUARD";
	[_grp, 2] setWaypointCompletionRadius 50;

	sleep 60;

        diag_log format ["VehOP <time waitUntil done, _myVec1: %1, _vcl: %2", _myVec, _vcl];
	
	// then if the old vehicle is dead, out of ammo etc
	waitUntil
	{
		sleep 5;
		(!alive _vcl || !canMove _vcl || !canFire _vcl);
	};
	diag_log format ["VehOP dead waitUntil done, alive _vcl: %1, canMove _vcl: %2, canFire _vcl: %3", (alive _vcl), (canMove _vcl), (canFire _vcl)];
};
