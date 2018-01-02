/*

	Main war script, creates units and waypoints for them.
	Units first created and then sent on random locations.

*/
private ["_respawnpoint","_waypointRanPosit","_PMC_maxunits","_MaxBLUFOR","_MaxOPFOR","_targetPoint"];

// select target location
//_targetNum = count PMC_targets;
//_PMC_temptargets = [];
//_PMC_temptargets = PMC_targets;
_waypointRanPosit = 100;

[usinf1] execVM "PMC\PMC_send_editor_group.sqf";
[vcinf1] execVM "PMC\PMC_send_editor_group.sqf";
// editor placed usmedics1 group
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units usmedics1;
[usmedics1] execVM "PMC\PMC_groupRecycle.sqf";
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units arvninf1;
[arvninf1] execVM "PMC\PMC_groupRecycle.sqf";

//_targetNum = count PMC_targets;

// default
_PMC_maxunits = 100;
// from server start
// "50", "100", "150", "200", "250", "300", "350", "400", "450", "500"
switch (paramsarray select 3) do
{
	case 1:
	{
		_PMC_maxunits = 50;
	};

	case 2:
	{
		_PMC_maxunits = 100;
	};

	case 3:
	{
		_PMC_maxunits = 150;
	};

	case 4:
	{
		_PMC_maxunits = 200;
	};

	case 5:
	{
		_PMC_maxunits = 250;
	};

	case 6:
	{
		_PMC_maxunits = 300;
	};

	case 7:
	{
		_PMC_maxunits = 350;
	};

	case 8:
	{
		_PMC_maxunits = 400;
	};

	case 9:
	{
		_PMC_maxunits = 450;
	};

	case 10:
	{
		_PMC_maxunits = 500;
	};
};

// if all fails
_MaxOPFOR = 70;
_MaxBLUFOR = 20;

// (paramsarray select 4)
// "1:0.5", "1:1", "1:1.5", "1:2", "1:5"
switch (paramsarray select 4) do
{
	case 1:
	{
		// 100 seed = 66 blufor, 44 opfor
		_MaxBLUFOR = (_PMC_maxunits/1.5);
		_MaxOPFOR = (_PMC_maxunits/2.25);
	};

	case 2:
	{
		// 100 seed = 50 blufor, 50 opfor
		_MaxBLUFOR = (_PMC_maxunits/2);
		_MaxOPFOR = (_PMC_maxunits/2);
	};

	case 3:
	{
		// 100 seed = 44 blufor, 66 opfor
		_MaxBLUFOR = (_PMC_maxunits/2.25);
		_MaxOPFOR = (_PMC_maxunits/1.5);
	};

	case 4:
	{
		// 100 seed = 25 blufor, 75 opfor
		_MaxBLUFOR = (_PMC_maxunits/4);
		_MaxOPFOR = (_PMC_maxunits/1.35);
	};

	case 5:
	{
		// 100 seed = 10 blufor, 90 opfor
		_MaxBLUFOR = (_PMC_maxunits/10);
		_MaxOPFOR = (_PMC_maxunits/1.1);
	};
};

// description.ext params array thing
// default
PMC_VictoryCondition = 1000;
// from server start
switch (paramsarray select 2) do
{
//"100 KIA", "500 KIA", "1000 KIA", "5000 KIA", "10,000 KIA"
	case 1: { PMC_VictoryCondition = 100; };
	case 2: { PMC_VictoryCondition = 500; };
	case 3: { PMC_VictoryCondition = 1000; };
	case 4: { PMC_VictoryCondition = 5000; };
	case 5: { PMC_VictoryCondition = 10000; };
};

// set for network, for briefing.sqf
publicVariable "PMC_VictoryCondition";

diag_log format ["_PMC_maxunits: %1, _MaxBLUFOR: %2, _MaxOPFOR: %3, PMC_VictoryCondition: %4", _PMC_maxunits, _MaxBLUFOR, _MaxOPFOR, PMC_VictoryCondition];

// loop to create units until we have created 1000 of them :)
while {PMC_killedNum < PMC_VictoryCondition} do
{
	waitUntil
	{
		sleep 5;
		// until; BLUFOR or OPFOR list is smaller than its limit AND all units is lower than its limit ;)
		( (((count list PMC_opfor_list < _MaxOPFOR) || (count list PMC_blufor_list < _MaxBLUFOR)) && (count list PMC_opfor_list + count list PMC_blufor_list) < _PMC_maxunits) );
	};

	// highly random occurance of NVA massive attack to plei me ;)
	if (!PMC_NVA_Attack_Running && (random 100 < 10)) then
	{
		// another iffy :)
		if ([list pmc_opfor_list] call PMC_countGroups < 140) then
		{
			[] execVM "PMC\PMC_NVA_Massive_Attack.sqf";
			// small delay so next check has increased unit amounts
			sleep 5;
		};
	};

	// opfor list is lower, create new opfor guys
	if (count list PMC_opfor_list < _MaxOPFOR && ([list pmc_opfor_list] call PMC_countGroups < 140) ) then
	{
		_respawnpoint = [] call PMC_SelectOPFORStartPosit;
		_targetPoint = (getPosASL call PMC_Select_Target);
		[_respawnpoint, _targetPoint, _waypointRanPosit] call PMC_MakeGuardInfOPFOR;

		_respawnpoint = [] call PMC_SelectOPFORStartPosit;
		_targetPoint = (getPosASL call PMC_Select_Target);
		[_respawnpoint, _targetPoint, _waypointRanPosit] call PMC_MakePatrolInfOPFOR;

		_respawnpoint = [] call PMC_SelectOPFORStartPosit;
		_targetPoint = (getPosASL call PMC_Select_Target);
		[_respawnpoint, _targetPoint, _waypointRanPosit] call PMC_Create_NVA_Sniper;

		_respawnpoint = [] call PMC_SelectOPFORStartPosit;
		_targetPoint = (getPosASL call PMC_Select_Target);
		[_respawnpoint] call PMC_Create_NVA_Recon;
		
		diag_log format["PMC_countGroups, OPFOR: %1", ([list pmc_opfor_list] call PMC_countGroups)];
	};

	// blufor list is lower AND only 2 transport helos are flying...
	if ( (count list PMC_blufor_list < _MaxBLUFOR) && (PMC_InfTransport < 3) ) then
	{
		if ( ([list pmc_blufor_list] call PMC_countGroups < 140) ) then
		{
			// but now we spawn them into the HQ to get helo ferry :)
			_respawnpoint = getPosASL CV_helopad;
			_targetPoint = (getPosASL call PMC_Select_Target);
			[_respawnpoint, _targetPoint, _waypointRanPosit] call PMC_MakeGuardInfBLUFOR;

			// this is 50m behind from the first helo, so they collide.
			_respawnpoint = [(getPosASL CV_helopad select 0),(getPosASL CV_helopad select 1)-50,0];
			_targetPoint = (getPosASL call PMC_Select_Target);
			[_respawnpoint, _targetPoint, _waypointRanPosit] call PMC_MakePatrolInfBLUFOR;

			diag_log format["PMC_countGroups, BLUFOR: %1", ([list pmc_blufor_list] call PMC_countGroups)];
		};
	};

	// just to relax a bit
	diag_log format
	[
		"PMC_war sleep 60sec. PMC_opfor_list: %1, PMC_blufor_list: %2, PMC_InfTransport: %3, PMC_grpNum: %4, PMC_corpses: %5, PMC_cu: %6, PMC_killedNum: %7, PMC_helo_cv: %8",
		(count list PMC_opfor_list),
		(count list PMC_blufor_list),
		PMC_InfTransport,
		PMC_grpNum,
		(count PMC_corpses),
		PMC_cu,
		PMC_killedNum,
		PMC_helo_cv
	];
	sleep 60;
};

diag_log format["PMC_war.sqf main loop finished, time is now: %1, wait for final mission end...", time];

/*
this mission is done, good job :)
but still one last wait until mission is complete...
*/
waitUntil
{
	sleep 5;
	// wait until mission settles down as the fight goes on, so we can happily end it.
	( (count list PMC_opfor_list + count list PMC_blufor_list) < _PMC_maxunits );
};

diag_log format["PMC_war.sqf finished with proper victory condition, time is now: %1, BLUFOR: %2, OPFOR: %3", time, count list PMC_blufor_list, count list PMC_opfor_list];

// missio over, launch ending cutscene!
PMC_launch_ending_cutscene = true;
publicVariable "PMC_launch_ending_cutscene";
