/*

Civilians around the objective to make things... interesting.

Syntax:
[targetPoint] execVM "PMC\PMC_objective_civilians.sqf";

*/

private [
	"_targetpoint", "_respawnpoint", "_myVec", "_vcl", "_grp",
	"_waypointRanPosit", "_a", "_PMC_RandomTargetLocation", "_civis",
	"_max_civis", "_PMC_MakeStatics", "_PMC_MakeCivis"
];

// grab the objective location from parameter
_targetpoint = _this select 0;
_respawnpoint = _targetpoint;

_civis =
[
	"VTE_villager1", "VTE_villager2", "VTE_villager3", "VTE_villager4",
	"VTE_villager5", "VTE_villager6", "VTE_villager7", "VTE_villager8"
];
_max_civis = count _civis;

// select random position.
_PMC_RandomTargetLocation = 
{
	private ["_randompos"];
	_randompos = [((_targetpoint select 0)-200 + random 400),((_targetpoint select 1)-200 + random 400),0];
	if (PMC_debug) then
	{
		player sidechat format["oldpos: %1. new pos: %2",_targetpoint,_randompos];
	};
	// return the random position
	_randompos;
};

_PMC_MakeCivis =
{
	_grp = objNull;
	_grp = createGroup civilian;
	waitUntil {!(isNull _grp)};

	_pos = [] call _PMC_RandomTargetLocation;
	
	"vte_villager1" createUnit [_pos, _grp, "", (random 1), "LIEUTENANT"];
	"vte_villager2" createUnit [_pos, _grp, "", (random 1), "SERGEANT"];
	"vte_villager3" createUnit [_pos, _grp, "", (random 1), "SERGEANT"];
	"vte_villager4" createUnit [_pos, _grp, "", (random 1), "CORPORAL"];
	"vte_villager5" createUnit [_pos, _grp, "", (random 1), "CORPORAL"];
	"vte_villager6" createUnit [_pos, _grp, "", (random 1), "PRIVATE"];
	"vte_villager7" createUnit [_pos, _grp, "", (random 1), "PRIVATE"];
	"vte_villager8" createUnit [_pos, _grp, "", (random 1), "PRIVATE"];

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "NORMAL";
	_grp setFormation "WEDGE";

	// wp 1
	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "NORMAL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "MOVE";
	[_grp, 1] setWaypointTimeout [60*2, 0, 60*20];

	// wp 2
	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 2] setWaypointType "MOVE";
	[_grp, 2] setWaypointTimeout [60*2, 0, 60*20];

	// wp 3
	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 3] setWaypointType "MOVE";
	[_grp, 3] setWaypointTimeout [60*2, 0, 60*20];

	// wp cycle
	_grp addWaypoint [_targetpoint, 0];
	[_grp, 4] setWaypointType "CYCLE";
};

_PMC_MakeStatics =
{
	_statics =
	[
		"Land_VTE_vilpaper1", "Land_VTE_vilbasket1", "Land_VTE_vilbasket2",
		"Land_VTE_vilbasket3", "Land_VTE_vilbench1", "Land_VTE_vilpot1",
		"Land_VTE_vilricebasket1", "Land_VTE_vilricebasket2", "Land_VTE_viltable1",
		"Land_VTE_viltire1", "Land_VTE_vilbasketcart1", "Land_VTE_vilcloth1",
		"Land_VTE_vilcloth2", "Land_VTE_vilcrate1", "Land_VTE_vilfence1", "Land_VTE_vilfence2",
		"Land_VTE_vilhaycone1", "Land_VTE_vilmat1", "Land_VTE_vilmat2"
	];

	// 1
	_myVec = (_statics select round random (count _statics - 1));
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = _myVec createVehicle _pos;

	if (PMC_debug) then { player sideChat format["created civie static: %1",_myVec]; };

	// 2
	_myVec = (_statics select round random (count _statics - 1));
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = _myVec createVehicle _pos;

	if (PMC_debug) then { player sideChat format["created civie static: %1",_myVec]; };

	// 3
	_myVec = (_statics select round random (count _statics - 1));
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = _myVec createVehicle _pos;

	if (PMC_debug) then { player sideChat format["created civie static: %1",_myVec]; };

	// 4
	_myVec = (_statics select round random (count _statics - 1));
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = _myVec createVehicle _pos;

	if (PMC_debug) then { player sideChat format["created civie static: %1",_myVec]; };

	// 5
	_myVec = (_statics select round random (count _statics - 1));
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = _myVec createVehicle _pos;

	if (PMC_debug) then { player sideChat format["created civie static: %1",_myVec]; };
};

// our waypoints random circle range
_waypointRanPosit = 250;

// create units
_a = 0;
while { _a < (1 + round random 5) } do
{
	_a = _a + 1;

	[] call _PMC_MakeCivis;
	[] call _PMC_MakeStatics;
	sleep 1;
	[] call _PMC_MakeStatics;
	sleep 1;
	[] call _PMC_MakeStatics;
	sleep 1;
	[] call _PMC_MakeStatics;
};
