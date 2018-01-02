/*

	#CreatorVC
	
Syntax:
call compile preprocessFileLineNumbers "PMC\PMC_Creator_VC.sqf";

Eample
[_MaxUnits] call PMC_CreatorVC;

*/
PMC_CreatorVC =
{
private ["_grp","_A","_ran","_SoldierSelect","_vcstarter","_fish","_B","_MaxUnits","_waypointRanPosit","_tlogic","_targetpoint"];

	_MaxUnits = _this select 0;
	
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
		_SoldierSelect = VC_Array select random (count VC_Array - 1);

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
	[_grp, _targetpoint, _waypointRanPosit] call PMC_Create_Waypoints;

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
		_SoldierSelect = NVA_Array select random (count NVA_Array - 1);

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
	[_grp, _targetpoint, _waypointRanPosit] call PMC_Create_Waypoints;

	if (PMC_debug) then
	{
		player sidechat format["NVA Created: %1 men, units in group: %2 men, NVA all: %3",_B,_B+1,(count aieast)];
		diag_log format ["NVA Created: %1 men, units in group: %2 men, NVA all: %3", _B, _B+1, (count aieast)];
	};
};
