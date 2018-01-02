/*

ugly patching for VTE :)

Temporary inf helo transport script, dunno why the original one is not working,
maybe because of the [_HeloGrp, _wp] setWaypointType "TR UNLOAD"; is not working?

I have no idea ;)

Syntax:
[group, startPos, targetPos] execVM "PMC\PMC_Nam_InfTransport.sqf";

Requires:
PMC\PMC_groupRecycle.sqf - for group removal.
PMC\PMC_killed.sqf - for dead body removal.

*/

private [
	"_grp","_respawnpoint","_targetpoint","_vcl","_HeloGrp"
];

_grp = _this select 0;
_respawnpoint = _this select 1;
_targetpoint = _this select 2;

// we increment our count for transports active.
PMC_InfTransport = PMC_InfTransport + 1;
publicVariable "PMC_InfTransport";

_vcl = objNull;
_HeloGrp = objNull;
_HeloGrp = createGroup (west);
waitUntil
{
	!(isNull _HeloGrp);
};
// create huey
_vcl = "VTE_uh1a" createVehicle _respawnpoint;
"VTE_acpilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "SERGEANT"];
"VTE_acpilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "CORPORAL"];
"VTE_acpilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "CORPORAL"];
(units _HeloGrp select 0) moveInDriver _vcl;
(units _HeloGrp select 1) moveinTurret [_vcl,[0]];
(units _HeloGrp select 2) moveinTurret [_vcl,[1]];
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _HeloGrp;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

[_HeloGrp] execVM "PMC\PMC_groupRecycle.sqf";

// some fun ;)
addSwitchableUnit (units _HeloGrp select 1);
addSwitchableUnit (units _HeloGrp select 2);

// load our guys
{
	_x assignAsCargo _vcl;
	[_x] orderGetIn true;
} forEach units _grp;

_HeloGrp setBehaviour "AWARE";
_HeloGrp setCombatMode "YELLOW";
_HeloGrp setSpeedMode "FULL";
_HeloGrp setFormation "WEDGE";

// order him to move into LZ
_vcl move _targetpoint;

// some radio traffic, lifting off into the mission.
leader _HeloGrp sideChat format["This is %1, cargo onboard, we are lifting off now. Over.",leader _HeloGrp];

// lets wait until his within 100m of the LZ, or helo is dead.
waitUntil
{
	sleep 2;
	( ((_vcl distance _targetpoint) < 100) or !(canMove _vcl) );
};

// death check, if helo or crew is dead, just exit this script.
if (!alive _vcl || !alive leader _HeloGrp) exitWith
{
	// we decrease our count for transports active.
	PMC_InfTransport = PMC_InfTransport - 1;
	publicVariable "PMC_InfTransport";
};

// helo vehicle and the group leader is alive, put some radio traffic.
if ((alive leader _HeloGrp) && (canMove _vcl)) then
{
	leader _HeloGrp sideChat format["%1 reporting. Setting her down now, disembarking cargo. Over.",leader _HeloGrp];
};

// dumb the cargo out
{
	unassignVehicle _x;
} forEach units _grp;

// order him to move back into HQ
_vcl move _respawnpoint;

// lets wait until his within 100m of HQ, or helo is dead.
waitUntil
{
	sleep 2;
	( ((_vcl distance _respawnpoint) < 100) or !(canMove _vcl) );
};

// if she arrived, if shes ok, then just delete her and her crew.
if (alive _vcl && alive leader _HeloGrp) then
{
	{
		deleteVehicle _x;
	} forEach units _HeloGrp;
	deleteVehicle _vcl;

	// check that the group is deleted.
	waitUntil
	{
		deleteGroup _HeloGrp;
		(isNull _HeloGrp);
	};

	// we decrease our count for transports active.
	PMC_InfTransport = PMC_InfTransport - 1;
	publicVariable "PMC_InfTransport";
};
