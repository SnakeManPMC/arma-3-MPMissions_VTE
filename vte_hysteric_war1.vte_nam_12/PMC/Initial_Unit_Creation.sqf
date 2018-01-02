
// create initial units

private ["_grp","_a","_respawnpoint","_ran","_safePos", "_tmpLocations"];

// tmp locations where we subtract
_tmpLocations = [];
_tmpLocations = PMC_loc;
diag_log format["At start _tmpLocations is: %1.", count _tmpLocations];

/*

	OPFOR

*/
_a = 0;
while {_a < 10 && (count _tmpLocations > 0)} do
{
	_a = _a + 1;

	// select target
	_respawnpoint = _tmpLocations select (floor random (count _tmpLocations));
	_tmpLocations = _tmpLocations - [_respawnpoint];
	_safePos = [_respawnpoint, 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;
	_respawnpoint = _safePos;

	_ran = floor (random 11);
	switch (_ran) do
	{
		case 0:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_NVAInfantry_Squad")] call BIS_fnc_spawnGroup;
		};
		case 1:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_NVA_Heavy_Weapons_Squad")] call BIS_fnc_spawnGroup;
		};
		case 2:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_NVA_Recon_Squad")] call BIS_fnc_spawnGroup;
		};
		case 3:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_NVA_Sapper_Squad")] call BIS_fnc_spawnGroup;
		};
		case 4:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "")] call BIS_fnc_spawnGroup;
		};
		case 5:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_NVA_Sniper_Team")] call BIS_fnc_spawnGroup;
		};
		case 6:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_VC_Infantry_Squad")] call BIS_fnc_spawnGroup;
		};
		case 7:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_VC_Heavy_Weapons_Squad")] call BIS_fnc_spawnGroup;
		};
		case 8:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_VC_Recon_Squad")] call BIS_fnc_spawnGroup;
		};
		case 9:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_VC_Sapper_Squad")] call BIS_fnc_spawnGroup;
		};
		case 10:
		{
			_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "VTE_east" >> "VTE_Groups_NVAVC" >> "VTE_VietcongGroups" >> "VTE_VC_Sniper_Team")] call BIS_fnc_spawnGroup;
		};
	};

	waitUntil {!(isNull _grp)};

	// put group into recycle script
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	// add one group created.
	PMC_grp_blufor = PMC_grp_blufor + 1;

	[_grp, leader _grp, 0] call PMC_Guard_Inf_Waypoints;
};




/*

	BLUFOR

*/
_a = 0;
while {_a < 10 && (count _tmpLocations > 0)} do
{
	_a = _a + 1;

	// select target
	_respawnpoint = _tmpLocations select (floor random (count _tmpLocations));
	_tmpLocations = _tmpLocations - [_respawnpoint];
	_safePos = [_respawnpoint, 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;
	_respawnpoint = _safePos;

	_ran = floor (random 30);
	switch (_ran) do
	{
		case 0:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTEaircav")] call BIS_fnc_spawnGroup;
		};
		case 1:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTEaircavwpns")] call BIS_fnc_spawnGroup;
		};
		case 2:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_MFRteam8")] call BIS_fnc_spawnGroup;
		};
		case 3:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_MFRteam12")] call BIS_fnc_spawnGroup;
		};
		case 4:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_sealteam7")] call BIS_fnc_spawnGroup;
		};
		case 5:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_sealteam12")] call BIS_fnc_spawnGroup;
		};
		case 6:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_usarmyinfantry")] call BIS_fnc_spawnGroup;
		};
		case 7:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_usarmyinfantrywpns")] call BIS_fnc_spawnGroup;
		};
		case 8:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTEusarmy_sniper_team")] call BIS_fnc_spawnGroup;
		};
		case 9:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_USMCinfantry")] call BIS_fnc_spawnGroup;
		};
		case 10:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_USMCinfantryfteam")] call BIS_fnc_spawnGroup;
		};
		case 11:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_USMCinfantryat")] call BIS_fnc_spawnGroup;
		};
		case 12:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_USMCinfantrymg")] call BIS_fnc_spawnGroup;
		};
		case 13:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_USMCinfantrymort")] call BIS_fnc_spawnGroup;
		};
		case 14:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTEus_sniper_team")] call BIS_fnc_spawnGroup;
		};
		case 15:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_sfTeam")] call BIS_fnc_spawnGroup;
		};
		case 16:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_sfRecon")] call BIS_fnc_spawnGroup;
		};
		case 17:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTESF_sniper_team")] call BIS_fnc_spawnGroup;
		};
		case 18:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_lrrpteam6")] call BIS_fnc_spawnGroup;
		};
		case 19:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_lrrpteam12")] call BIS_fnc_spawnGroup;
		};
		case 20:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_cidg1962")] call BIS_fnc_spawnGroup;
		};
		case 21:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_mike1967")] call BIS_fnc_spawnGroup;
		};
		case 22:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_PRU1968")] call BIS_fnc_spawnGroup;
		};
		case 23:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_arvn1972")] call BIS_fnc_spawnGroup;
		};
		case 24:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_SOG_RT")] call BIS_fnc_spawnGroup;
		};
		case 25:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_SOG_HF")] call BIS_fnc_spawnGroup;
		};
		case 26:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_RARSAS_Patrol")] call BIS_fnc_spawnGroup;
		};
		case 27:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_RARInf_Squad")] call BIS_fnc_spawnGroup;
		};
		case 28:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_LRRP_Squad")] call BIS_fnc_spawnGroup;
		};
		case 29:
		{
			_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "VTE_west" >> "VTE_Groups_US" >> "VTE_vietnamunits" >> "VTE_LRRP_Tiger_Squad")] call BIS_fnc_spawnGroup;
		};
	};

	waitUntil {!(isNull _grp)};

	// put group into recycle script
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	// add one group created.
	PMC_grp_opfor = PMC_grp_opfor + 1;

	[_grp, leader _grp, 0] call PMC_Guard_Inf_Waypoints;
};

diag_log format["At end _tmpLocations is: %1.", count _tmpLocations];
