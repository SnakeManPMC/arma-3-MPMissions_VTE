
private
[
	"_grp",
	"_Max_BLUFOR_On_Map",
	"_respawnpoint",
	"_sleeptime",
	"_targetpoint",
	"_victoryCondition"
];

// how many enemies to create, 500 / 9 = 55 groups.
_victoryCondition = 250;

// maximum number of opfor on the map at one time
_Max_BLUFOR_On_Map = 100;

// random sleep time
_sleeptime = (5 + random 2);

// PMC_SelectStartPosit starting position selecting function
call compile preProcessFileLineNumbers "PMC\PMC_SelectStartPosit.sqf";

// PMC_Select_Target
call compile preProcessFileLineNumbers "PMC\PMC_Select_Target.sqf";

// PMC_Patrol_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";

// PMC_Guard_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Inf_Waypoints.sqf";

// PMC_Create_AirCav
call compile preProcessFileLineNumbers "PMC\PMC_Create_AirCav.sqf";

// wait until mission starts and pmc_opforunits trigger is usable.
waitUntil
{
	(count (list pmc_bluforunits) > 0);
};

while {PMC_blufor < _victoryCondition} do
{
	if ((WEST countSide (list pmc_bluforunits)) < _Max_BLUFOR_On_Map) then
	{
		// random starting location
		_respawnpoint = ["BLUFOR"] call PMC_SelectStartPosit;

		// create 1st squad of BLUFOR
		_grp = [_respawnpoint] call PMC_Create_AirCav;

		// select target
		_targetpoint = call PMC_Select_Target;

		// create waypoints
		//[_grp, _targetpoint, 100] call PMC_Patrol_Inf_Waypoints;

		// create second squad of BLUFOR
		//_grp = [_respawnpoint] call PMC_Create_AirCav;

		// select target
		//_targetpoint = call PMC_Select_Target;

		// create waypoints
		[_grp, _targetpoint, 0] call PMC_Guard_Inf_Waypoints;

		// add our created enemies with 9
		PMC_blufor = PMC_blufor + 12;
		publicVariable "PMC_blufor";
	};
	sleep _sleeptime;
};
