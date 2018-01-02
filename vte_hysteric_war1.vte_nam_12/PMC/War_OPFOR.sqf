
private ["_grp","_PMC_opfor","_ran","_safePos","_targetpoint","_Max_OPFOR_On_Map","_victoryCondition","_sleeptime","_respawnpoint", "_countUnits"];

// maximum number of opfor on the map at one time
_Max_OPFOR_On_Map = 50; // 100 with three sides causes FPS 5 on server

// how many units to create until ending the loop
_victoryCondition = 1000;

// counter for how many units have been created
_PMC_opfor = 0;

// random sleep time
_sleeptime = (2 + random 5);

// hardcoded to top left corner for opfor units
_respawnpoint = getPosASL pmc_opfor_start_1;

_countUnits = compile preprocessFileLineNumbers "PMC\PMC_Count_Group_Units.sqf";

while {_PMC_opfor < _victoryCondition} do
{
	if ((count list pmc_opfor_list) < _Max_OPFOR_On_Map) then
	{
		_safePos = [_respawnpoint, 0, 100, 10, 0, 20, 0] call BIS_fnc_findSafePos;

		_ran = floor (random 10);
		switch (_ran) do
		{
			// NVA
			case 0:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_NVA" >> "infantry" >> "VTE_NVA_Infantry_Squad")] call BIS_fnc_spawnGroup;
			};
			case 1:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_NVA" >> "infantry" >> "VTE_NVA_Heavy_Weapons_Squad")] call BIS_fnc_spawnGroup;
			};
			case 2:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_NVA" >> "infantry" >> "VTE_NVA_Recon_Squad")] call BIS_fnc_spawnGroup;
			};
			case 3:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_NVA" >> "infantry" >> "VTE_NVA_Sapper_Squad")] call BIS_fnc_spawnGroup;
			};
			case 4:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_NVA" >> "infantry" >> "VTE_NVA_Sniper_Team")] call BIS_fnc_spawnGroup;
			};
			
			// VC
			case 5:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_VC" >> "infantry" >> "VTE_VC_Infantry_Squad")] call BIS_fnc_spawnGroup;
			};
			case 6:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_VC" >> "infantry" >> "VTE_VC_Heavy_Weapons_Squad")] call BIS_fnc_spawnGroup;
			};
			case 7:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_VC" >> "infantry" >> "VTE_VC_Recon_Squad")] call BIS_fnc_spawnGroup;
			};
			case 8:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_VC" >> "infantry" >> "VTE_VC_Sapper_Squad")] call BIS_fnc_spawnGroup;
			};
			case 9:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_VC" >> "infantry" >> "VTE_VC_Sniper_Team")] call BIS_fnc_spawnGroup;
			};
		};

		waitUntil {!(isNull _grp)};

		_PMC_opfor = _PMC_opfor + ([_grp] call _countUnits);

		// put group into recycle script
		[_grp] execVM "PMC\PMC_groupRecycle.sqf";

		// add one group created.
		PMC_grp_opfor = PMC_grp_opfor + 1;

		diag_log format["Created new OPFOR group of : %1, total: %2", (count units _grp), (count list pmc_opfor_list)];

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

diag_log format["**** War_OPFOR.sqf ended with %1 created at %2 time.", _PMC_opfor, time];
