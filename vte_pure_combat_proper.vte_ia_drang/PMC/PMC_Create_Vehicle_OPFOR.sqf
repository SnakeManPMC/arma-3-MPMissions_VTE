
private ["_grp","_myVec","_PMC_opfor_vehicle_heavy","_PMC_Time","_respawnpoint","_targetpoint","_vcl","_wp"];

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

// create units
while {true} do
{
	_targetpoint = getPosASL call PMC_Select_Target;
	_respawnpoint = call PMC_SelectOPFORStartPosit;
	diag_log format ["VehOP: _respawnpoint: %1", _respawnpoint];
	
	// time how often we make vehicles
	_PMC_Time = time;
	
	_myVec = objNull;
	_vcl = objNull;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// first vehicle
	_myVec = (_PMC_opfor_vehicle_heavy select floor random (count _PMC_opfor_vehicle_heavy));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	diag_log format ["VehOP: _myVec1: %1, _vcl: %2", _myVec, _vcl];

	"VTE_nvacrew" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
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
	diag_log format ["VehOP <time waitUntil done, _myVec1: %1, _vcl: %2", _myVec, _vcl];
	
	// then if the old vehicle is dead, out of ammo etc
	waitUntil
	{
		sleep 5;
		(!alive _vcl || !canMove _vcl || !canFire _vcl);
	};
	diag_log format ["VehOP dead waitUntil done, alive _vcl: %1, canMove _vcl: %2, canFire _vcl: %3", (alive _vcl), (canMove _vcl), (canFire _vcl)];

	sleep 60;
};
