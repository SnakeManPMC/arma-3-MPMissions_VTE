/*

	NVA and US Vehicles !

*/
private ["_grp","_pos","_safePos","_ran","_targetpoint"];

while {true} do
{
	// was "car" before, now just land vehicle
	if ( ('landVehicle' countType list pmc_opfor_list) < 15 ) then
	{
	// opfor
		// hardcoded to ?
		_pos = getPosASL pmc_opfor_start_1;
		_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;

		_ran = floor (random 4);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_NVA" >> "armored" >> "VTE_T54_Platoon")] call BIS_fnc_spawnGroup;
			};
			case 1:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_NVA" >> "armored" >> "VTE_T55_Platoon")] call BIS_fnc_spawnGroup;
			};
			case 2:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_NVA" >> "armored" >> "VTE_PT76_Platoon")] call BIS_fnc_spawnGroup;
			};
			case 3:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "VTE_NVA" >> "armored" >> "VTE_ZSU57_Platoon")] call BIS_fnc_spawnGroup;
			};
		};

		diag_log format["Created Land Vehicle OPFOR: %1", ('landVehicle' countType list pmc_opfor_list)];

		{
			_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
		} forEach units _grp;

		// select target
		_targetpoint = PMC_loc select (floor random (count PMC_loc));
		// jiggle the fucker as it was array of cooridinates
		pmc_temp_logic setPos _targetpoint;

		[_grp, _targetpoint, 100] call PMC_Guard_Vehicle_Waypoints;
	};

	if ( ('landVehicle' countType list pmc_blufor_list) < 15 ) then
	{
	// blufor
		// hardcoded to ?
		_pos = getPosASL pmc_blufor_start_1;
		_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;

		_ran = floor (random 5);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "armored" >> "VTE_M48_Platoon")] call BIS_fnc_spawnGroup;
			};
			case 1:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "armored" >> "VTE_M551_Platoon")] call BIS_fnc_spawnGroup;
			};
			case 2:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "armored" >> "VTE_M113_Platoon")] call BIS_fnc_spawnGroup;
			};
			case 3:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "armored" >> "VTE_M113_ACAV_Platoon")] call BIS_fnc_spawnGroup;
			};
			case 4:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "VTE_US" >> "armored" >> "VTE_M163_Platoon")] call BIS_fnc_spawnGroup;
			};
		};

		diag_log format["Created Land Vehicle BLUFOR: %1", ('landVehicle' countType list pmc_blufor_list)];

		{
			_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
		} forEach units _grp;

		// select target
		_targetpoint = PMC_loc select (floor random (count PMC_loc));
		// jiggle the fucker as it was array of cooridinates
		//pmc_temp_logic setPos _targetpoint;

		[_grp, _targetpoint, 100] call PMC_Guard_Vehicle_Waypoints;
	};

	sleep 60;
};
