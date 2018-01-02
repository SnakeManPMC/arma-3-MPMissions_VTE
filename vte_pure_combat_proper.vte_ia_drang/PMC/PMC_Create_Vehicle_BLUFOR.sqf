private ["_grp","_myVec","_PMC_blufor_vehicle_heavy","_PMC_Time","_respawnpoint","_targetpoint","_vcl","_wp"];

_PMC_blufor_vehicle_heavy =
[
	"vte_jeep_mg",
	"vte_m113",
	"vte_m113acav",
	"vte_m163vulcan",
	"vte_m48",
	"vte_m551",
	"vte_truck5tusmafia"
];

// create units
while {true} do
{
	_targetpoint = getPosASL call PMC_Select_Target;
	_respawnpoint = getPosASL call PMC_Select_BLUFOR_starts;
	diag_log format ["VehBLU _respawnpoint: %1", _respawnpoint];
	
	// time how often we make vehicles
	_PMC_Time = time;
	
	_myVec = objNull;
	_vcl = objNull;
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	// first vehicle
	_myVec = (_PMC_blufor_vehicle_heavy select floor random (count _PMC_blufor_vehicle_heavy));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	diag_log format ["VehBLU: _myVec1: %1, _vcl: %2", _myVec, _vcl];

	"VTE_Armycrew" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	[_vcl, _grp] execVM "PMC\PMC_Create_Crew.sqf";

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	// do these need to be set, before waypoint 0 hmm?
	_grp setFormation "COLUMN";
	_grp setCombatMode "YELLOW";
	_grp setSpeedMode "NORMAL";
	_grp setBehaviour "SAFE";

/*
	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
*/
	_wp = 0;
	_wp = [_grp, (getPosASL leader _grp), _targetpoint, 100, 1000] call PMC_plotWaypoints;
	_wp = _wp + 1;

	// search and destroy waypoint
	_grp addWaypoint [_targetpoint, 200];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "NORMAL";
	[_grp, _wp] setWaypointFormation "COLUMN";
	[_grp, _wp] setWaypointType "SAD";
	[_grp, _wp] setWaypointCompletionRadius 100;
	// guard waypoint after searching
	_grp addWaypoint [_targetpoint, 200];
	_wp = _wp + 1;
	[_grp, _wp] setWaypointType "GUARD";
	[_grp, _wp] setWaypointCompletionRadius 100;

	// 1st enough time passes so we dont spam them constantly
	waitUntil
	{
		sleep 5;
		( (_PMC_Time + 900) < time );
	};
	diag_log format ["VehBLU <time waitUntil done, _myVec1: %1, _vcl: %2", _myVec, _vcl];
	
	// then if the old vehicle is dead, out of ammo etc
	waitUntil
	{
		sleep 5;
		(!alive _vcl || !canMove _vcl || !canFire _vcl);
	};
	diag_log format ["VehBLU dead waitUntil done, alive _vcl: %1, canMove _vcl: %2, canFire _vcl: %3", (alive _vcl), (canMove _vcl), (canFire _vcl)];

	sleep 60;
};
