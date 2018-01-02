
private ["_grp","_PMC_ind","_ran","_safePos","_targetpoint","_Max_IND_On_Map","_victoryCondition","_sleeptime","_respawnpoint", "_countUnits"];

// maximum number of opfor on the map at one time
_Max_IND_On_Map = 50; // 100 with three sides causes FPS 5 on server

// how many units to create until ending the loop
_victoryCondition = 1000;

// counter for how many units have been created
_PMC_ind = 0;

// random sleep time
_sleeptime = (2 + random 5);

_respawnpoint = getPosASL pmc_ind_start_3;

_countUnits = compile preprocessFileLineNumbers "PMC\PMC_Count_Group_Units.sqf";

while {_PMC_ind < _victoryCondition} do
{
	if ((count list pmc_ind_list) < _Max_IND_On_Map) then
	{
		_safePos = [_respawnpoint, 0, 100, 10, 0, 20, 0] call BIS_fnc_findSafePos;

		_ran = floor (random 4);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_safePos, resistance, (configFile >> "CfgGroups" >> "Guerrila" >> "VTE_Rebels" >> "infantry" >> "VTE_Cambodian_Mercenary")] call BIS_fnc_spawnGroup;
			};
			case 1:
			{
				_grp = [_safePos, resistance, (configFile >> "CfgGroups" >> "Guerrila" >> "VTE_Rebels" >> "infantry" >> "VTE_Chieu_Hoi")] call BIS_fnc_spawnGroup;
			};
			case 2:
			{
				_grp = [_safePos, resistance, (configFile >> "CfgGroups" >> "Guerrila" >> "VTE_Rebels" >> "infantry" >> "VTE_Bushman_Scouts")] call BIS_fnc_spawnGroup;
			};
			case 3:
			{
				_grp = [_safePos, resistance, (configFile >> "CfgGroups" >> "Guerrila" >> "VTE_Rebels" >> "infantry" >> "VTE_Civilian_Rebels")] call BIS_fnc_spawnGroup;
			};
		};

		waitUntil {!(isNull _grp)};

		_PMC_ind = _PMC_ind + ([_grp] call _countUnits);

		// put group into recycle script
		[_grp] execVM "PMC\PMC_groupRecycle.sqf";

		// add one group created.
		PMC_grp_ind = PMC_grp_ind + 1;

		diag_log format["Created new IND group of : %1, total: %2", (count units _grp), (count list pmc_ind_list)];

		// select target
		_targetpoint = PMC_loc select (floor random (count PMC_loc));
		// jiggle the fucker as it was array of cooridinates
		pmc_temp_logic setPos _targetpoint;
		pmc_homebase setPos _respawnpoint;

		// waypoints
		_ran = floor (random 3);
		switch (_ran) do
		{
			case 0:
		    	{
		    		// was pmc_temp_logic
				[_grp, _targetpoint, 100] call PMC_Patrol_Inf_Waypoints;
		    	};
			case 1:
			{
		    		// was pmc_temp_logic
				[_grp, _targetpoint, 0] call PMC_Guard_Inf_Waypoints;
			};
			case 2:
			{
		    		// was pmc_temp_logic
				[_grp, _targetpoint, 100] call PMC_Sentry_Inf_Waypoints;
			};
		};

		// create helicopter to ferry them into target
		//[_grp, pmc_homebase, pmc_temp_logic] execVM "PMC\PMC_Infantry_Transport_Airborne_Russian.sqf";
	};

	sleep _sleeptime;
};

diag_log format["**** War_IND.sqf ended with %1 created at %2 time.", _PMC_ind, time];
