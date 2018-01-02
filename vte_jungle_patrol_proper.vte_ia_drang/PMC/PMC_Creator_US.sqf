/*

	US side unit creation

*/
//#CreatorUS
PMC_CreatorUS =
{
private ["_grp","_A","_ran","_SoldierSelect","_B","_MaxUnits","_waypointRanPosit","_tlogic","_targetpoint"];
	// US Army

	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	_ran = random 1;
	_MaxUnits = _this select 0;

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
		_SoldierSelect = US_Army_Array select random (count US_Army_Array - 1);

		_SoldierSelect createUnit [getPosASL US_Start, _grp, "", _ran, "CORPORAL"];
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
	[_grp, _targetpoint, _waypointRanPosit] call PMC_Create_Waypoints;

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
		_SoldierSelect = US_MC_Array select random (count US_MC_Array - 1);

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
	[_grp, _targetpoint, _waypointRanPosit] call PMC_Create_Waypoints;

	if (PMC_debug) then
	{
		player sidechat format["MARINES Created: %1 men, units in group: %2 men, West all: %3",_B,_B+1,(count aiwest)];
		diag_log format ["MARINES Created: %1 men, units in group: %2 men, West all: %3", _B, _B+1, (count aiwest)];
	};
};
