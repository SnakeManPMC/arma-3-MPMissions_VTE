
private ["_grp","_PMC_blufor","_ran","_safePos","_targetpoint","_Max_BLUFOR_On_Map","_victoryCondition","_sleeptime","_respawnpoint", "_countUnits"];

// maximum number of opfor on the map at one time
_Max_BLUFOR_On_Map = 50; // 100 with three sides causes FPS 5 on server

// how many units to create until ending the loop
_victoryCondition = 1000;

// counter for how many units have been created
_PMC_blufor = 0;

// random sleep time
_sleeptime = (2 + random 5);

// hardcoded to ?
_respawnpoint = getPosASL pmc_blufor_start_1;

_countUnits = compile preprocessFileLineNumbers "PMC\PMC_Count_Group_Units.sqf";

while {_PMC_blufor < _victoryCondition} do
{
	if ((count list pmc_blufor_list) < _Max_BLUFOR_On_Map && (PMC_InfTransport < 10)) then
	{
		_safePos = [_respawnpoint, 0, 100, 10, 0, 20, 0] call BIS_fnc_findSafePos;

		_ran = floor (random 30);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_aircav_patrol")] call BIS_fnc_spawnGroup;
			};
			case 1:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_aircav_weapons")] call BIS_fnc_spawnGroup;
			};
			case 2:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_MFR_Team")] call BIS_fnc_spawnGroup;
			};
			case 3:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_MFR_Team_Heavy")] call BIS_fnc_spawnGroup;
			};
			case 4:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_SEAL_Team")] call BIS_fnc_spawnGroup;
			};
			case 5:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_SEAL_Team_Heavy")] call BIS_fnc_spawnGroup;
			};
			case 6:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_Army_Rifle_Squad")] call BIS_fnc_spawnGroup;
			};
			case 7:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_Army_Weapons_Squad")] call BIS_fnc_spawnGroup;
			};
			case 8:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_Army_Sniper_Team")] call BIS_fnc_spawnGroup;
			};
			case 9:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_USMC_Rifle_Squad")] call BIS_fnc_spawnGroup;
			};
			case 10:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_USMC_Fire_Team")] call BIS_fnc_spawnGroup;
			};
			case 11:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_USMC_AT_Squad")] call BIS_fnc_spawnGroup;
			};
			case 12:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_USMC_MG_Squad")] call BIS_fnc_spawnGroup;
			};
			case 13:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_USMC_Mortar_Squad")] call BIS_fnc_spawnGroup;
			};
			case 14:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_USMC_Sniper_Team")] call BIS_fnc_spawnGroup;
			};
			case 15:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_Special_Forces_A_Team")] call BIS_fnc_spawnGroup;
			};
			case 16:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_Special_Forces_Recon_Team")] call BIS_fnc_spawnGroup;
			};
			case 17:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_Special_Forces_Sniper_Team")] call BIS_fnc_spawnGroup;
			};
			case 18:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_LRRP_Team_Tiger")] call BIS_fnc_spawnGroup;
			};
			case 19:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_LRRP_Heavy_Team_Tiger")] call BIS_fnc_spawnGroup;
			};
			case 20:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_LRRP_Team_ERDL")] call BIS_fnc_spawnGroup;
			};
			case 21:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_LRRP_Team_Tiger_2")] call BIS_fnc_spawnGroup;
			};
			case 22:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_CIDG_1962")] call BIS_fnc_spawnGroup;
			};
			case 23:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_MIKE_1967")] call BIS_fnc_spawnGroup;
			};
			case 24:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_PRU_1968")] call BIS_fnc_spawnGroup;
			};
			case 25:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_ARVN_1972")] call BIS_fnc_spawnGroup;
			};
			case 26:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_SOG_Recon_Team")] call BIS_fnc_spawnGroup;
			};
			case 27:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_SOG_Hatchet_Force_Team")] call BIS_fnc_spawnGroup;
			};
			case 28:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_Australian_SAS_Patrol")] call BIS_fnc_spawnGroup;
			};
			case 29:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "infantry" >> "VTE_Australian_Rifle_Squad")] call BIS_fnc_spawnGroup;
			};
		};

		waitUntil {!(isNull _grp)};

		_PMC_blufor = _PMC_blufor + ([_grp] call _countUnits);
		
		// put group into recycle script
		[_grp] execVM "PMC\PMC_groupRecycle.sqf";

		// add one group created.
		PMC_grp_blufor = PMC_grp_blufor + 1;

		diag_log format["Created new BLUFOR group of : %1, total: %2, PMC_InfTransport: %3", (count units _grp), (count list pmc_blufor_list), PMC_InfTransport];

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
		[_grp, pmc_homebase, pmc_temp_logic] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
	};

	sleep _sleeptime;
};

diag_log format["**** War_BLUFOR.sqf ended with %1 created at %2 time.", _PMC_blufor, time];
