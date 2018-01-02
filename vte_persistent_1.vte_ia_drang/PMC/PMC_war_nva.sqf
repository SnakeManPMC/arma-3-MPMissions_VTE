
private
[
	"_grp",
	"_Max_OPFOR_On_Map",
	"_respawnpoint",
	"_sleeptime",
	"_targetpoint",
	"_victoryCondition"
];

// how many enemies to create, 500 / 9 = 55 groups.
_victoryCondition = 500;

// maximum number of opfor on the map at one time
_Max_OPFOR_On_Map = 100;

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

// PMC_Create_NVA
call compile preProcessFileLineNumbers "PMC\PMC_Create_NVA.sqf";

// wait until mission starts and pmc_opforunits trigger is usable.
waitUntil
{
	(count (list pmc_opforunits) > 0);
};

while {PMC_opfor < _victoryCondition} do
{
	if ((EAST countSide (list pmc_opforunits)) < _Max_OPFOR_On_Map) then
	{
		// random starting location
		_respawnpoint = ["OPFOR"] call PMC_SelectStartPosit;

		// create 1st squad of OPFOR
		_grp = [_respawnpoint] call PMC_Create_NVA;

		// select target
		_targetpoint = call PMC_Select_Target;

		// create waypoints
		//[_grp, _targetpoint, 100] call PMC_Patrol_Inf_Waypoints;

		// create second squad of OPFOR
		//_grp = [_respawnpoint] call PMC_Create_NVA;

		// select target
		//_targetpoint = call PMC_Select_Target;

		// create waypoints
		[_grp, _targetpoint, 0] call PMC_Guard_Inf_Waypoints;

		// add our created enemies with 9
		PMC_opfor = PMC_opfor + 9;
		publicVariable "PMC_opfor";
	};
	sleep _sleeptime;
};

// small wait
sleep 60;

// when enemy count drops below value, end mission!
if ((EAST countSide (list pmc_opforunits)) < 20) then
{
	PMC_mcomplete = true;
	publicVariable "PMC_mcomplete";
};
