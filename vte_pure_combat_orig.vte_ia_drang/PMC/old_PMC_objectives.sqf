/*

	Briefing.html objectives!
	"1" ObjStatus!

*/

private [
	"_m","_markerobj","_z","_targetNum","_a","_ObjCount","_ran","_tlogic",
	"_targetNum","_targetpoint","_PMC_t","_MaxObjectives"
];

_PMC_CreateObjective =
{
	_m = format ["PMC_marker_%1", _a];
	_markerobj = createMarker [_m, _targetpoint];
	_markerobj setMarkerShape "ELLIPSE";
	_markerobj setMarkerColor "ColorRed";
	_markerobj setMarkerBrush "Solid";
	_markerobj setMarkerSize [200, 200];

	_z = createTrigger ["EmptyDetector", _targetpoint];
	_z setTriggerActivation ["WEST", "PRESENT", false];
	_z setTriggerArea [100, 100, 0, true];
	_z setTriggerStatements ["this", format ["hint 'PMC_Marker_%1: objective completed'; '%1' objStatus 'DONE'; 'PMC_Marker_%1' setMarkerColor 'ColorGreen'; 'PMC_Marker_%1' setMarkerType 'dot'; PMC_opfordead%1 = true; publicVariable ""PMC_opfordead%1""; player sideChat 'Objective %1 completed. Over.'",_a], ""];
};

// create 1 to _MaxObjectives objectives randomly
_PMC_t = [];
_PMC_t = PMC_targets;
_targetNum = count PMC_targets;
// max objectives to create
_MaxObjectives = 5;
_a = 0;
_ObjCount = round (random _MaxObjectives);

// stupid check
if (_ObjCount == 0) then
{
	if (PMC_debug) then { player sidechat "_objcount was zero..."; };
	_ObjCount = 1;
};

while { _a < _ObjCount || _a > (count PMC_targets) } do
{
	_a = _a + 1;

	// choose random posit, then remove it from selection so next time
	// we choose different random posit, no two units go in same location.
	_ran = (floor random _targetNum);
	_tlogic = (_PMC_t select _ran);
	_PMC_t = _PMC_t - [_tlogic];
	_targetNum = _targetNum - 1;
	_targetpoint = getPosASL _tlogic;

	// create the objective markers and triggers
	[] call _PMC_CreateObjective;

	// create some defenses and enemy stuff
	_handle = [_targetpoint] execVM "PMC\PMC_objective_def_OPFOR.sqf";
	// wait until its done (so we dont overwhelm the server etc).
	waitUntil {scriptDone _handle};

	// create random civilians and crap into the objective.
	_handle = [_targetpoint] execVM "PMC\PMC_objective_civilians.sqf";
	// wait until its done (so we dont overwhelm the server etc).
	waitUntil {scriptDone _handle};
};

// only 1 obective, shutdown others from briefing etc.
if (_ObjCount == 1) then
{
	"2" objStatus "HIDDEN";
	PMC_opfordead2 = true;
	publicVariable "PMC_opfordead2";
	"3" objStatus "HIDDEN";
	PMC_opfordead3 = true;
	publicVariable "PMC_opfordead3";
	"4" objStatus "HIDDEN";
	PMC_opfordead4 = true;
	publicVariable "PMC_opfordead4";
	"5" objStatus "HIDDEN";
	PMC_opfordead5 = true;
	publicVariable "PMC_opfordead5";
};

// 2 objectives
if (_ObjCount == 2) then
{
	"3" objStatus "HIDDEN";
	PMC_opfordead3 = true;
	publicVariable "PMC_opfordead3";
	"4" objStatus "HIDDEN";
	PMC_opfordead4 = true;
	publicVariable "PMC_opfordead4";
	"5" objStatus "HIDDEN";
	PMC_opfordead5 = true;
	publicVariable "PMC_opfordead5";
};

// 3 objectives
if (_ObjCount == 3) then
{
	"4" objStatus "HIDDEN";
	PMC_opfordead4 = true;
	publicVariable "PMC_opfordead4";
	"5" objStatus "HIDDEN";
	PMC_opfordead5 = true;
	publicVariable "PMC_opfordead5";
};

// 4 objectives
if (_ObjCount == 4) then
{
	"5" objStatus "HIDDEN";
	PMC_opfordead5 = true;
	publicVariable "PMC_opfordead5";
};
