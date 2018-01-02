/*

Big defenses for the mission objective location.

Syntax:
[targetPoint] execVM "PMC\PMC_objective_def_OPFOR.sqf";

*/

private [
	"_targetpoint","_respawnpoint","_myVec","_vcl","_grp","_wp","_p",
	"_tent1","_tent2","_abox1","_abox2","_abox3","_waypointRanPosit","_a",
	"_PMC_RandomTargetLocation"
];

// grab the objective location from parameter
_targetpoint = _this select 0;
_respawnpoint = _targetpoint;

	// OPFOR stuff

/*
not suitable (statics): "VTE_zu23","VTE_sa2launcher","VTE_sa2fansong"
VTE_dshkm, VTE_dshkmvc, VTE_searchlightnva, VTE_searchlightvc
*/
PMC_opfor_vehicle_heavy = ["vte_pt76","vte_t55","vte_zsu57"];
PMC_opfor_vehicle_car_armed = ["VTE_nvauaz","VTE_nvauazmg"];
PMC_opfor_vehicle_car_unarmed = ["VTE_nvatruck","VTE_nvatruckopen","VTE_vctruck","VTE_vctruckopen","VTE_nvatruckammo","VTE_nvatruckfuel","VTE_nvatruckrepair"];
_all_OPFOR_units = ["VTE_NVAofficer","VTE_NVAofficer","VTE_NVAsoldier","VTE_NVArto","VTE_NVAmg","VTE_NVArpg","VTE_NVArpg","VTE_NVArpg","VTE_NVArpg","VTE_NVAengineer","VTE_NVAmedic","VTE_NVAmedic","VTE_NVAmedic","VTE_NVAmedic","VTE_NVAsoldier","VTE_NVAsoldier","VTE_NVAsoldier","VTE_NVAsoldier","VTE_NVAsoldier","VTE_NVAsoldier","VTE_NVAsoldier","VTE_NVAsoldier","VTE_NVAsoldier","VTE_NVAsoldier","VTE_NVAofficer","VTE_NVAofficer","VTE_NVAofficer","VTE_NVAreconrto","VTE_NVArecon","VTE_NVAsapper","VTE_NVAcrew","VTE_NVAengineer","VTE_NVAaa","VTE_NVAat","VTE_NVArpg","VTE_NVAsoldier","VTE_NVAmedic","VTE_NVAmark","VTE_NVAmg"];
_all_OPFOR_unitsVC = ["VTE_vcgrenadier2","VTE_vcgrenadier","VTE_vcrpg4","VTE_vcrpg3","VTE_vcrpg2","VTE_vcengineer6","VTE_vcengineer5","VTE_vcengineer4","VTE_vcengineer3","VTE_vcengineer2","VTE_vcmg4","VTE_vcmg3","VTE_vcmg2","VTE_vcmedic6","VTE_vcmedic5","VTE_vcmedic4","VTE_vcmedic3","VTE_vcmedic2","VTE_vcsoldier18","VTE_vcsoldier17","VTE_vcsoldier16","VTE_vcsoldier15","VTE_vcsoldier14","VTE_vcsoldier13","VTE_vcsoldier12","VTE_vcsoldier11","VTE_vcsoldier10","VTE_vcsoldier9","VTE_vcsoldier8","VTE_vcsoldier7","VTE_vcsoldier6","VTE_vcsoldier5","VTE_vcofficer7","VTE_vcofficer6","VTE_vcofficer5","VTE_vcofficer4","VTE_vcofficer3","VTE_vcofficer2","VTE_vcrecon","VTE_vcsapper3","VTE_vcsapper2","VTE_vcsapper","VTE_vcengineer","VTE_vcat","VTE_vcrpg","VTE_vcmortar","VTE_vcmedic","VTE_vcmark","VTE_vcmg","VTE_vcsoldier4","VTE_vcsoldier3","VTE_vcsoldier2","VTE_vcofficernight","VTE_vcofficer"];
_maxOPFORA = count PMC_opfor_vehicle_heavy;
_maxOPFORA2 = count PMC_opfor_vehicle_car_armed;
_maxOPFORB = count PMC_opfor_vehicle_car_unarmed;

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

_PMC_MakeTankOPFOR =
{
	_myVec = (PMC_opfor_vehicle_heavy select round random (_maxOPFORA - 1));
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = _myVec createVehicle _pos;
//	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 0) moveInCommander _vcl;
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	// these to function somehow nicely, please :(
//	{_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}]} foreach units _grp;

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
};

_PMC_MakeTankOPFORHeavy =
{
	_myVec = (PMC_opfor_vehicle_heavy select round random (_maxOPFORA - 1));
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = _myVec createVehicle _pos;
//	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// first vehicle	
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInCommander _vcl;
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	// second vehicle
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = objNull;
	_vcl = _myVec createVehicle _pos;
//	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 3) moveInCommander _vcl;
	(units _grp select 4) moveInGunner _vcl;
	(units _grp select 5) moveInDriver _vcl;

	// third vehicle	
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = objNull;
	_vcl = _myVec createVehicle _pos;
//	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 6) moveInCommander _vcl;
	(units _grp select 7) moveInGunner _vcl;
	(units _grp select 8) moveInDriver _vcl;

	// fourth vehicle	
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = objNull;
	_vcl = _myVec createVehicle _pos;
//	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 9) moveInCommander _vcl;
	(units _grp select 10) moveInGunner _vcl;
	(units _grp select 11) moveInDriver _vcl;

	// these to function somehow nicely, please :(
//	{_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}]} foreach units _grp;

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
};

_PMC_MakeTankOPFOR2 =
{
	_myVec = (PMC_opfor_vehicle_car_armed select round random (_maxOPFORA2 - 1));
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = _myVec createVehicle _pos;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 0) moveInDriver _vcl;
	(units _grp select 1) moveInGunner _vcl;

	// these to function somehow nicely, please :(
//	{_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}]} foreach units _grp;
//	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
};

_PMC_MakeGuardInfOPFOR =
{
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	_pos = [] call _PMC_RandomTargetLocation;
	
	"vte_nvaofficer" createUnit [_pos, _grp, "", (random 1), "LIEUTENANT"];
	"vte_nvarto" createUnit [_pos, _grp, "", (random 1), "SERGEANT"];
	"vte_nvasoldier" createUnit [_pos, _grp, "", (random 1), "SERGEANT"];
	"vte_nvamg" createUnit [_pos, _grp, "", 1, "CORPORAL"];
	"vte_nvarpg" createUnit [_pos, _grp, "", (random 1), "CORPORAL"];
	"vte_nvamedic" createUnit [_pos, _grp, "", (random 1), "PRIVATE"];
	"vte_nvasoldier" createUnit [_pos, _grp, "", (random 1), "PRIVATE"];
	"vte_nvamg" createUnit [_pos, _grp, "", 1, "PRIVATE"];
	"vte_nvamark" createUnit [_pos, _grp, "", 1, "PRIVATE"];

	// these to function somehow nicely, please :(
//	{_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}]} foreach units _grp;

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "NORMAL";
	_grp setFormation "WEDGE";

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "NORMAL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";

};

_PMC_MakeSniperOPFOR =
{
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	_pos = [] call _PMC_RandomTargetLocation;
	
	"vte_vcofficer" createUnit [_pos, _grp, "", 1, "SERGEANT"];
	"vte_vcmark" createUnit [_pos, _grp, "", 1, "CORPORAL"];

	// these to function somehow nicely, please :(
//	{_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}]} foreach units _grp;

	_grp setBehaviour "STEALTH";
	_grp setCombatMode "YELLOW";
	_grp setSpeedMode "LIMITED";
	_grp setFormation "WEDGE";

	_wp = 1;

	// waypoints, we add couple to make patrol area
	// first
	_grp addWaypoint [_targetpoint, _waypointRanPosit*5];
	[_grp, _wp] setWaypointBehaviour "STEALTH";
	[_grp, _wp] setWaypointCombatMode "YELLOW";
	[_grp, _wp] setWaypointSpeed "LIMITED";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "MOVE";
	[_grp, _wp] setWaypointTimeout [60*2, 0, 60*20];

	// second
	_grp addWaypoint [_targetpoint, _waypointRanPosit*5];
	[_grp, (_wp + 1)] setWaypointType "MOVE";
	[_grp, (_wp + 1)] setWaypointTimeout [60*2, 0, 60*20];

	// cycle
	_grp addWaypoint [_targetpoint, 0];
	[_grp, (_wp + 2)] setWaypointType "CYCLE";

};

_PMC_MakeVehPatrolOPFOR =
{
	_pos = [] call _PMC_RandomTargetLocation;
	_vcl = "VTE_nvauazmg" createVehicle _pos;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"vte_nvacrew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 0) moveInDriver _vcl;
	(units _grp select 1) moveInGunner _vcl;

	// these to function somehow nicely, please :(
//	{_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}]} foreach units _grp;
//	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setBehaviour "SAFE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	// do the random patrolling waypoints
	_wp = 1;
	_grp addWaypoint [_targetpoint, 1000];
	[_grp, _wp] setWaypointBehaviour "SAFE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "MOVE";

	_wp = 2;
	// add one last for cycle, so if he survives, he does it all over again.
	_grp addWaypoint [_respawnpoint, 0];
	[_grp, _wp] setWaypointBehaviour "SAFE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "CYCLE";
};

_PMC_MakeStatics =
{
	_statics = ["VTE_zu23","VTE_sa2launcher","VTE_sa2fansong","VTE_dshkm","VTE_searchlightnva"];

	_pos = [] call _PMC_RandomTargetLocation;

	_myVec = (_statics select round random (count _statics - 1));
	_vcl = _myVec createVehicle _pos;	

	if (PMC_debug) then { player sideChat format["created static: %1",_myVec]; };
//	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_vcl setpos _respawnpoint;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"vte_nvasoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInGunner _vcl;

	// these to function somehow nicely, please :(
//	{_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}]} foreach units _grp;
//	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setBehaviour "SAFE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";
};

// our waypoints random circle range
_waypointRanPosit = 500;

// create units
_a = 0;
while { _a < (random 2) } do
{
	_a = _a + 1;

	[] call _PMC_MakeTankOPFOR;
	[] call _PMC_MakeGuardInfOPFOR;
	[] call _PMC_MakeTankOPFORHeavy;
	[] call _PMC_MakeSniperOPFOR;
	[] call _PMC_MakeVehPatrolOPFOR;
	[] call _PMC_MakeStatics;
	sleep 2;
};
