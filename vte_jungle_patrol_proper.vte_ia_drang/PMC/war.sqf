/*

	PMC Jungle Patrol main war script

*/

private ["_EastKilled","_MaxUnits","_ran","_targetpoint","_tlogic","_waypointRanPosit","_WestKilled","_statusCheck"];

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
[] execVM "PMC\PMC_OPFOR_Starts.sqf";

[] execVM "PMC\PMC_US_Army_Array.sqf";

[] execVM "PMC\PMC_US_MC_Array.sqf";

// list of NVA unit class names
[] execVM "PMC\PMC_NVA_Array.sqf";

// list of VC unit class names
[] execVM "PMC\PMC_VC_Array.sqf";

call compile preprocessFileLineNumbers "PMC\PMC_Create_Waypoints.sqf";

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

call compile preprocessFileLineNumbers "PMC\PMC_Creator_VC.sqf";

call compile preprocessFileLineNumbers "PMC\PMC_Creator_US.sqf";
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
		[_MaxUnits] call PMC_CreatorVC;
		sleep 1;
	};

	// create some US
	if (count aiwest < PMC_USNum) then
	{
		[_MaxUnits] call PMC_CreatorUS;
		sleep 1;
	};

	// mission end US wins, NVA KIAs reach set level
	if (PMC_opfor - count aieast > _EastKilled) exitWith
	{
		diag_log format ["PMC_200KIAs achieved. PMC_opfor: %1, aieast: %2, PMC_blufor: %3, aiwest: %4, PMC_killedNum: %5", PMC_opfor, count aieast, PMC_blufor, count aiwest, PMC_killedNum];
		// ending trigger, US victory.
		PMC_200KIAs = true;
		publicVariable "PMC_200KIAs";
	};

	// mission end NVA wins, US KIAs reach set level
	if (PMC_blufor - count aiwest > _WestKilled) exitWith
	{
		diag_log format ["PMC_endingBad achieved. PMC_opfor: %1, aieast: %2, PMC_blufor: %3, aiwest: %4, PMC_killedNum: %5", PMC_opfor, count aieast, PMC_blufor, count aiwest, PMC_killedNum];
		// ending trigger, NVA/VC victory.
		PMC_endingBad = true;
		publicVariable "PMC_endingBad";
	};

	// debug text
	if (PMC_debug) then
	{
		_statusCheck = format
		[
			"waiting for action... VC KIAs: %1, US KIAs: %2, all units: %3, PMC_opfor: %4, PMC_blufor: %5. Groups: %6, PMC_killedNum: %7, FPS: %8",
			(PMC_opfor - count aieast), 
			(PMC_blufor - count aiwest), 
			(count aieast + count aiwest), 
			PMC_opfor, 
			PMC_blufor, 
			PMC_grpNum, 
			PMC_killedNum,
			diag_fps
		];
      		diag_log _statusCheck;
	};

	// idle before we have tasks to do
	waitUntil
	{
		sleep 10;
		( (count aieast < PMC_VCNum) || (count aiwest < PMC_USNum) );
	};
};
