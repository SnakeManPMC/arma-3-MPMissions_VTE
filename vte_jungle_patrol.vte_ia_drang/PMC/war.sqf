/*

	PMC Jungle Patrol main war script

*/

private
[
	"_EastKilled",
	"_MaxUnits",
	"_NVA_Array",
	"_PMC_Create_Waypoints",
	"_PMC_OPFOR_Starts",
	"_ran",
	"_targetpoint",
	"_tlogic",
	"_US_Army_Array",
	"_US_MC_Array",
	"_VC_Array",
	"_waypointRanPosit",
	"_WestKilled"
];

// maximum unit numbers
PMC_VCNum = 150;
PMC_USNum = 100;

// max units is PER SQUAD you dimwit
_MaxUnits = 6;
// limit of KIAs in each side for victory condition (or failure)
_EastKilled = 200;
_WestKilled = 200;

diag_log format
[
	"PMC_VCNum: %1, PMC_USNum: %2, _MaxUnits: %3, _EastKilled: %4, _WestKilled: %5",
	PMC_VCNum,
	PMC_USNum,
	_MaxUnits,
	_EastKilled,
	_WestKilled
];

// units counted from a triggers aiwest and aieast
PMC_blufor = 0;
PMC_opfor = 0;
PMC_blufor = count aiwest;
publicVariable "PMC_blufor";
PMC_opfor = count aieast;
publicVariable "PMC_opfor";

// random starting locations for enemy
_PMC_OPFOR_Starts =
[
	vc_start1,
	vc_start2,
	vc_start3,
	vc_start4,
	vc_start5,
	vc_start6,
	vc_start7,
	vc_start8,
	vc_start9,
	vc_start10,
	vc_start11,
	vc_start12,
	vc_start13,
	vc_start14,
	vc_start15
];

// this is all the US army soldiers to choose random team member.
_US_Army_Array =
[
	"VTE_armysniperw",
	"VTE_armyw",
	"VTE_armywat",
	"VTE_armywgl",
	"VTE_armywlaw",
	"VTE_armywmedic",
	"VTE_armywmg",
	"VTE_armywmortar",
	"VTE_armywrto"
];

_US_MC_Array =
[
	"VTE_sniperw",
	"VTE_soldierw",
	"VTE_soldierwat",
	"VTE_soldierwgl",
	"VTE_soldierwlaw",
	"VTE_soldierwm14",
	"VTE_soldierwmedic",
	"VTE_soldierwmg",
	"VTE_soldierwmortar",
	"VTE_soldierwo",
	"VTE_soldierwon",
	"VTE_soldierwrto"
];

// NVA and VC soldier name array
_NVA_Array =
[
	"VTE_nvaaa",
	"VTE_nvaat",
	"VTE_nvaengineer",
	"VTE_nvamark",
	"VTE_nvamedic",
	"VTE_nvamg",
	"VTE_NVAsoldier",
	"VTE_nvarecon",
	"VTE_nvareconrto",
	"VTE_nvarpg",
	"VTE_nvarto",
	"VTE_nvasapper",
	"VTE_nvasoldier"
];

_VC_Array =
[
	"VTE_vcat",
	"VTE_vcengineer",
	"VTE_vcmark",
	"VTE_vcmedic",
	"VTE_vcmg",
	"VTE_vcmortar",
	"VTE_vcrecon",
	"VTE_vcrpg",
	"VTE_vcsapper",
	"VTE_vcsoldier",
	"VTE_vcsoldier2",
	"VTE_vcsoldier3",
	"VTE_vcsoldier4"
];

_PMC_Create_Waypoints =
{
/*
this waypoint setup is completely different from the good old OFP version,
where groups were recycled after arriving to objective, they were then tasked
into another objective and this was looped endlessly.

However as you can see below, this only sends them into the target objective and
then they will stay there in guard mode. This will most likely resulting a long
mission ending up being quite random as the groups are running around after fights.
*/
	// waypoints, we add couple to make patrol area.
	// first waypoint
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 1] setWaypointBehaviour "SAFE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "LIMITED";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "MOVE";
	[_grp, 1] setWaypointTimeout [60*2, 0, 60*20];

	// second waypoint
	_grp addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_grp, 2] setWaypointType "MOVE";
	[_grp, 2] setWaypointTimeout [60*2, 0, 60*20];

	// guard waypoint, this was cycle before
	_grp addWaypoint [_targetpoint, 0];
	[_grp, 3] setWaypointType "GUARD";
};

/*
make waypoints for the editor placed groups, which are now already included into
the PMC_groups array.
*/
{
	_waypointRanPosit = 200;
	// select one starting point
	_ran = (floor random (count PMC_targets));
	_tlogic = (PMC_targets select _ran);
	_targetpoint = getPosASL _tlogic;

	// waypoints, we add couple to make patrol area.
	// first waypoint
	_x addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_x, 1] setWaypointBehaviour "SAFE";
	[_x, 1] setWaypointCombatMode "RED";
	[_x, 1] setWaypointSpeed "LIMITED";
	[_x, 1] setWaypointFormation "WEDGE";
	[_x, 1] setWaypointType "MOVE";
	[_x, 1] setWaypointTimeout [60*2, 0, 60*20];

	// second waypoint
	_x addWaypoint [_targetpoint, _waypointRanPosit*2];
	[_x, 2] setWaypointType "MOVE";
	[_x, 2] setWaypointTimeout [60*2, 0, 60*20];

	// cycle waypoint
	_x addWaypoint [_targetpoint, 0];
	[_x, 3] setWaypointType "CYCLE";
	// set these groups for deletion.
	[_x] execVM "PMC\PMC_groupRecycle.sqf";
} forEach PMC_groups;

/*

	#CreatorVC
*/
_PMC_CreatorVC =
{
	_ran = 0;
	_ran = random(1);

	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	_vcstarter = NVA_Bases select random (count NVA_Bases -1);
	_fish = getPosASL _vcstarter;

//	"VTE_vcofficer" createUnit [_fish, vcinf1, "e2 = this", _ran, "SERGEANT"];
	"VTE_vcofficer" createUnit [_fish, _grp, "", _ran, "SERGEANT"];
//	[e2] join grpnull;
//	_vc1 = group e2;
	PMC_opfor = PMC_opfor + 1;
	publicVariable "PMC_opfor";

	_A = 1;
	// was just random before, so could return 0 also :)
	_B = 1 + (floor random _MaxUnits);

	//#GroupLoop
	while {_A < _B} do
	{
		_A = _A + 1;
		_ran = random(1);
		_SoldierSelect = _VC_Array select random (count _VC_Array - 1);

		_SoldierSelect createUnit [_fish, _grp, "", _ran, "CORPORAL"];
		PMC_opfor = PMC_opfor + 1;
		publicVariable "PMC_opfor";
	};

	// killed eventhandler for all members of the group
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	// set this group for deletion.
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";
	PMC_groups = PMC_groups + [_grp];

	_waypointRanPosit = 200;
	// select one starting point
	_ran = (floor random (count PMC_targets));
	_tlogic = (PMC_targets select _ran);
	_targetpoint = getPosASL _tlogic;

	// create waypoints
	[] call _PMC_Create_Waypoints;

	if (PMC_debug) then
	{
		player sidechat format["VC Created: %1 men, units in group: %2 men, VC all: %3",_B,_B+1,(count aieast)];
		diag_log format ["VC Created: %1 men, units in group: %2 men, VC all: %3", _B, _B+1, (count aieast)];
	};

	// NVA
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	_ran = random(1);
	_vcstarter = NVA_Bases select random (count NVA_Bases - 1);
	_fish = getPosASL _vcstarter;

	"VTE_NVAofficer" createUnit [_fish, _grp, "", _ran, "SERGEANT"];
	PMC_opfor = PMC_opfor + 1;
	publicVariable "PMC_opfor";

	_A = 1;
	// was just random before, so could return 0 also :)
	_B = 1 + (floor random _MaxUnits);

	//#GroupLoop2
	while {_A < _B} do
	{
		_A = _A + 1;
		_ran = random(1);
		_SoldierSelect = _NVA_Array select random (count _NVA_Array - 1);

		_SoldierSelect createunit [_fish, _grp, "", _ran, "CORPORAL"];
		PMC_opfor = PMC_opfor + 1;
		publicVariable "PMC_opfor";
	};

	// killed eventhandler for all members of the group
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	// set this group for deletion.
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";
	PMC_groups = PMC_groups + [_grp];

	_waypointRanPosit = 200;
	// select one starting point
	_ran = (floor random (count PMC_targets));
	_tlogic = (PMC_targets select _ran);
	_targetpoint = getPosASL _tlogic;

	// create waypoints
	[] call _PMC_Create_Waypoints;

	if (PMC_debug) then
	{
		player sidechat format["NVA Created: %1 men, units in group: %2 men, NVA all: %3",_B,_B+1,(count aieast)];
		diag_log format ["NVA Created: %1 men, units in group: %2 men, NVA all: %3", _B, _B+1, (count aieast)];
	};
};



/*

	US side unit creation

*/
//#CreatorUS
_PMC_CreatorUS =
{
	// US Army
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	_ran = random 1;

	"VTE_armywo" createUnit [getPosASL US_Start, _grp, "", _ran, "SERGEANT"];
//	[e2] join grpnull;
//	_vc1 = group e2;
	PMC_blufor = PMC_blufor + 1;
	publicVariable "PMC_blufor";

	_A = 1;
	// was just random before, so could return 0 also :)
	_B = 1 + (floor random _MaxUnits);

	//#GroupLoopWest
	while {_A < _B} do
	{
		_A = _A + 1;
		_ran = random 1;
		_SoldierSelect = _US_Army_Array select random (count _US_Army_Array - 1);

		_SoldierSelect createUnit [getPosASL US_Start, _grp, "", _ran, "CORPORAL"];
		PMC_blufor = PMC_blufor + 1;
		publicVariable "PMC_blufor";
	};

	// killed eventhandler for all members of the group
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _vc1;

	// set this group for deletion.
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";
	PMC_groups = PMC_groups + [_grp];

	_waypointRanPosit = 200;
	// select one starting point
	_ran = (floor random (count PMC_targets));
	_tlogic = (PMC_targets select _ran);
	_targetpoint = getPosASL _tlogic;

	// create waypoints
	[] call _PMC_Create_Waypoints;

	if (PMC_debug) then
	{
		player sidechat format["US ARMY Created: %1 men, units in group: %2 men, West all: %3",_B,_B+1,(count aiwest)];
		diag_log format ["US ARMY Created: %1 men, units in group: %2 men, West all: %3", _B, _B+1, (count aiwest)];
	};

	// Marines

	_ran = random 1;

	"VTE_soldierwo" createUnit [getPosASL US_Start2, _grp, "", _ran, "SERGEANT"];
//	[e2] join grpnull;
//	_grp = group e2;
	PMC_blufor = PMC_blufor + 1;
	publicVariable "PMC_blufor";

	_A = 1;
	// was just random before, so could return 0 also :)
	_B = 1 + (floor random _MaxUnits);

	//#GroupLoop2West
	while {_A < _B} do
	{
		_A = _A + 1;
		_ran = random 1;
		_SoldierSelect = _US_MC_Array select random (count _US_MC_Array - 1);

		_SoldierSelect createUnit [getPosASL US_Start2, _grp, "", _ran, "CORPORAL"];
		PMC_blufor = PMC_blufor + 1;
		publicVariable "PMC_blufor";
	};

	// killed eventhandler for all members of the group
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	// set this group for deletion.
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";
	PMC_groups = PMC_groups + [_grp];

	_waypointRanPosit = 200;
	// select one starting point
	_ran = (floor random (count PMC_targets));
	_tlogic = (PMC_targets select _ran);
	_targetpoint = getPosASL _tlogic;

	// create waypoints
	[] call _PMC_Create_Waypoints;

	if (PMC_debug) then
	{
		player sidechat format["MARINES Created: %1 men, units in group: %2 men, West all: %3",_B,_B+1,(count aiwest)];
		diag_log format ["MARINES Created: %1 men, units in group: %2 men, West all: %3", _B, _B+1, (count aiwest)];
	};
};
/*
	end of functions
*/



/*

	Start

*/
// was {true} before
while {!PMC_200KIAs} do
{
	// create some NVA and VC
	if (count aieast < PMC_VCNum) then
	{
		[] call _PMC_CreatorVC;
		sleep 1;
	};

	// create some US
	if (count aiwest < PMC_USNum) then
	{
		[] call _PMC_CreatorUS;
		sleep 1;
	};

	// mission end US wins, NVA KIAs reach set level
	if (PMC_opfor - count aieast > _EastKilled) then
	{
		diag_log format ["PMC_200KIAs achieved. PMC_opfor: %1, aieast: %2, PMC_blufor: %3, aiwest: %4, PMC_killedNum: %5", PMC_opfor, count aieast, PMC_blufor, count aiwest, PMC_killedNum];
		// ending trigger, US victory.
		PMC_200KIAs = true;
		publicVariable "PMC_200KIAs";
		// this doesnt work, why?
		if (true) exitWith{};
	};

	// mission end NVA wins, US KIAs reach set level
	if (PMC_blufor - count aiwest > _WestKilled) then
	{
		diag_log format ["PMC_endingBad achieved. PMC_opfor: %1, aieast: %2, PMC_blufor: %3, aiwest: %4, PMC_killedNum: %5", PMC_opfor, count aieast, PMC_blufor, count aiwest, PMC_killedNum];
		// ending trigger, NVA/VC victory.
		PMC_endingBad = true;
		publicVariable "PMC_endingBad";
		// this doesnt work, why?
		if (true) exitWith{};
	};

	// debug text
	if (PMC_debug) then
	{
		player sidechat format["waiting for action... VC KIAs: %1, US KIAs: %2, all units: %3, PMC_opfor: %4, PMC_blufor: %5. Groups: %6, PMC_killedNum: %7", (PMC_opfor - count aieast), (PMC_blufor - count aiwest), (count aieast + count aiwest), PMC_opfor, PMC_blufor, PMC_grpNum, PMC_killedNum];
		diag_log format
      		["waiting for action... VC KIAs: %1, US KIAs: %2, all units: %3, PMC_opfor: %4, PMC_blufor: %5. Groups: %6, PMC_killedNum: %7",
      			(PMC_opfor - count aieast),
      			(PMC_blufor - count aiwest),
      			(count aieast + count aiwest),
      			PMC_opfor,
      			PMC_blufor,
      			PMC_grpNum,
      			PMC_killedNum
      		];
	};

	// idle before we have tasks to do
	waitUntil
	{
		sleep 10;
		( (count aieast < PMC_VCNum) || (count aiwest < PMC_USNum) );
	};
};
