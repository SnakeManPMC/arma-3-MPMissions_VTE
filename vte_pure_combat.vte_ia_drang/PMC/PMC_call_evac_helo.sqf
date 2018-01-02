
if (PMC_call_evac_helo_running) exitWith {};

player sidechat "PMC_call_evac_helo.sqf started!";

diag_log "PMC_call_evac_helo.sqf started!";

PMC_call_evac_helo_running = true;
publicVariable "PMC_call_evac_helo_running";

//res = ["VTE_uh1", CV_helopad, pmc_1] execVM "PMC\PMC_call_evac_helo.sqf";
// onMapSingleClick "PMC_arty_81mm_target_pos = _pos; publicVariable ""PMC_arty_81mm_target_pos""; onMapSingleClick ''; true;";
private
[
	"_evac",
	"_HeloGrp",
	"_landingzone",
	"_rtb",
	"_vcl"
];

_rtb = getPosASL (_this select 1);
_landingzone = getPosASL (_this select 2);

_evac = getPosASL player;

_vcl = objNull;
_HeloGrp = objNull;
_HeloGrp = createGroup (west);
waitUntil
{
	!(isNull _HeloGrp);
};
_vcl = "VTE_uh1" createVehicleLocal _rtb;
"VTE_acpilot" createUnit [_rtb, _HeloGrp, "", 1, "SERGEANT"];

(units _HeloGrp select 0) moveInDriver _vcl;
// create crew
[_vcl, _HeloGrp] execVM "PMC\PMC_Create_Crew.sqf";
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _HeloGrp;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

[_HeloGrp] execVM "PMC\PMC_groupRecycle.sqf";

_HeloGrp setBehaviour "AWARE";
_HeloGrp setCombatMode "GREEN";
_HeloGrp setSpeedMode "FULL";
_HeloGrp setFormation "WEDGE";

// order him to move into EVAC location
_vcl move _evac;

// small wait
sleep 3;

// some radio traffic, lifting off into the mission.
leader _HeloGrp sideChat format["This is %1, we are lifting off now. Hold tight. Over.", leader _HeloGrp];

// lets wait until he is ready or within 300m of the LZ, or helo cant move.
waitUntil
{
	sleep 2;
	( ( (unitReady _vcl) || (_vcl distance _landingzone) < 200) || !(canMove _vcl) );
};

diag_log format ["Nam_InfTransport %1, approach check. unitReady: %2, LZ dist: %3, canMove %4", _HeloGrp, unitReady _vcl, (_vcl distance _landingzone), canMove _vcl];

// death check, if helo or crew is dead, just exit this script.
if (!alive _vcl || !alive leader _HeloGrp) exitWith
{
	PMC_call_evac_helo_running = false;
	publicVariable "PMC_call_evac_helo_running";
	diag_log format ["Nam_InfTransport %1 has exited with catastrophic failure. alive _vcl: %2, alive leader _HeloGrp: %3, posit: %4", _HeloGrp, alive _vcl, alive leader _HeloGrp, getPosASL _vcl];
};

// helo vehicle and the group leader is alive, put some radio traffic.
if ((alive leader _HeloGrp) && (canMove _vcl)) then
{
	leader _HeloGrp sideChat format["%1 reporting. Get ready for extraction. Over.", leader _HeloGrp];
};

// order him to land
_vcl land "GET IN";

// little breathing room for landing...
sleep 5;

// wait until he has landed
waitUntil
{
	sleep 2;
	((getPosASL _vcl) select 2 < 2);
};

// if players arent in the helo in 10 secs, then they are screwed.
sleep 10;

leader _HeloGrp sideChat format["%1 reporting. We are taking off. Over.", leader _HeloGrp];

_vcl move _landingzone;

// lets wait until his within 100m of landingzone, or helo is dead.
waitUntil
{
	sleep 2;
	( ( (unitReady _vcl) || (_vcl distance _landingzone) < 200) || !(canMove _vcl) );
};

// death check, if helo or crew is dead, just exit this script.
if (!alive _vcl || !alive leader _HeloGrp) exitWith
{
	PMC_call_evac_helo_running = false;
	publicVariable "PMC_call_evac_helo_running";
	diag_log format ["Nam_InfTransport %1 has exited with catastrophic failure. alive _vcl: %2, alive leader _HeloGrp: %3, posit: %4", _HeloGrp, alive _vcl, alive leader _HeloGrp, getPosASL _vcl];
};

leader _HeloGrp sideChat format["This is %1. Time to disembark, hold on. Over.", leader _HeloGrp];

// order him to land
_vcl land "GET OUT";

// little breathing room for landing...
sleep 5;

_vcl flyInHeight 0;

// wait until he has landed
waitUntil
{
	sleep 2;
	((getPosASL _vcl) select 2 < 2);
};

// if players arent in the helo in 30 secs, then they are screwed.
sleep 10;

_vcl flyInHeight 50;

// order him to move back into HQ
_vcl move _rtb;

// small wait
sleep 3;

// lets wait until his within 100m of HQ, or helo is dead.
waitUntil
{
	sleep 2;
	( ( (unitReady _vcl) || (_vcl distance _rtb) < 200) || !(canMove _vcl) );
};

diag_log format ["Nam_InfTransport %1, RTB check. unitReady: %2, rtb dist: %3, canMove %4, _rtb: %5", _HeloGrp, unitReady _vcl, (_vcl distance _rtb), canMove _vcl, _rtb];

// if she arrived, if shes ok, then just delete her and her crew.
if (alive _vcl && alive leader _HeloGrp) then
{
	diag_log format ["Nam_InfTransport(%1) %2 has exited with (ALL OK) alive _vcl: %3, alive leader _HeloGrp: %4. POSIT: %5, _rtb: %6", PMC_InfTransport, _HeloGrp, alive _vcl, alive leader _HeloGrp, getPosASL _vcl, _rtb];
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
}
else
{
	diag_log format ["Nam_InfTransport(%1) %2 has exited with (NOT OK) alive _vcl: %3, alive leader _HeloGrp: %4. POSIT: %5, _rtb: %6", PMC_InfTransport, _HeloGrp, alive _vcl, alive leader _HeloGrp, getPosASL _vcl, _rtb];
};

PMC_call_evac_helo_running = false;
publicVariable "PMC_call_evac_helo_running";
