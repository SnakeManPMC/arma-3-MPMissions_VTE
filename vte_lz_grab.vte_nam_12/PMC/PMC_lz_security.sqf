/*

Creates the LZ security troops which are brought in by helo.

this is server only script.

*/

private
[
	"_grp",
	"_hq",
	"_pos",
	"_RanP",
	"_RanT",
	"_reinf",
	"_vcl"
];

_pos = _this select 0;
_hq = getPosASL base_rock;
//random patrol radius
_RanP = 300;
//random patrol waypoint waiting timeout (seconds)
_RanT = 60;

// create new group for this helo
_grp = objNull;
_grp = createGroup west;
waitUntil {!(isNull _grp)};

"VTE_acpilot" createUnit [_hq, _grp, "", (random 1), "LIEUTENANT"];
"VTE_acpilot" createUnit [_hq, _grp, "", (random 1), "SERGEANT"];
"VTE_acpilot" createUnit [_hq, _grp, "", (random 1), "SERGEANT"];

_vcl = "VTE_uh1a" createVehicle _hq;
(units _grp select 0) moveInDriver _vcl;
(units _grp select 1) moveInGunner _vcl;
(units _grp select 2) moveInGunner _vcl;

// fly fast, engage someone
_grp setSpeedMode "FULL";
_grp setBehaviour "AWARE";
_grp setCombatMode "YELLOW";

leader _grp move _pos;
// cant see this from server ;)
//leader _grp sideChat format["This is %1 reporting in, loading troops to the LZ %2. Over.",(leader _grp),PMC_lz_num];

// create new group for the reinforcements
_reinf = objNull;
_reinf = createGroup (west);
waitUntil
{
	!(isNull _reinf);
};

"VTE_acofficer" createUnit [_hq, _reinf, "", 0.7, "SERGEANT"];
"VTE_acsoldier" createUnit [_hq, _reinf, "", 0.5, "SERGEANT"];
"VTE_acsoldierrto" createUnit [_hq, _reinf, "", 0.4, "corporal"];
"VTE_acsoldiermg" createUnit [_hq, _reinf, "", 1, "corporal"];
"VTE_acsoldierlaw" createUnit [_hq, _reinf, "", 0.4, "corporal"];
"VTE_acsoldierm79" createUnit [_hq, _reinf, "", 0.4, "corporal"];
"VTE_acsoldiermedic" createUnit [_hq, _reinf, "", 0.3, "private"];
"VTE_acsoldier" createUnit [_hq, _reinf, "", 0.3, "private"];
"VTE_acsoldier" createUnit [_hq, _reinf, "", 0.3, "private"];
"VTE_acsoldier" createUnit [_hq, _reinf, "", 0.3, "private"];
"VTE_acsoldier" createUnit [_hq, _reinf, "", 0.3, "private"];
"VTE_acsoldier" createUnit [_hq, _reinf, "", 0.3, "private"];

{
	_x moveInCargo _vcl;
} forEach units _reinf;

// wp #1
_reinf addWaypoint [_pos, _RanP];
[_reinf, 1] setWaypointBehaviour "SAFE";
[_reinf, 1] setWaypointCombatMode "RED";
[_reinf, 1] setWaypointSpeed "LIMITED";
[_reinf, 1] setWaypointFormation "STAG COLUMN";
[_reinf, 1] setWaypointType "MOVE";
[_reinf, 1] setWaypointTimeout [_RanT*2, 0, _RanT*20];
[_reinf, 1] setWaypointCompletionRadius 50;

// wp #2 through 4 and 5 which is cycle
_reinf addWaypoint [_pos, _RanP];
[_reinf, 2] setWaypointTimeout [_RanT*2, 0, _RanT*20];
[_reinf, 2] setWaypointCompletionRadius 50;
_reinf addWaypoint [_pos, _RanP];
[_reinf, 3] setWaypointTimeout [_RanT*2, 0, _RanT*20];
[_reinf, 3] setWaypointCompletionRadius 50;
_reinf addWaypoint [_pos, _RanP];
[_reinf, 4] setWaypointTimeout [_RanT*2, 0, _RanT*20];
[_reinf, 4] setWaypointCompletionRadius 50;

// wp cycle to reverse everything
_reinf addWaypoint [_pos, 0];
[_reinf, 5] setWaypointType "CYCLE";
[_reinf, 5] setWaypointTimeout [_RanT*5, 0, _RanT*30];
[_reinf, 5] setWaypointCompletionRadius 50;

leader _grp move _pos;
sleep 5;

waitUntil
{
	sleep 2;
	(!alive _vcl || unitready leader _grp);
};

// order him to land and wait
_vcl land "land";
waitUntil
{
	(!alive _vcl || getPos _vcl select 2 < 2);
};

// unload the troops from cargo
_vcl flyInHeight 0;
{
	unassignVehicle _x;
} forEach units _reinf;

// lets wait until group has disembarked from the helo
sleep 20;

_vcl flyInHeight 100;
leader _grp move _hq;

// wait until helo is back on base
waitUntil
{
	sleep 2;
	(!alive _vcl || unitReady leader _grp);
};

// delete the units in the group, group and helo vehicle
{
	deleteVehicle _x;
} forEach units _grp;
deleteGroup _grp;
deleteVehicle _vcl;
