
// if we are not server

private ["_grp","_hq","_pos","_vcl","_WaitTime","_landing_spot_helper"];

if (!isServer) exitWith{	titleText ["LZ Columbus has been seized, please hold the area secure until helicopter arrives and drops of supplies, thank you.", "plain down", 2];	hint "LZ Columbus has been seized, please hold the area secure until helicopter arrives and drops of supplies, thank you.";};

_pos = getPosASL pmc_2;
_hq = getPosASL CV_helopad;

diag_log "PMC_lz_columbus.sqf has been started.";

// how long time to wait betwen items when helo is unloading supplies
_WaitTime = 60;

// create new group for this helo
_grp = objNull;
_grp = createGroup west;
waitUntil {!(isNull _grp)};

"VTE_acpilot" createUnit [_hq, _grp, "", (random 1), "LIEUTENANT"];

_vcl = "VTE_ch47ca" createVehicle _hq;
(units _grp select 0) moveInDriver _vcl;
[_vcl, _grp] execVM "PMC\PMC_create_crew.sqf";

// fly fast, do not engage anyone except on self defence.
_grp setSpeedMode "FULL";
_grp setBehaviour "AWARE";
_grp setCombatMode "GREEN";

leader _grp move _pos;
sleep 5;

// until we are there or cant move anymore (shot down etc).
waitUntil
{
	sleep 2;
	(!alive _vcl || !canMove _vcl || (_vcl distance _pos) < 200 || unitReady _vcl);
};

// check if they are dead or not
if (!alive _vcl || !canMove _vcl) exitWith
{
	// delete the units in the group, group and helo vehicle
	{
		deleteVehicle _x;
	} forEach units _grp;
	deleteGroup _grp;
	deleteVehicle _vcl;
	// this doesnt show up on clients you moron...
	//hint "CH47 Chinook crashed, LZ Columbus is now closed. Sorry.";
};

// landing helper object that the idiotic AI wont fly and fuck themselves up into some river or tree etc.
_landing_spot_helper = createVehicle ["Land_VTE_bis_Heli_H", [(_pos select 0), (_pos select 1)+20, 0], [], 0, "NONE"];

// land the helo, shut down engine
_vcl land "land";
waitUntil
{
	sleep 1;
	(getPos _vcl select 2 < 2);
};

// delete the landing helper object
deleteVehicle _landing_spot_helper;

_vcl flyInHeight 0;
sleep _WaitTime;

// check if they are dead or not
if (!alive _vcl || !canMove _vcl) exitWith
{
	// delete the units in the group, group and helo vehicle
	{
		deleteVehicle _x;
	} forEach units _grp;
	deleteGroup _grp;
	deleteVehicle _vcl;
};

call compile preprocessFileLineNumbers "PMC\PMC_lz_columbus_objects.sqf";
//this = [this, 600, 1800, 0, false, false] execVM "PMC\vehicle_respawn.sqf";

// now we declare this LZ open, with this publicVariable, which also causes the triggers NOT to activate for JIP guys
PMC_lz_columbus_opened = true;
publicVariable "PMC_lz_columbus_opened";

// move blufor starting position permantently here.
pmc_blufor_start_6 setPosASL _pos;

// eventhandler for this was already declared in PMC_init.sqf
// broadcast it for clients
PMC_LZ_opened = ["columbus", _pos];
publicVariable "PMC_LZ_opened";

// fly the helo back to base
_vcl flyInHeight 100;
leader _grp move _hq;

waitUntil
{
	sleep 2;
	(!alive _vcl || !canMove _vcl || (_vcl distance _hq) < 200 || unitReady _vcl);
};

// delete the units in the group, group and helo vehicle
{
	deleteVehicle _x;
} forEach units _grp;
deleteGroup _grp;
deleteVehicle _vcl;
